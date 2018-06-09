app.controller("EditTeacherInfoController", ["$scope", "$http", "$location", "$routeParams", function ($scope, $http, $location, $routeParams) {

    $scope.updatedTeacher = {};

    $http.get(`/api/teachers/${$routeParams.id}`).then(function (result) {
        $scope.updatedTeacher = result.data;
    });
   

    var updateTeacherInfo = function (teacher) {
        return $http.post(`api/teachers/editTeacher/${teacher.TeacherId}`, JSON.stringify(teacher));
    };


    $scope.Submit = function (teacher) {

        updateTeacherInfo(teacher).then(function () {
            $location.path("/teachers");
        }).catch(function (error) {
            console.log(error);
        });

    };



}]);