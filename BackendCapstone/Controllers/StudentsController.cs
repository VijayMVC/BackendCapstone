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
    [RoutePrefix("api/students")]
    public class StudentsController : ApiController
    {
        [HttpGet, Route("")]
        public HttpResponseMessage DisplayStudents(StudentModel student)
        {
            var studentInfo = new StudentsRepository();
            var displayStudents = studentInfo.GetStudents();

            return Request.CreateResponse(System.Net.HttpStatusCode.OK, displayStudents);
        }
    }
    
}