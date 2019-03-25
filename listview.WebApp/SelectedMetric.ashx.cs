using listview.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;

namespace listview.WebApp
{
    /// <summary>
    /// SelectedMetric 的摘要说明
    /// </summary>
    public class SelectedMetric : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string ak = "2675d1072988482d896476915a70bc1a";
            string sk = "b5826e85726c452ab4e096188bb7a461";
            //string ak = null;
            //string sk = null;
            //if (context.Session["ak"] != null)
            //{
            //    ak = context.Session["ak"].ToString();
            //}
            //if (context.Session["sk"] != null)
            //{
            //    sk = context.Session["sk"].ToString();
            //}
            string metric = context.Request.QueryString["metric"]; //get传值
            //获取 域field信息
            string trlfields = "https://shifandata1.tsdb.iot.bj.baidubce.com/v1/metric/location/field";
            //string trlfields = "https://shifandata1.tsdb.iot.bj.baidubce.com/v1/metric/ " + metric + "/field";
            string Method = "GET";
            UserInfoService userInfoService = new UserInfoService();
            string resfields = userInfoService.getHttp(ak, sk, trlfields, Method);
            List<string> listfields = userInfoService.Getfields(resfields);
            string fieldsString = "";
            for(int i=0;i< listfields.Count;i++)
            {
                if(i==0)
                {
                    fieldsString = listfields[0];
                }
                else
                {
                    fieldsString += "," + listfields[i];
                }

            }
            context.Response.Write(fieldsString);
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