using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using listview.Model;
using listview.DAL;

namespace listview.DAL
{
    public class JsonParserList
    {
        public List<DatabasesInformation> databases; //数据库列表

    }
    public class JsonMetricList
    {
        public List<string> metrics; //metric列表
    }

}
