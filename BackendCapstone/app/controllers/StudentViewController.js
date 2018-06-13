app.controller("StudentViewController", ["$scope", "$http", "$location", function ($scope, $http, $location) {

    $scope.homeroomTeacher = {};
    $scope.student = {};
    

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
            $scope.students = result.data;
            showStudents();
        });
    }

    $scope.exitRoom = () => {
        $http.get("api/locations").then(function (result) {
            $scope.locations = result.data;
            console.log(result.data);
        })

    }

}]);