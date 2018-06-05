using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BackendCapstone.Models
{
    public class LocationModel
    {
        public int LocationId { get; set; }
        public string LocationName { get; set; }
        public int RoomNumber { get; set; }
        public int TimeAtLocation { get; set; }
    }
}