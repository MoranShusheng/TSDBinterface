<%@ WebHandler Language="C#" Class="Login" %>

using System;
using System.IO;
using System.Text;
using System.Web;
using System.Net;
using System.Collections.Generic;
using System.Security.Cryptography;
using listview.BLL;
using System.Web.SessionState;

public class Login : IHttpHandler,IRequiresSessionState
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";

        //string ak = context.Request["ak1"];
        //string sk = context.Request["sk1"];
        string ak = context.Request.Form["ak"];
        string sk = context.Request.Form["sk"];
        string url= "https://tsdb.bj.baidubce.com/v1/database";
        string Method = "GET";
        UserInfoService userInfoService = new UserInfoService();
        string res = userInfoService.getHttp(ak, sk,url,Method);

        if (res!=null)
        {
            context.Session["ak"] = ak;
            context.Session["sk"] = sk;
            context.Response.Redirect("Index.aspx");
        }
        else
        {
            context.Response.Redirect("Login.html");
        }

        //跳转到首页
        //NameValueCollection data = new NameValueCollection();
        //data.Add("v1", "val1");
        //data.Add("v2", "val2");
        //HttpHelper.RedirectAndPOST(, "2.aspx", data);      
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }

    }
}