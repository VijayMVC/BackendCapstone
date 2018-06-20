app.controller("ReportsController", ["$http", "$location", "$scope", function ($http, $location, $scope) {


    
    $scope.labels = ["Students In Homeroom", "Students Not In Homeroom"];
    $scope.data = [0, 0];
   

   

    $http.get("api/realtimereports").then(function (result) {
        $scope.reports = result.data;

        result.data.forEach((location) => {
            if (location.InHomeroom) {
                $scope.data[0] += location.NumberOfStudentsInRoom
            } else {
                $scope.data[1] += location.NumberOfStudentsInRoom
            }
        });
    })
}]);