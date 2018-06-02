using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BackendCapstone.Models
{
    public class StudentLocationsModel
    {
        public int StudentLocationsId { get; set; }
        public int StudentId { get; set; }
        public int LocationId { get; set; }
        public DateTime CheckedIn { get; set; }
        public DateTime CheckedOut { get; set; }

    }
}