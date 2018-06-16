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
    public class StudentsRepository
    {
        public IEnumerable<StudentModel> GetStudents()
        {
            using (var db = new SqlConnection(ConfigurationManager.ConnectionStrings["Main"].ConnectionString))
            {
                db.Open();

                var listOfStudents = db.Query<StudentModel>(@"SELECT * from students");

                return listOfStudents;
            }
        }

        public IEnumerable<StudentModel> GetStudentsForSingleTeacher(int id)
        {
            using (var db = CreateConnection())
            {
                db.Open();

                var students = db.Query<StudentModel>(@"SELECT s.*
                                                        FROM Students s
                                                        JOIN teachers t
	                                                        on t.TeacherId = s.HomeroomTeacherId
                                                        WHERE t.TeacherId = @id", new { id });

                return students;
            }
        }

        public bool MarkStudentPresent(int id)
        {
            using (var db = CreateConnection())
            {
                db.Open();

                var success = db.Execute(@"UPDATE Students
                                           SET IsAtSchool = 1,
                                           InHomeroom = 1
                                           WHERE studentId = @id", new { id });

                return success == 1;
            }
        }

        public StudentModel GetSingleStudent(int id)
        {
            using (var db = CreateConnection())
            {
                db.Open();

                var singleStudent = db.QueryFirst<StudentModel>(@"SELECT * from students
                                                                  WHERE studentId = @id", new { id });

                return singleStudent;
            }
        }

        public bool MarkInHomeroom(int id)
        {
            using (var db = CreateConnection())
            {
                db.Open();

                var success = db.Execute(@"UPDATE Students
                                            SET InHomeroom = 1,
                                                InTransit = 0
                                            WHERE studentId = @id", new { id });

                return success == 1; ;
            }
        }

        public bool MarkNotInHomeroom(int id)
        {
            using (var db = CreateConnection())
            {
                db.Open();

                var success = db.Execute(@"UPDATE Students
                                            SET InHomeroom = 0
                                            WHERE studentId = @id", new { id });

                return success == 1;
            }
        }

        public SqlConnection CreateConnection()
        {
            return new SqlConnection(ConfigurationManager.ConnectionStrings["Main"].ConnectionString);
        }
    }
}