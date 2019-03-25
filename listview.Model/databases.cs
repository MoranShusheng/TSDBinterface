using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace listview.Model
{
    //数据库详细信息对象
   public class DatabasesInformation
    {
        public string databaseId { get; set; }
        public string databaseName { get; set; }
        public string description { get; set; }
        public string endpoint { get; set; }
        public quota quota { get; set; }

        public string status { get; set; }
        public Boolean autoExport { get; set; }
        public DateTime createTime { get; set; }
        public DateTime expiredTime { get; set; }
    }
    public class quota
    {
        public string ingestDataPointsMonthly { get; set; }
        public string storeBytesQuota { get; set; }
    }

    //删除数据库信息对象
    public class DatabaseDelect
    {
        public string requestId { get; set; } 
        public string code { get; set; }
        public string message { get; set; }
    }

}
