app.controller("ReportsController", ["$http", "$location", "$scope", function ($http, $location, $scope) {

    $http.get("api/realtimereports").then(function (result) {
        $scope.reports = result.data;
    });



}]);