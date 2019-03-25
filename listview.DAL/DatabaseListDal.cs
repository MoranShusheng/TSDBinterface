using listview.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace listview.DAL
{
    public class DatabaseListDal
    {
        public List<string> Getfields(string json) //field列表
        {
            List<string> list = new List<string>();
            JObject o = JsonConvert.DeserializeObject<JObject>(json);
            foreach (JToken child in o.Children())
            {
                foreach (JToken grandChild in child)
                {
                    foreach (JToken grandGrandChild in grandChild)
                    {
                        var property = grandGrandChild as JProperty;
                        if (property != null)
                        {
                            string name = property.Name;  //获得键名称
                            list.Add(name); //键名称填充到list列表
                        }
                    }

                }
            }            
            return list;
        }
        public List<string> GetMetrics(string json) //metric列表
        {
            JsonMetricList JML = JsonConvert.DeserializeObject<JsonMetricList>(json);
            List<string> list = JML.metrics;
            return list;
        }
        public List<DatabasesInformation> GetDatabaseList(string json) //数据库列表
        {
            JsonParserList jp = JsonConvert.DeserializeObject<JsonParserList>(json);
            List<DatabasesInformation> list = jp.databases;
            return list;
        }
        public DatabasesInformation GetDatabaseInformation(string json) //一个数据库详细信息
        {
            //JsonParser jp = JsonConvert.DeserializeObject<JsonParser>(json);
            //DatabasesInformation databasesInformation = jp.databasesInformation;
            DatabasesInformation databasesInformation=JsonConvert.DeserializeObject<DatabasesInformation>(json);
            return databasesInformation;
        }
        public DatabaseDelect GetListDatabaseDelect(string json)
        {
            //JsonParser jp = JsonConvert.DeserializeObject<JsonParser>(json);
            DatabaseDelect databaseDelect = JsonConvert.DeserializeObject<DatabaseDelect>(json);
            return databaseDelect;
        }

        //日期格式转为unix时间戳
        public static int getUnixtime(string datatime)
        {
            DateTime date = Convert.ToDateTime(datatime);
            System.DateTime startTime = TimeZone.CurrentTimeZone.ToLocalTime(new System.DateTime(1970, 1, 1));
            int unixtime = (int)(date - startTime).TotalSeconds;
            return unixtime;
        }
    }
}
