app.controller('account', ['$scope', '$http', function($scope, $http) {
	$scope.username = getCurrentUsername();
	$scope.currentEmail = getCurrentEmail();
	
	$scope.generalSubmit = function(data) {
		$http.post('/user/account', JSON.stringify(data)).success(function() {
			console.log("success!");
		});
	}
}]);

console.log("${session.user.username}");
