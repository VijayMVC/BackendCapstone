var app = angular.module("BackendCapstone", ["ngRoute"]);

app.config(["$routeProvider", function ($routeProvider) {
    $routeProvider
        .when("/",
        {
            templateUrl: "/app/partials/index.html",
            controller: "HomeController"
        })
        .when("/teachers",
        {
            templateUrl: "/app/partials/teachersList.html",
            controller: "TeachersController"
        })
        .when("/editTeacher/:id",
        {
            templateUrl: "/app/partials/editTeacherInfo.html",
            controller: "EditTeacherInfoController"
        })
        .when("/locations",
        {
            templateUrl: "/app/partials/locations.html",
            controller: "LocationsController"
        })
        .when("/students",
        {
            templateUrl: "/app/partials/students.html",
            controller: "StudentsController"
        });
}]);