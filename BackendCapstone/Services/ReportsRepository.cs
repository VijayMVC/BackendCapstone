using BackendCapstone.Models;
using Dapper;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace BackendCapstone.Services
{
    public class ReportsRepository
    {
        public IEnumerable<HomeroomReportModel> GetNumberOfStudentsInHomeroom()
        {
            using (var db = new SqlConnection(ConfigurationManager.ConnectionStrings["Main"].ConnectionString))
            {
                db.Open();

                var listOfNumberOfStudentsInHomeroom = db.Query<HomeroomReportModel>(@"SELECT l.LocationName, l.LocationId,
                                                                COUNT(s.StudentId) as NumberOfStudentsInRoom
                                                                 FROM locations l
                                                                JOIN teachers t
                                                                on l.LocationId = t.LocationId
                                                                JOIN students s
                                                                on s.HomeroomTeacherId = t.TeacherId
                                                                WHERE InHomeroom = 1
                                                                GROUP BY LocationName, l.LocationId");

                return listOfNumberOfStudentsInHomeroom;
            }
        }

        public IEnumerable<LocationReportModel> GetNumberOfStudentsAtEachLocation()
        {
            using (var db = new SqlConnection(ConfigurationManager.ConnectionStrings["Main"].ConnectionString))
            {
                db.Open();

                var listOfNumberOfStudentsAtEachLocation = db.Query<LocationReportModel>(@"SELECT l.LocationId, l.LocationName, 
                                                                                        NumberOfStudentsInLocation = COUNT(s.StudentId) 
                                                                                        FROM locations l
                                                                                        JOIN StudentLocations sl
	                                                                                        on l.LocationId = sl.LocationId
                                                                                        JOIN students s
	                                                                                        on sl.StudentId = s.StudentId
                                                                                        WHERE s.InHomeroom = 0	
                                                                                        GROUP BY l.LocationId, LocationName");

                return listOfNumberOfStudentsAtEachLocation;
            }
        }

        //public IEnumerable<InTransitReportModel> GetNumberOfStudentsInTransit()
        //{
        //    using (var db = new SqlConnection(ConfigurationManager.ConnectionStrings["Main"].ConnectionString))
        //    {
        //        db.Open();

        //        var listOfNumberOfStudentsInTransit = db.Query<InTransitReportModel>(@"")
        //    }
        //}
    }
}