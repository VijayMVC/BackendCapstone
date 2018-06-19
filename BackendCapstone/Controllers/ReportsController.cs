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
            var homeroomReport = reportsRepo.GetNumberOfStudentsInHomeroom();
            

            return Request.CreateResponse(HttpStatusCode.OK, homeroomReport);
            //return Request.CreateResponse(HttpStatusCode.OK, locationsReport);
        }

        //[HttpGet, Route("")]
        //public HttpResponseMessage DisplayLocationReport()
        //{
        //    var reportsRepo = new ReportsRepository();
        //    var locationsReport = reportsRepo.GetNumberOfStudentsAtEachLocation();

        //    return Request.CreateResponse(HttpStatusCode.OK, locationsReport);
        //}
    }
}
