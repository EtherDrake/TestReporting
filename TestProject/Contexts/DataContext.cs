using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Linq;
using System.Web;
using TestProject.Models;

namespace TestProject.Contexts
{
    //[DbConfigurationType(typeof(MySql.Data.Entity.MySqlEFConfiguration))]
    public class DataContext : DbContext
    {
        public DataContext() : base("DBEntities")
        {

        }

        public DbSet<Vacancy> Vacancies { get; set; }
        public DbSet<Skill> Skills { get; set; }
        public DbSet<GraphSkill> GraphSkill { get; set; }
        public DbSet<GraphSkillVacancy> GraphSkillVacancy { get; set; }
        public DbSet<Reporting> Reporting { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Vacancy>().ToTable("vacancies");
            modelBuilder.Entity<Skill>().ToTable("skills");
            modelBuilder.Entity<GraphSkill>().ToTable("graph_skill");
            modelBuilder.Entity<GraphSkillVacancy>().ToTable("graph_skill_vacancy");
            modelBuilder.Entity<Reporting>().ToTable("reporting");
        }
    }
}