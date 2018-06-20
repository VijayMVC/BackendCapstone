var app = angular.module("BackendCapstone", ["ngRoute", "chart.js"]);

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
        .when("/reports",
        {
            templateUrl: "/app/partials/reports.html",
            controller: "ReportsController"
        })
        .when("/studentview",
        {
            templateUrl: "/app/partials/studentView.html",
            controller: "StudentViewController"
        });
        
}]);