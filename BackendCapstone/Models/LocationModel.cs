using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BackendCapstone.Models
{
    public class LocationModel
    {
        public int LocationId { get; set; }
        public string Name { get; set; }
        public DateTime TransitTimeAllowed { get; set; }
        public DateTime TimeAtLocation { get; set; }
    }
}