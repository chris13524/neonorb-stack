app.controller('account', ['$scope', '$http', function($scope, $http) {
	$scope.username = getCurrentUsername();
	$scope.currentEmail = getCurrentEmail();
	
	// TODO switch account page to be a single-page update things
	// below does nothing
	$scope.generalSubmit = function(data) {
		$http.post('/user/account', JSON.stringify(data)).success(function() {
			console.log("success!");
		});
	}
}]);
