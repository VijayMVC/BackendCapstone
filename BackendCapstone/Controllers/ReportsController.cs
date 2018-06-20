using BackendCapstone.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace BackendCapstone.Controllers
{
    [RoutePrefix("api/realtimereports")]
    public class ReportsController : ApiController
    {
        [HttpGet, Route("")]
        public HttpResponseMessage DisplayHomeroomReport()
        {
            var reportsRepo = new ReportsRepository();
            var homeroomReport = reportsRepo.GetNumberOfStudentsInRoom();
            

            return Request.CreateResponse(HttpStatusCode.OK, homeroomReport);
        }
    }
}
