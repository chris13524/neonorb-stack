// ----- cookies -----

// sets a cookie
function setCookie(cname, cvalue, exdays) {
	var d = new Date();
	d.setTime(d.getTime() + (exdays*24*60*60*1000));
	var expires = "expires="+d.toUTCString();
	document.cookie = cname + "=" + cvalue + "; " + expires;
}

// gets a cookie
function getCookie(cname) {
	var name = cname + "=";
	var ca = document.cookie.split(';');
	for(var i=0; i<ca.length; i++) {
		var c = ca[i];
		while (c.charAt(0)==' ') {
			c = c.substring(1);
		}
		if (c.indexOf(name) == 0) {
			return c.substring(name.length,c.length);
		}
	}
	return "";
}

// ----- utils -----

// makes a HTTP GET request async
function httpGetAsync(theUrl, callback) {
	var xmlHttp = new XMLHttpRequest();
	xmlHttp.onreadystatechange = function() { 
		if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
			callback(xmlHttp.responseText);
		}
	}
	xmlHttp.open("GET", theUrl, true); // true for asynchronous 
	xmlHttp.send(null);
}

function initNow(stomp, derbyId){
	var app = angular.module('derby-now',[]);
	
	// initialize websocket
	var socket = new SockJS(stomp);
	var client = Stomp.over(socket);
	
	// get IDs
	var clientId = getCookie('derby-now-' + derbyId);
	
	app.run(['$rootScope', function($rootScope) {
		// sets the derby and client IDs in a cookie for one (1) day
		function setIdCookie() {
			setCookie('derby-now-' + derbyId, clientId, 1);
		}
		
		// handles websocket messages
		function messageHandler(message) {
			var event = eval('(' + message.body + ')');
			var method = event.method;
			
			switch(method) {
				case 'grant':
					var permission = event.permission;
					
					switch(permission){
						case 'releaseCars':
							$rootScope.permissionReleaseCarsGranted();
							break;
						default:
							console.log("unexpected permission grant: " + permission);
					}
					
					break;
				case 'revoke':
					var permission = event.permission;
					
					switch(permission){
						case 'releaseCars':
							$rootScope.permissionReleaseCarsRevoked();
							break;
						default:
							console.log("unexpected permission revoke: " + permission);
					}
					
					break;
				case 'exception':
					console.log('Server threw exception: ' + event.code);
					break
				default:
					console.log("unexpected method: " + method);
			}
		}
		
		// connects to the websocket so we can retrive messages
		function connect() {
			client.subscribe('/topic/now/' + derbyId + '/' + clientId, messageHandler);
			
			// request all information
			call('"method":"requestAll"');
		}
		
		client.connect({}, function() {
			if(clientId == "") {
				// ask the server for a client ID
				httpGetAsync('/now/' + derbyId + '/init', function(response) {
					clientId = response;
					
					// set the cookie so we can get this later
					setIdCookie();
					
					// connect to the websocket
					connect();
				});
			} else {
				// renew cookie
				setIdCookie();
				
				// connect to the websocket
				connect();
			}
		});
	}]);
	
	// standard call to server
	function call(message) {
		client.send('/app/now', {}, '{' +
				'"derbyId":"' + derbyId + '",' + 
				'"clientId":"' + clientId + '",' +
				message
				+ '}');
	}
	
	app.controller('ReleaseCarsController', ['$scope', '$rootScope', function($scope, $rootScope) {
		// TODO switch this to a service
		$scope.permissionReleaseCars = false;
		
		$rootScope.permissionReleaseCarsGranted = function() {
			$scope.$apply(function(){
				$scope.permissionReleaseCars = true;
			})
		};
		$rootScope.permissionReleaseCarsRevoked = function() {
			$scope.$apply(function(){
				$scope.permissionReleaseCars = false;
			})
		};
		
		$scope.releaseCars = function() {
			call('"method":"releaseCars"');
		};
		
		$scope.requestPermissionReleaseCars = function() {
			call('"method":"requestPermission",' +
				 '"permission":"releaseCars"'
				);
		};
	}]);
}
