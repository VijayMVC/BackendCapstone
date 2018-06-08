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
    public class TeachersRepository
    {
        public IEnumerable<TeacherModel> GetTeachers()
        {
            using (var db = new SqlConnection(ConfigurationManager.ConnectionStrings["Main"].ConnectionString))
            {
                db.Open();

                var listOfTeachers = db.Query<TeacherModel>(@"select t.*,
                l.locationname as Location,
                l.roomnumber as RoomNumber
                from teachers t
                join locations l on t.locationid = l.locationid");

                return listOfTeachers;
            }
        }

        public TeacherModel GetSingleTeacher(int id)
        {
            using (var db = new SqlConnection(ConfigurationManager.ConnectionStrings["Main"].ConnectionString))
            {
                db.Open();

                var singleTeacher = db.QueryFirst<TeacherModel>(@"SELECT * from teachers WHERE teacherId = @id", new { id });

                return singleTeacher;
            }
        }

        public bool UpdateTeacher(TeacherModel teacher)
        {
            using (var db = new SqlConnection(ConfigurationManager.ConnectionStrings["Main"].ConnectionString))
            {
                db.Open();

                var result = db.Execute(@"UPDATE Teachers
                                            SET FirstName = @FirstName
                                                ,LastName = @LastName
                                                ,IsHomeroomTeacher = @IsHomeroomTeacher
                                                ,LocationId = @LocationId
                                                WHERE TeacherId = @TeacherId", teacher);

                return result == 1;
            }
        }
    }
}