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
        public bool SetCheckedOutTime(int id)
        {
            using (var db = new SqlConnection(ConfigurationManager.ConnectionStrings["Main"].ConnectionString))
            {
                db.Open();

                var success = db.Execute(@"UPDATE StudentLocations
                                            SET StudentId = @StudentId,
                                                CheckedOut =@CheckedOut,
                                            WHERE LocationId = @id", new { id });

                return success == 1;
            }

            
        }
    }
}