using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TestProject.Models
{
    public class GraphSkillVacancy : IEntity
    {
        public int id { get; set; }
        public int graph_skill_id { get; set; }
        public int vacancy_id { get; set; }
        public DateTime? last_date { get; set; }
        public DateTime? created_at { get; set; }
        public DateTime? updated_at { get; set; }
    }
}