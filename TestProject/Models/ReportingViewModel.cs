using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace TestProject.Models
{
    public class ReportingViewModel
    {
        [DataType(DataType.Date)]
        public DateTime date { get; set; }
    }
}