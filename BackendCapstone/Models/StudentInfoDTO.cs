using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BackendCapstone.Models
{
    public class StudentInfoDTO
    {
        public int StudentId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int LocationId { get; set; }
        public string LocationName { get; set; }
        public int HomeroomTeacherId { get; set; }
        public bool IsAtSchool { get; set; }
        public bool InHomeroom { get; set; }
        public bool InTransit { get; set; }

    }
}