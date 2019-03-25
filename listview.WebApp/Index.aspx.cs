using listview.BLL;
using listview.Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace listview.WebApp
{
    public partial class Index : System.Web.UI.Page
    {
        public List<UserInfo> UserInfoList { get; set; }
        public List<DatabasesInformation> DatabaseList { get; set; }
        public int PageCount { get; set; }
        public int PageIndex { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            //查询数据库列表，展示初始界面
            string ak = Session["ak"].ToString();
            string sk = Session["sk"].ToString();
            string url = "https://tsdb.bj.baidubce.com/v1/database";
            string Method = "GET";
            UserInfoService userInfoService = new UserInfoService();
            string res = userInfoService.getHttp(ak, sk,url, Method);
            List<DatabasesInformation> list = userInfoService.GetList(res);
            DatabaseList = list;
            int pagesize = 10;//每页显示记录条数
            int pageIndex;//当前页码值
            if (int.TryParse(Request.QueryString["pageIndex"],out pageIndex))
            {
                pageIndex = 1;
            }
            int recordCount = DatabaseList.Count;//获取总的记录数
            int pageCount = Convert.ToInt32(Math.Ceiling((double)recordCount / pagesize));//求出总的页数
            PageCount = pageCount;
            pageIndex = pageIndex < 1 ? 1 : pageIndex;
            pageIndex = pageIndex > pageCount ? pageCount : pageIndex;
            PageIndex = pageIndex;
            //BLL.UserInfoService userInfoService = new BLL.UserInfoService();
            //List<UserInfo> list = userInfoService.GetList();
            //UserInfoList = list;

        }
    }
}