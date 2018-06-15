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
        [HttpPost, Route("exitRoom/{id}")]
        public HttpResponseMessage SetCheckedOutTime(int id)
        {
            var studentLocationsRepo = new StudentLocationsRepository();
            var success = studentLocationsRepo.SetCheckedOutTime(id);

            return Request.CreateResponse(HttpStatusCode.OK, success);
        }

    }
}
