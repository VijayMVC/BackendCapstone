app.controller("StudentViewController", ["$scope", "$http", "$location", function ($scope, $http, $location) {

    $http.get("/api/teachers").then(function (result) {
        $scope.teachers = result.data;
    });

     

}]);