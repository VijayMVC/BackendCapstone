using BackendCapstone.Models;
using BackendCapstone.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;

namespace BackendCapstone.Controllers
{
    [RoutePrefix("api/students")]
    public class StudentsController : ApiController
    {
        [HttpGet, Route("")]
        public HttpResponseMessage DisplayStudents()
        {
            var studentInfo = new StudentsRepository();
            var displayStudents = studentInfo.GetStudents();

            return Request.CreateResponse(HttpStatusCode.OK, displayStudents);
        }

        [HttpGet, Route("{id}")]
        public HttpResponseMessage GetStudentsForSingleTeacher(int id)
        {
            var studentInfo = new StudentsRepository();
            var studentsAssignedToSingleTeacher = studentInfo.GetStudentsForSingleTeacher(id);

            return Request.CreateResponse(HttpStatusCode.OK, studentsAssignedToSingleTeacher);
        }
    }

    
    
    
}