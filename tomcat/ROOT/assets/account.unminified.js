app.controller('account', ['$scope', function($scope) {
	$scope.username = getCurrentUsername();
	$scope.currentEmail = getCurrentEmail();
}]);
