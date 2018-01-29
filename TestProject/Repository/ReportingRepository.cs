using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TestProject.Contexts;
using TestProject.Models;

namespace TestProject.Repository
{
    public class ReportingRepository : GenericRepository<DataContext, Reporting>
    {
        public ReportingRepository(DataContext Dcontext)
        {
            context = Dcontext;
        }
        
        public ReportingRepository()
        {
            context = new DataContext();
        }

        public void reportingUpdate(DateTime date)
        {
            var list = context.Database.SqlQuery<ReportingExtractionModel>(
                   "SELECT skills.title AS skill, DATE(vacancies.created_at) AS date, COUNT(vacancies.id) AS count " +
                   "FROM vacancies INNER JOIN graph_skill_vacancies ON vacancies.id = graph_skill_vacancies.vacancy_id " +
                   "INNER JOIN graph_skill ON graph_skill_vacancies.graph_skill_id=graph_skill.id " +
                   "INNER JOIN skills ON graph_skill.related_skill=skills.id " +
                   "WHERE DATE(vacancies.created_at) = '" + date.ToString("yyyy-MM-dd") + "' GROUP BY skills.title, date ORDER BY date").ToList();
            var listToAdd = Mapper.Map<List<ReportingExtractionModel>, List<Reporting>>(list);
            for (int i = 0; i < listToAdd.Count; i++)
            {

                context.Reporting.Add(listToAdd[i]);
                context.SaveChanges();
            }
        }

    }
}