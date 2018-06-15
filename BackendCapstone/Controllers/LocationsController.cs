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
        public HttpResponseMessage DisplayLocations()
        {
            var locationRepo = new LocationsRepository();
            var displayLocations = locationRepo.GetLocations();
            return Request.CreateResponse(HttpStatusCode.OK, displayLocations);
        }

        [HttpGet, Route("{id}")]
        public HttpResponseMessage SingleLocation(int id)
        {
            var locationRepo = new LocationsRepository();
            var displayLocation = locationRepo.GetSingleLocation(id);
            return Request.CreateResponse(HttpStatusCode.OK, displayLocation);
        }

        [HttpPost, Route("editLocation/{id}")]
        public HttpResponseMessage EditSingleLocation(LocationModel location)
        {
            var locationRepo = new LocationsRepository();
            var editSingleLocationInfo = locationRepo.UpdateLocation(location);
            return Request.CreateResponse(HttpStatusCode.OK, editSingleLocationInfo);
        }
    }
}
