using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Security.Cryptography;

namespace candyshop
{
    public partial class CandyInfo : Page
    {
        int itemid;
        string price;
        string picture;
        string name;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            int.TryParse(Request.QueryString["Id"],out itemid);
            this.databind(itemid);
            Menu2_DataBinding(sender,e);
        }

        //connect to sql
        public SqlConnection SqlConnection() {
            string conn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(conn);
            return sqlconn;
        }

        public void databind(int id)
        {
            SqlConnection sqlconn = SqlConnection();
            sqlconn.Open();
            string querystr = "select * from candyinfo where Id=" + id.ToString();
            SqlDataAdapter data = new SqlDataAdapter(querystr, sqlconn);
            DataTable dt = new DataTable();
            data.Fill(dt);
            DataRow row= dt.Rows[0];

            this.Image2.ImageUrl = row["PicturePath"].ToString();
            this.Label1.Text = row["Name"].ToString();
            this.Label2.Text = row["Price"].ToString();
            this.Label3.Text = row["Num"].ToString();
            this.Label4.Text = row["Description"].ToString();

            picture = this.Image2.ImageUrl;
            price = this.Label2.Text;
            name = this.Label1.Text;

            sqlconn.Close();
        }

        protected void Menu2_MenuItemClick(object sender, MenuEventArgs e)
        {
            if (Menu2.SelectedItem.Text == "SignIn")
            {
                Response.Redirect("Signin.aspx?callingpage=" + Request.CurrentExecutionFilePath.Substring(Request.CurrentExecutionFilePath.LastIndexOf("/") + 1));
            }
            else if (Menu2.SelectedItem.Text == "SignUp")
            {
                Response.Redirect("SignupPage.aspx?callingpage=" + Request.CurrentExecutionFilePath.Substring(Request.CurrentExecutionFilePath.LastIndexOf("/") + 1));
            }
            else if (Menu2.SelectedItem.Text == "SignOut")
            {
                if (Request.Cookies["user"] != null && Request.Cookies["user"].Values["isLogin"] == "True")
                {
                    HttpCookie usercook = new HttpCookie("user");
                    usercook.Values["isLogin"] = "False";
                    usercook.Expires = DateTime.Now.AddDays(5);
                    Response.Cookies.Add(usercook);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('please login in first');</script>");
                }
            }
            else if (Menu2.SelectedItem.Text == "My Cart")
            {
                if (Request.Cookies["user"] != null && Request.Cookies["user"].Values["isLogin"] == "True")
                {
                    Response.Redirect("Cart.aspx?uid=" + Request.Cookies["user"].Values["id"]);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('please login in first');</script>");
                }
        
            }
        }

        protected void Menu2_DataBinding(object sender, EventArgs e)
        {
            if (Request.Cookies["user"] == null || Request.Cookies["user"].Values["isLogin"] != "True")
            {
                Menu2.Items[0].Text = "tourist";
            }
            else
            {
                Menu2.Items[0].Text = Request.Cookies["user"].Values["username"];
            }
        }

        protected void cart_Click(object sender, ImageClickEventArgs e)
        {
            //is login?
            if (Request.Cookies["user"] == null || Request.Cookies["user"].Values["isLogin"] != "True")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('please login in first');</script>");
            }
            else
            {
                int uid = int.Parse(Request.Cookies["user"].Values["id"]);
                // --connect to database
                SqlConnection sqlcon = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                sqlcon.Open();
                SqlDataAdapter da = new SqlDataAdapter("select * from cart", sqlcon);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt == null || dt.Select("UId = '" +uid.ToString() +"' and ItemId = '"+itemid.ToString()+"'").Length == 0)
                {
                    string sqlstr = "insert into cart values(" + uid.ToString() + "," + itemid.ToString() + ",1,"+dt.Rows.Count.ToString()+",'"+picture+"','"+name+"',"+price+")";
                    SqlCommand sqlcomm = new SqlCommand(sqlstr, sqlcon);
                    int i = Convert.ToInt32(sqlcomm.ExecuteNonQuery());
                    if (i >= 1)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('sucess, now there is 1 in your cart');</script>");
                        sqlcon.Close();
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('Failed, please retry');</script>");
                        sqlcon.Close();
                    }
                }
                else
                {
                    int num = int.Parse(dt.Select("UId = '" + uid.ToString() + "' and ItemId = '" + itemid.ToString() + "'")[0]["num"].ToString());
                    num++;
                    string sqlstr = "update cart set num = '"+num.ToString()+"' where UId = '"+ uid.ToString() + "' and ItemId = '" + itemid.ToString() + "'";
                    SqlCommand sqlcomm = new SqlCommand(sqlstr, sqlcon);
                    int i = Convert.ToInt32(sqlcomm.ExecuteNonQuery());
                    if (i >= 1)
                    {
                        sqlcon.Close();
                        ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('success, now there is "+num.ToString()+" in your cart');</script>");
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('Failed, please retry');</script>");
                        sqlcon.Close();
                    }

                }
            }
        }
    }
}