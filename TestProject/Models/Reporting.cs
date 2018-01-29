using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TestProject.Models
{
    public class Reporting : IEntity
    {
        public int id { get; set; }
        public string skill { get; set; }
        public DateTime date { get; set; }
        public int count { get; set; }
    }
}