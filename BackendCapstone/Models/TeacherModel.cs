using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BackendCapstone.Models
{
    public class TeacherModel
    {
        public int TeacherId { get; set; }
        public string TeacherName { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int LocationId { get; set; }
        public string Location { get; set; }
        public bool IsHomeroomTeacher { get; set; }
    }
}