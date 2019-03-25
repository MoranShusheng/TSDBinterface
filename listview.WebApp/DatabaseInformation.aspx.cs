using listview.BLL;
using listview.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace listview.WebApp
{
    public partial class DatabaseInformation : System.Web.UI.Page
    {
        public List<DatabasesInformation> DatabaseList { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            //string Id= Context.Request.QueryString["Id"]; //传递点击的数据库Id
            ////查询数据库详细
            //string ak = Session["ak"].ToString();
            //string sk = Session["sk"].ToString();
            //string url = "https://tsdb.bj.baidubce.com/v1/database/"+Id;
            //string Method = "GET";
            //UserInfoService userInfoService = new UserInfoService();
            //string res = userInfoService.getHttp(ak, sk, url, Method);
            //List<databasesInformation> list = userInfoService.GetList(res);
            //DatabaseList = list;
        }
    }
}