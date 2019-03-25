using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using listview.Model;
using System.Data;

namespace listview.DAL
{
    public class UserInfoDal
    {
        /// <summary>
        /// 返回用户列表
        /// </summary>
        /// <returns></returns>
        public List<UserInfo>GetList()
        {
            string sql = "select *from USERS";
            DataTable da = SqlHelper.GetTable(sql, CommandType.Text);
            List<UserInfo>list = null;
            if(da.Rows.Count>0)
            {
                list = new List<UserInfo>();
                UserInfo userInfo = null;
                foreach(DataRow row in da.Rows)
                {
                    userInfo = new UserInfo();
                    LoadEntity(row, userInfo);
                    list.Add(userInfo);
                }
            }
            return list;
        }

        private void LoadEntity(DataRow row,UserInfo userInfo)
        {
            userInfo.name = row[0] != DBNull.Value ? row[0].ToString() : string.Empty;
            userInfo.password = row[1] != DBNull.Value ? row[1].ToString() : string.Empty;
            userInfo.QX = row[2] != DBNull.Value ? row[2].ToString() : string.Empty;
            userInfo.role = row[3] != DBNull.Value ? row[3].ToString() : string.Empty;
        }


    }
}
