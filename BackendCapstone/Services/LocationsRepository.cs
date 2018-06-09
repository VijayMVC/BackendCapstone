using BackendCapstone.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Dapper;

namespace BackendCapstone.Services
{
    public class LocationsRepository
    {
        public IEnumerable<LocationModel> GetLocations()
        {
            using (var db = new SqlConnection(ConfigurationManager.ConnectionStrings["Main"].ConnectionString))
            {
                db.Open();

                var listOfLocations = db.Query<LocationModel>(@"SELECT * from locations");

                return listOfLocations;
            }
        }

        public LocationModel GetSingleLocation(int id)
        {
            using (var db = new SqlConnection(ConfigurationManager.ConnectionStrings["Main"].ConnectionString))
            {
                db.Open();

                var singleLocation = db.QueryFirst<LocationModel>(@"SELECT * from locations WHERE locationId = @id", new { id });

                return singleLocation;
            }
        }

        public bool UpdateLocation(LocationModel location)
        {
            using (var db = new SqlConnection(ConfigurationManager.ConnectionStrings["Main"].ConnectionString))
            {
                db.Open();

                var result = db.Execute(@"UPDATE Locations
                                            SET LocationName = @LocationName
                                                ,TimeAtLocation = @TimeAtLocation
                                                WHERE LocationId = @LocationId", location);

                return result == 1;
            }
        }
    }
}