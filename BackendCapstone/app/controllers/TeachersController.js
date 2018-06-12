app.controller("TeachersController", ["$scope", "$http", "$location", function ($scope, $http, $location) {


    $http.get("/api/teachers").then(function (result) {
        $scope.teachers = result.data;
        console.log($scope.teachers);
    });

    $scope.editTeacherInformation = function (teacherId) {
        $location.path(`/editTeacher/${teacherId}`);
    };

}]);