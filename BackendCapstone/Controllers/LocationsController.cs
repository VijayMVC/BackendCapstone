using BackendCapstone.Models;
using BackendCapstone.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace BackendCapstone.Controllers
{
    [RoutePrefix("api/locations")]
    public class LocationsController : ApiController
    {
        [HttpGet, Route("")]
        public HttpResponseMessage DisplayLocations(LocationModel location)
        {
            var locationInfo = new LocationsRepository();
            var displayLocations = locationInfo.GetLocations();

            return Request.CreateResponse(HttpStatusCode.OK, displayLocations);
        }

    }
}
