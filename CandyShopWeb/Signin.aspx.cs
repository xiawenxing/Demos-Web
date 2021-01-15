using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace candyshop
{
    public partial class Signin : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            // --connect to database
            SqlConnection sqlcon = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            sqlcon.Open();
            SqlDataAdapter da = new SqlDataAdapter("select * from Userinfo",sqlcon);
            DataTable dt = new DataTable();
            da.Fill(dt);

            // --select the row containing username
            if (dt==null||dt.Select("Name = '" + Login1.UserName + "'").Length == 0)
            {
                // 提示不存在该用户，需要注册
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('account doesnot exist, ensure the username is right');</script>");
            }
            else
            {
                DataRow[] usr= dt.Select("Name = '" + Login1.UserName + "'" + "and Password = '" + Login1.Password + "'");
                
                if (usr.Length>0)
                {
                    //登陆成功
                    // save cookies
         
                    HttpCookie usercook = new HttpCookie("user");
                    usercook.Values["username"] = Login1.UserName;
                    usercook.Values["password"] = Login1.Password;
                    usercook.Values["isRemember"] = Login1.RememberMeSet.ToString();
                    usercook.Values["id"] = usr[0]["id"].ToString();
                    usercook.Values["isLogin"] = "True";
                    usercook.Expires = DateTime.Now.AddDays(5);
                    Response.Cookies.Add(usercook);
                    
                    Response.Redirect(Request["callingpage"]);
                }
                else
                {
                    //提示密码错误
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('password is wrong');</script>");
                }

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignupPage.aspx");
        }
    }
}
