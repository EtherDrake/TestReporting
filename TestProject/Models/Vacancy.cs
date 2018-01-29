using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TestProject.Models
{
    public class Vacancy : IEntity
    {
        public int id { get; set; }
        public string link { get; set; }
        public DateTime? created_at { get; set; }
        public DateTime? updated_at { get; set; }

        public virtual ICollection<GraphSkill> graph_skills { get; set; }
    }
}