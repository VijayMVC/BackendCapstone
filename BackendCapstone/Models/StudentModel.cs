using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BackendCapstone.Models
{
    public class StudentModel
    {
        public int StudentId { get; set; }
        public bool IsAtSchool { get; set; }
        public int HomeroomTeacherId { get; set; }
        public bool InTransit { get; set; }
        public bool IsGoneTooLong { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
    }
}