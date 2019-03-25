using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace listview.DAL
{
    public class SqlHelper
    {
        static string connStr = "server=.;uid=sa;pwd=sa;database=beidou";
        //private static readonly string connStr = ConfigurationManager.ConnectionStrings["connStr"].ConnectionString;
        public static DataTable GetTable(string sql,CommandType type,params SqlParameter[] pars)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                using (SqlDataAdapter atper = new SqlDataAdapter(sql, conn))
                {
                    atper.SelectCommand.CommandType = type;
                    if(pars!=null)
                    {
                        atper.SelectCommand.Parameters.AddRange(pars);
                    }
                    DataTable da = new DataTable();
                    atper.Fill(da);
                    return da;
                }
            }
        }
    }
}
