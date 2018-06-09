app.controller("LocationsController", ["$scope", "$http", "$location", function ($scope, $http, $location) {

    console.log("hello");


    $http.get("/api/locations").then(function (result) {
        $scope.locations = result.data;
        console.log($scope.locations);
    });

    $scope.editLocation = function (locationId) {
        $location.path(`/editLocation/${locationId}`);
    };

}]);