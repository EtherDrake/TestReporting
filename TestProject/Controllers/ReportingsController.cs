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
using TestProject.Repository;

namespace TestProject.Controllers
{
    public class ReportingsController : Controller
    {
        //private DataContext db = new DataContext();
        ReportingRepository repo = new ReportingRepository();

        // GET: Reportings
        public ActionResult Index()
        {
            return View(repo.GetAll());
        }

        // GET: Reportings/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reporting reporting = repo.Get(id.Value);
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
                repo.reportingUpdate(reportingView.date);
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
            Reporting reporting = repo.Get(id.Value);
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
                repo.Edit(reporting);
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
            Reporting reporting = repo.Get(id.Value);
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
            Reporting reporting = repo.Get(id);
            repo.Delete(reporting);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                //db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
