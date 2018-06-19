app.controller("StudentViewController", ["$routeParams", "$scope", "$http", "$location", function ($routeParams, $scope, $http, $location) {

    $scope.homeroomTeacher = {};
    $scope.student = {};
    $scope.location = {};
    $scope.showMain = true;
    $scope.showChooseLocation = false;
    

    $http.get("/api/teachers").then(function (result) {
        $scope.homeroomTeachers = result.data;
    });

    $scope.selectTeacher = () => {
        $http.get(`/api/teachers/${$scope.homeroomTeacher.TeacherId}`).then(function (result) {
            $scope.homeroomTeacher = result.data;
            showStudents();
        });
    };

    var showStudents = () => {
        $http.get(`api/students/${$scope.homeroomTeacher.TeacherId}`).then(function (result) {
            $scope.students = result.data;
        });
    };

    $scope.markStudentPresent = (id) => {
        $http.put(`/api/students/markpresent/${id}`).then(function (result) {
            $scope.student = result.data;
            showStudents();
        });
    }

    var markInHomeroom = (id) => {
        $http.put(`/api/students/student/inhomeroom/${id}`).then(function (result) {
            showStudents();
        });

    }

    var markNotInHomeroom = (id) => {
        $http.put(`/api/students/student/notinhomeroom/${id}`).then(function (result) {
            showStudents();
        });
    }

    $scope.exitRoom = (id) => {
        $http.get("api/locations").then(function (result) {
            $scope.locations = result.data;
        });
        $scope.showMain = false;
        $scope.showChooseLocation = true;
        getSingleStudent(`${id}`);
    }

    var getSingleStudent = (id) => {
        $http.get(`api/students/student/${id}`).then(function (result) {
            $scope.student = result.data;
        });
    }

    $scope.chooseLocation = (locationId, studentId) => {
        $http.get(`/api/locations/${locationId}`).then(function (result) {
            $scope.location = result.data;
        });
        $scope.showChooseLocation = false;
        $scope.showMain = true;
        setCheckOutTime(locationId, studentId);
        markNotInHomeroom(studentId);
    }

    var setCheckOutTime = (locationId, studentId) => {
        $http.post(`api/studentLocations/exitRoom/location/${locationId}/student/${studentId}`)
    }

    var setCheckInTime = (locationId, studentId) => {
        $http.post(`api/studentLocations/ReturnToRoom/location/${locationId}/student/${studentId}`)
    }

    $scope.returnToRoom = (locationId, studentId) => {
        setCheckInTime(locationId, studentId);
        markInHomeroom(studentId);
        showStudents();
    }


}]);