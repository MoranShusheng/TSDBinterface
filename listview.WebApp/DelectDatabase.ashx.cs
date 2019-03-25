using listview.BLL;
using listview.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace listview.WebApp
{
    /// <summary>
    /// DelectDatabase 的摘要说明
    /// </summary>
    public class DelectDatabase : IHttpHandler, IRequiresSessionState
    {
        //public List<DatabaseDelect> databaseDelectList { get; set; }
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string ak = null;
            string sk = null;
            if (context.Session["ak"]!=null)
            {
                ak = context.Session["ak"].ToString();
            }
            if (context.Session["sk"] != null)
            {
                sk = context.Session["sk"].ToString();
            }
            // string IDs = context.Request.QueryString["data"];
            string databaseId = context.Request.QueryString["data"];
            //string[] IdArray = IDs.Split(',');
            // foreach (string databaseId in IdArray)
            //{
                string url = "https://tsdb.bj.baidubce.com/v1/database/" + databaseId;
                string Method = "DELETE";
                UserInfoService userInfoService = new UserInfoService();
                string res = userInfoService.getHttp(ak, sk, url, Method);
                DatabaseDelect Dbdelect = userInfoService.GetListDatabaseDelect(res);
                //databaseDelectList.Add(Dbdelect);//最终返回为DatabaseDelect对象
           // }
            context.Response.Write(Dbdelect.requestId);
           // context.Response.Write(databaseDelectList);
            //if (databaseDelect.code == "DeleteUnexpiredDatabaseFailed")  //"DeleteUnexpiredDatabaseFailed"表示未过期数据库
            //    context.Response.Write(databaseDelect.message);  //输出为提示信息
            ///"DeleteUnexpiredDatabaseFailed";
                //context.Response.Write("Hello World");
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}