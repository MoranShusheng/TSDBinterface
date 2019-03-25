using listview.BLL;
using listview.Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace listview.WebApp
{
    /// <summary>
    /// DatabaseInfo 的摘要说明
    /// </summary>
    public class DatabaseInfo : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/html";
            // string Id = Context.Request.QueryString["Id"]; //传递点击的数据库Id
            string Id = "tsdb-y016ju0yde77";
            //查询数据库详细
            // string ak = context.Session["ak"].ToString();
            // string sk = context.Session["sk"].ToString();
            string ak = "2675d1072988482d896476915a70bc1a";
            string sk = "b5826e85726c452ab4e096188bb7a461";

            string url = "https://tsdb.bj.baidubce.com/v1/database/" + Id;
            string Method = "GET";
            UserInfoService userInfoService = new UserInfoService();
            string res = userInfoService.getHttp(ak, sk, url, Method);
            DatabasesInformation databasesInformation = userInfoService.GetdatabasesInformation(res);
            
            string filePath = context.Request.MapPath("DatabaseInfo.html");
            // 读取html模板内容；
            string strHtml = File.ReadAllText(filePath);
            strHtml = strHtml.Replace("$status", databasesInformation.status == "Active" ? "正常" : databasesInformation.status).Replace("$name", databasesInformation.databaseName).Replace("$ID", databasesInformation.databaseId)
                             .Replace("$description", databasesInformation.description).Replace("$endpoint", databasesInformation.endpoint).Replace("$ingestDataPointsMonthly", databasesInformation.quota.ingestDataPointsMonthly)
                             .Replace("$storeBytesQuota", databasesInformation.quota.storeBytesQuota).Replace("$expiredTime", databasesInformation.expiredTime.ToString()).Replace("$createTime", databasesInformation.createTime.ToString());
            context.Response.Write(strHtml);
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