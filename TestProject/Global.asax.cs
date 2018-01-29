using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using TestProject.Models;

namespace TestProject
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            Mapper.Initialize(cfg => cfg.CreateMap<ReportingExtractionModel, Reporting>());

            //Start timer with start project
            Thread thread = new Thread(new ThreadStart(Time));
            thread.IsBackground = true;
            thread.Name = "Time";
            thread.Start();
        }

        //Work of timer every day
        protected void TimerEvent(object sender, System.Timers.ElapsedEventArgs e)
        {
            if (DateTime.Now.Hour == 0)
            {
                DateTime dateReporting = DateTime.Now.AddDays(-1);
                //call method
            }
        }

        //Timer configuration
        protected void Time()
        {
            System.Timers.Timer timer = new System.Timers.Timer();
            timer.Elapsed += new System.Timers.ElapsedEventHandler(TimerEvent);
            timer.Interval = 3600000;
            timer.Enabled = true;
            timer.AutoReset = true;
            timer.Start();
        }
    }
}
