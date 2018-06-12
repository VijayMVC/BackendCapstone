app.controller("HomeController", ["$scope", "$location", function ($scope, $location) {
    $scope.message = "Welcome! Choose your Role:";

    $scope.showTeacherView = function () {
        $location.path("/teacherview");
    }

    $scope.showStudentView = function () {
        $location.path("/studentview");
    }


}]);