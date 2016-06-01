// username
app.directive('usernameAvailable', ['$http', '$q', '$timeout', function($http, $q, $timeout) {
	return {
		restrict: 'A',
		require: 'ngModel',
		scope: {
			usernameAvailable: '='
		},
		link: function(scope) {
			$timeout(function(){
				scope.usernameAvailable.$asyncValidators.usernameAvailable = function(username) {
					if(typeof(getCurrentUsername) != 'undefined' && username == getCurrentUsername()) {
						return true;
					} else {
						return $http.get('/user/usernameAvailable?username=' + username).then(function() {
							return true;
						}, function(){
							return $q.reject('exists');
						});
					}
				};
			});
		}
	} 
}]);

// email
app.directive('emailAvailable', ['$http', '$q', '$timeout', function($http, $q, $timeout) {
	return {
		restrict: 'A',
		require: 'ngModel',
		scope: {
			emailAvailable: '='
		},
		link: function(scope) {
			$timeout(function(){
				scope.emailAvailable.$asyncValidators.emailAvailable = function(email) {
					if(typeof(getCurrentEmail) != 'undefined' && email == getCurrentEmail()) {
						return $q.resolve();
					} else {
						return $http.get('/user/emailAvailable?email=' + email).then(function() {
							return true;
						}, function(){
							return $q.reject('exists');
						});
					}
				};
			});
		}
	} 
}]);

// compare two models to make sure they are the same
app.directive('equalTo', function() {
	return {
		restrict: 'A',
		require: 'ngModel',
		scope: {
			otherModelValue: '=equalTo'
		},
		link: function(scope, elem, attrs, controller) {
			controller.$validators.equalTo = function(modelValue) {
				if(typeof(scope.otherModelValue) == 'undefined'){
					return false;
				}
				return modelValue == scope.otherModelValue.$viewValue;
			};
			scope.$watch(function() {
				controller.$validate();
			});
			scope.$watch('otherModelValue', function() {
				controller.$validate();
			});
		}
	};
});
