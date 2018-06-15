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

    //var markInHomeroom = () => {
    //    $http.put(`/api/students/student/inhomeroom/${$scope.student.StudentId}`).then(function (result) {
    //        $scope.student = result.data;
    //    })
    //}

    $scope.chooseLocation = (id) => {
        $http.get(`/api/locations/${id}`).then(function (result) {
            $scope.location = result.data;
        });
        $scope.student.InHomeroom = false;
        $scope.showChooseLocation = false;
        $scope.showMain = true;
        showStudents();
    }


}]);