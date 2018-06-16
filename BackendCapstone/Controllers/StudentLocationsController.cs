using BackendCapstone.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace BackendCapstone.Controllers
{
    [RoutePrefix("api/studentLocations")]
    public class StudentLocationsController : ApiController
    {
        [HttpPost, Route("exitRoom/location/{locationId}/student/{studentId}")]
        public HttpResponseMessage SetCheckedOutTime(int locationId, int studentId)
        {
            var studentLocationsRepo = new StudentLocationsRepository();
            var success = studentLocationsRepo.SetCheckedOutTime(locationId, studentId);

            return Request.CreateResponse(HttpStatusCode.OK, success);
        }

    }
}
