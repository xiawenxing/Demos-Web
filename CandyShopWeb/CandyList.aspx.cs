using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace candyshop
{
    public partial class CandyList : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            Menu1_DataBinding(sender,e);
        }
       
        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Command(object sender, CommandEventArgs e)
        {
            Response.Redirect("CandyInfo.aspx?Id=" + e.CommandArgument.ToString());
        }

        protected void LinkButton2_Command(object sender, CommandEventArgs e)
        {
            Response.Redirect("CandyInfo.aspx?Id=" + e.CommandArgument.ToString());
        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {

            if (Menu1.SelectedItem.Text == "SignIn")
            {
                Response.Redirect("Signin.aspx?callingpage=" + Request.CurrentExecutionFilePath.Substring(Request.CurrentExecutionFilePath.LastIndexOf("/") + 1));
            }
            else if (Menu1.SelectedItem.Text == "SignUp")
            {
                Response.Redirect("SignupPage.aspx?callingpage=" + Request.CurrentExecutionFilePath.Substring(Request.CurrentExecutionFilePath.LastIndexOf("/") + 1));
            }
            else if (Menu1.SelectedItem.Text == "SignOut")
            {
                if (Request.Cookies["user"] != null&&Request.Cookies["user"].Values["isLogin"]=="True")
                {
                    HttpCookie usercook = new HttpCookie("user");
                    usercook.Values["isLogin"] = "False";
                    usercook.Expires = DateTime.Now.AddDays(5);
                    Response.Cookies.Add(usercook);
                }
                else {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('please login in first');</script>");
                }
            }
            else if (Menu1.SelectedItem.Text == "My Cart")
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

        protected void Menu1_DataBinding(object sender, EventArgs e)
        {
            
            if (Request.Cookies["user"] == null || Request.Cookies["user"].Values["isLogin"] != "True")
            {
                Menu1.Items[0].Text = "tourist";
            }
            else
            {
                Menu1.Items[0].Text = Request.Cookies["user"].Values["username"];
            }
            
        }
    }
}