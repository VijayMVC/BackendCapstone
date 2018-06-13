var app = angular.module("BackendCapstone", ["ngRoute"]);

app.config(["$routeProvider", function ($routeProvider) {
    $routeProvider
        .when("/",
        {
            templateUrl: "/app/partials/index.html",
            controller: "HomeController"
        })
        .when("teacherview",
        {
            templateUrl: "/app/partials/teacherView.html",
            controller: "TeacherViewController"
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
        .when("/editLocation/:id",
        {
            templateUrl: "/app/partials/editLocation.html",
            controller: "EditLocationController"
        })
        .when("/studentview",
        {
            templateUrl: "/app/partials/studentView.html",
            controller: "StudentViewController"
        })
        .when("/newlocation",
        {
            templateUrl: "/app/partials/selectNewLocation.html",
            controller: "StudentViewController"
        });
}]);