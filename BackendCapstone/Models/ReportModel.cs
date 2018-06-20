using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BackendCapstone.Models
{
    public class ReportModel
    {
        public string LocationName { get; set; }
        public int LocationId { get; set; }
        public int NumberOfStudentsInRoom { get; set; }
        public bool InHomeroom { get; set; }
    }
}