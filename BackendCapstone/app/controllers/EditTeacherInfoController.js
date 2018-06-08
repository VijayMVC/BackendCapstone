app.controller("EditTeacherInfoController", "$scope", "$http", "$location", function ($scope, $http, $location) {

    $scope.updatedTeacher = {};

    var updateTeacherInfo = function (teacher) {
        return $http.post("api/teachers", JSON.stringify(teacher));
    };


    $scope.Submit = function () {

        var updatedTeacher = {
            "firstname": $scope.updatedTeacher.firstname,
            "lastname": $scope.updatedTeacher.lastname,
            //"ishomeroomteacher": $scope.updatedTeacher.,
            "location": $scope.updatedTeacher.location,
            "roomnumber": $scope.updatedTeacher.roomnumber
        };

        updateTeacherInfo(teacher).then(function () {
            $location.path("/teachers");
        }).catch(function (error) {
            console.log(error);
        });

    };



});