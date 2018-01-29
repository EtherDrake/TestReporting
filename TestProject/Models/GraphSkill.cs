using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TestProject.Models
{
    public class GraphSkill:IEntity
    {
        public int id { get; set; }
        public int? parent_skill { get; set; }
        public int related_skill { get; set; }
        public int? weight { get; set; }
        public DateTime? last_date { get; set; }
        public DateTime? created_at { get; set; }
        public DateTime? updated_at { get; set; }

        public virtual Skill skill { get; set; }
        public virtual ICollection<Vacancy> vacancies { get; set; }

    }
}