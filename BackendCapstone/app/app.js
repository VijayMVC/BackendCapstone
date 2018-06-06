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
            templateUrl: "/app/partials/teachers.html",
            controller: "TeachersController"
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