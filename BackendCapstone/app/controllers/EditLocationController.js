app.controller("EditLocationController", ["$scope", "$http", "$location", "$routeParams", function ($scope, $http, $location, $routeParams) {

    $scope.updatedLocation = {};

    $http.get(`/api/locations/${$routeParams.id}`).then(function (result) {
        $scope.updatedLocation = result.data;
    });


    var updateLocation = function (location) {
        return $http.post(`api/locations/editLocation/${location.LocationId}`, JSON.stringify(location));
    };


    $scope.Submit = function (location) {

        updateLocation(location).then(function () {
            $location.path("/locations");
        }).catch(function (error) {
            console.log(error);
        });

    };
}]);
