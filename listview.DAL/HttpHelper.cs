using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace listview.DAL
{
    public class HttpHelper
    {
        public string getHttp(string ak1, string sk1,string url,string Method)
        {

            string ak = ak1;
            string sk = sk1;
            HttpWebRequest req = WebRequest.Create(url) as HttpWebRequest;
            Uri uri = req.RequestUri;
            req.Method = Method;

            DateTime now = DateTime.Now;
            int expirationInSeconds = 1200;

            string signDate = now.ToUniversalTime().ToString("yyyy'-'MM'-'dd'T'HH':'mm':'ssK");
            // Console.WriteLine("请求时间是" + signDate);  //输出当前时间
            string authString = "bce-auth-v1/" + ak + "/" + signDate + "/" + expirationInSeconds;
            string signingKey = Hex(new HMACSHA256(Encoding.UTF8.GetBytes(sk)).ComputeHash(Encoding.UTF8.GetBytes(authString)));
            //Console.WriteLine(signingKey);  //认证字符串组成中的signingKey

            string canonicalRequestString = CanonicalRequest(req);
            //string canonicalRequestString = CanonicalRequest(Post(url, dic));
            //"GET\n/mybucket/%E6%88%91%E7%9A%84%E6%96%87%E4%BB%B6\n\nhost:bj.bcebos.com"	

            // Console.WriteLine(canonicalRequestString);

            string signature = Hex(new HMACSHA256(Encoding.UTF8.GetBytes(signingKey)).ComputeHash(Encoding.UTF8.GetBytes(canonicalRequestString)));
            string authorization = authString + "/host/" + signature;
            // Console.WriteLine("authorization是" + authorization);

            req.Headers.Add("x-bce-date", signDate);
            req.Headers.Add(HttpRequestHeader.Authorization, authorization);
            //Post(url, dic).Headers.Add("x-bce-date", signDate);
            //Post(url, dic).Headers.Add(HttpRequestHeader.Authorization, authorization);



            HttpWebResponse res;
            string message = "";
            string retString = "1";
            try
            {
                res = req.GetResponse() as HttpWebResponse;
                Stream myResponseStream = res.GetResponseStream();
                StreamReader myStreamReader = new StreamReader(myResponseStream, Encoding.UTF8);
                retString = myStreamReader.ReadToEnd();
            }
            catch (WebException e)
            {
                res = e.Response as HttpWebResponse;
                message = new StreamReader(res.GetResponseStream()).ReadToEnd();
            }
            if(Method== "DELETE")
            {
                if(retString == "1")
                { retString = message; }               
            }
            return retString;
        }
        static string UriEncode(string input, bool encodeSlash = false)
        {
            StringBuilder builder = new StringBuilder();
            foreach (byte b in Encoding.UTF8.GetBytes(input))
            {
                if ((b >= 'a' && b <= 'z') || (b >= 'A' && b <= 'Z') || (b >= '0' && b <= '9') || b == '_' || b == '-' || b == '~' || b == '.')
                {
                    builder.Append((char)b);
                }
                else if (b == '/')
                {
                    if (encodeSlash)
                    {
                        builder.Append("%2F");
                    }
                    else
                    {
                        builder.Append((char)b);
                    }
                }
                else
                {
                    builder.Append('%').Append(b.ToString("X2"));
                }
            }
            return builder.ToString();
        }

        static string Hex(byte[] data)
        {
            var sb = new StringBuilder();
            foreach (var b in data)
            {
                sb.Append(b.ToString("x2"));
            }
            return sb.ToString();
        }

        static string CanonicalRequest(HttpWebRequest req)
        {
            Uri uri = req.RequestUri;//统一资源标识符
            StringBuilder canonicalReq = new StringBuilder(); //可变字符串数组
            canonicalReq.Append(req.Method).Append("\n").Append(UriEncode(Uri.UnescapeDataString(uri.AbsolutePath))).Append("\n");
            //服务请求方法+"\n"+URI的绝对路径+"\n"
            //GET/ mybucket /% E6 % 88 % 91 % E7 % 9A % 84 % E6 % 96 % 87 % E4 % BB % B6
            // /*
            List<string> parameterStrings = new List<string>();
            if (req.Method != "PUT")
            {
                var parameters = HttpUtility.ParseQueryString(uri.Query); //将uri的查询字符串分析成一个集合               
                foreach (KeyValuePair<string, string> entry in parameters)
                {
                    parameterStrings.Add(UriEncode(entry.Key) + '=');  // + UriEncode(entry.Value));
                  // parameterStrings.Add(UriEncode(entry.Key) + '=' + UriEncode(entry.Value));
                }  //得到查询字符串集合的键=值
            }
            else
            {
                //该四行用于对后只有键没有值的情况处理
                string query = uri.Query;
                query = query.Remove(0, 1);
                parameterStrings.Add(UriEncode(query) + '=');
            }
            parameterStrings.Sort(); //对键=值排序
            canonicalReq.Append(string.Join("&", parameterStrings.ToArray())).Append("\n");
            //排序后键=值用&串联后存入字符串数组，尾部追加\n
            // */
            string host = uri.Host; //uri的主机部分
            if (!(uri.Scheme == "https" && uri.Port == 443) && !(uri.Scheme == "http" && uri.Port == 80))
            {
                host += ":" + uri.Port;
            } //如果uri的方案不是https或http，则uri的主机部分+URI的端口号
            canonicalReq.Append("host:" + UriEncode(host)); //字符串数组尾部追加host：编码后的host
            return canonicalReq.ToString();
        }
    }
}
