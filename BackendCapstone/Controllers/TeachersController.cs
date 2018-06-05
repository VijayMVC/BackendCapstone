using BackendCapstone.Models;
using BackendCapstone.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Http;

namespace BackendCapstone.Controllers
{
    [RoutePrefix("api/teachers")]
    public class TeachersController : ApiController
    {
        [HttpGet, Route("")]
        public HttpResponseMessage DisplayTeachers()
        {
            var teacherInfo = new TeachersRepository();
            var displayTeachers = teacherInfo.GetTeachers();

            return Request.CreateResponse(System.Net.HttpStatusCode.OK, displayTeachers);
        }
    }

}