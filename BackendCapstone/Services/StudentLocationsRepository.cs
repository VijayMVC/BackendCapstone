using Dapper;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace BackendCapstone.Services
{
    public class StudentLocationsRepository
    {
        public bool SetCheckedOutTime(int locationId, int studentId)
        {
            using (var db = new SqlConnection(ConfigurationManager.ConnectionStrings["Main"].ConnectionString))
            {
                db.Open();

                var success = db.Execute(@"INSERT INTO StudentLocations
                                            (StudentId,
                                            LocationId,
                                            CheckedOut)
                                     VALUES
                                           (@StudentId
                                           ,@LocationId
                                           ,GETDATE())", new { locationId, studentId });

                return success == 1;
            }

            
        }

        public bool SetCheckedInTime(int locationId, int studentId)
        {
            using (var db = new SqlConnection(ConfigurationManager.ConnectionStrings["Main"].ConnectionString))
            {
                db.Open();

                var success = db.Execute(@"UPDATE StudentLocations
                                           SET StudentId = @studentId,
                                               LocationId = @locationId,
                                               CheckedIn = GETDATE()
                                           WHERE CheckedIn is null", new { locationId, studentId });

                return success == 1;
            }


        }
    }
}