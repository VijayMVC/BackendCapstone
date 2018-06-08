app.controller("TeachersController", ["$scope", "$http", "$location", function ($scope, $http, $location) {

    console.log("hello");

    var getAllTeachers = function () {
        $http.get("/api/teachers").then(function (result) {
            $scope.teachers = result.data;
            console.log($scope.teachers);
        });
    };

    getAllTeachers();


}]);