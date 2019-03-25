using listview.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using listview.Model;

namespace listview.WebApp
{
    public partial class DelectDatapoints : System.Web.UI.Page
    {
        public List<string> ListMetrics { get; set; }
        public List<DatabasesInformation> ListFields { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            //if(IsPostBack)
            //{
            // string ak = Session["ak"].ToString();
            // string sk = Session["sk"].ToString();
            string ak = "2675d1072988482d896476915a70bc1a";
            string sk = "b5826e85726c452ab4e096188bb7a461";
            //string Id = Context.Request.QueryString["Id"]; //传递点击的数据库Id
            //    //获取metric列表 用来填充度量下拉列表
            string urlmetrics = "https://shifandata1.tsdb.iot.bj.baidubce.com/v1/metric";
            string Method = "GET";
            UserInfoService userInfoService = new UserInfoService();
            string resmetrics = userInfoService.getHttp(ak, sk, urlmetrics, Method);
            List<string> listmetrics = userInfoService.GetMetrics(resmetrics);
            ListMetrics = listmetrics;

            //    //获取field列表 用来填充域下拉列表
            //    string metric = Context.Request.QueryString["metric"];  //获取选中的度量
            //    string urlfields = "https://shifandata1.tsdb.iot.bj.baidubce.com/v1/metric/"+ metric+ "/field";
            //    string resfields = userInfoService.getHttp(ak, sk, urlfields, Method);
            //    List<DatabasesInformation> listfields = userInfoService.GetList(resmetrics);
            //    ListFields = listfields;

            //    string field= Context.Request.QueryString["field"]; //获取选中的域
            //    string start= Context.Request.QueryString["start"];
            //    string end= Context.Request.QueryString["end"];
            //    string tagkey= Context.Request.QueryString["tagkey"];
            //    string tagvalue = Context.Request.QueryString["tagvalue"];
            //    //日期时间转为unix时间戳
            //    int starttime = UserInfoService.getUnixtime(start);
            //    int endtime = UserInfoService.getUnixtime(end);


            //    string url = "https://tsdb.bj.baidubce.com/v1/database/" + Id+"?delete";
            //    string Method1 = "PUT";
            //    //UserInfoService userInfoService = new UserInfoService();
            //    string res = userInfoService.getHttp(ak, sk, url, Method1);


            //    //if (metric=="全部"&& field=="全部")
            //    //{
            //    //   string datapoints="{"metrics":""}";
            //    //}
            //}
        }
    }
}