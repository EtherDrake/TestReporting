using AutoMapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TestProject.Contexts;
using TestProject.Models;

namespace TestProject.Controllers
{
    public class ReportingsController : Controller
    {
        private DataContext db = new DataContext();

        // GET: Reportings
        public ActionResult Index()
        {
            return View(db.Reporting.ToList());
        }

        // GET: Reportings/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reporting reporting = db.Reporting.Find(id);
            if (reporting == null)
            {
                return HttpNotFound();
            }
            return View(reporting);
        }

        // GET: Reportings/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Reportings/Create
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "date")] ReportingViewModel reportingView)
        {
            if (ModelState.IsValid)
            {
                //var reportings = from skill in db.Skills
                //                 join gskill in db.GraphSkill on skill.id equals gskill.related_skill
                //                 join gskillv in db.GraphSkillVacancy on gskill.id equals gskillv.graph_skill_id
                //                 join vacancy in db.Vacancies on gskillv.vacancy_id equals vacancy.id
                //                 where vacancy.created_at == reportingView.date
                //                 select new { skill = skill.title, date = vacancy.created_at.Value, count = vacancy.link.Count() };
                ////ViewBag.Count = reportings.ToList().Count();
                ////List<Reporting> repsToAdd = reportings.ToList();
                //var lst=reportings.ToList().Select(r => new Reporting { skill = r.skill, date = r.date, count = r.count }).ToList();
                var list = db.Database.SqlQuery<ReportingExtractionModel>(
                    "SELECT skills.title AS skill, DATE(vacancies.created_at) AS date, COUNT(vacancies.id) AS count " +
                    "FROM vacancies INNER JOIN graph_skill_vacancies ON vacancies.id = graph_skill_vacancies.vacancy_id " +
                    "INNER JOIN graph_skill ON graph_skill_vacancies.graph_skill_id=graph_skill.id " +
                    "INNER JOIN skills ON graph_skill.related_skill=skills.id " +
                    "WHERE DATE(vacancies.created_at) = '"+ reportingView.date.ToString("yyyy-MM-dd") + "' GROUP BY skills.title, date ORDER BY date").ToList();
                var listToAdd = Mapper.Map<List<ReportingExtractionModel>, List<Reporting>>(list);
                for (int i=0;i< listToAdd.Count;i++)
                {

                    db.Reporting.Add(listToAdd[i]);
                    db.SaveChanges();
                }
                //db.Reporting.Add(reporting);
                //db.SaveChanges();
                return RedirectToAction("Index");
            }

            //return View(reporting);
            return View();
        }

        // GET: Reportings/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reporting reporting = db.Reporting.Find(id);
            if (reporting == null)
            {
                return HttpNotFound();
            }
            return View(reporting);
        }

        // POST: Reportings/Edit/5
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,skill,date,count")] Reporting reporting)
        {
            if (ModelState.IsValid)
            {
                db.Entry(reporting).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(reporting);
        }

        // GET: Reportings/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reporting reporting = db.Reporting.Find(id);
            if (reporting == null)
            {
                return HttpNotFound();
            }
            return View(reporting);
        }

        // POST: Reportings/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Reporting reporting = db.Reporting.Find(id);
            db.Reporting.Remove(reporting);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
