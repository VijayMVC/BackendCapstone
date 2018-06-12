app.controller("StudentViewController", ["$scope", "$http", "$location", function ($scope, $http, $location) {

    $scope.homeroomTeacher = {};
    

    $http.get("/api/teachers").then(function (result) {
        $scope.homeroomTeachers = result.data;
        console.log($scope.homeroomTeachers);
    });

    $scope.selectTeacher = () => {
        console.log("i selected a teacher");
        $http.get(`/api/teachers/${$scope.homeroomTeacher.TeacherId}`).then(function (result) {
            console.log(result.data);
        });
    };


}]);