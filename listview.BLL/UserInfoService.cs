using listview.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;

namespace listview.BLL
{
    public class UserInfoService
    {
        DAL.UserInfoDal userInfoDal = new DAL.UserInfoDal();
        DAL.HttpHelper httpHelper = new DAL.HttpHelper();
        DAL.DatabaseListDal databaseListDal = new DAL.DatabaseListDal();

        public List<UserInfo> GetList()
        {
            return userInfoDal.GetList();
        }
        public DatabaseDelect GetListDatabaseDelect(string json)
        {
            return databaseListDal.GetListDatabaseDelect(json);
        }
        public List<string> Getfields(string json) //field列表
        {
            return databaseListDal.Getfields(json);
        }
        public  List<string> GetMetrics(string json) //metric列表
        {
            return databaseListDal.GetMetrics(json);
        }
        public List<DatabasesInformation> GetList(string json) //数据库列表
        {
            return databaseListDal.GetDatabaseList(json);
        }
        public DatabasesInformation GetdatabasesInformation(string json) //一个数据库详细信息
        {
            return databaseListDal.GetDatabaseInformation(json);
        }
        public string getHttp(string ak, string sk, string url, string Method)
        {
            return httpHelper.getHttp(ak, sk, url, Method);
        }
        public static int getUnixtime(string datatime)
        {
            return DAL.DatabaseListDal.getUnixtime(datatime);
        } 

    }
}
