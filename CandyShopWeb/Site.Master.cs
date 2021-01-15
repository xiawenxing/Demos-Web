using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace candyshop
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

   /*     protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {
            if (Menu1.SelectedItem.Text == "SignIn")
            {
                Response.Redirect("Signin.aspx?callingpage="+ Request.CurrentExecutionFilePath.Substring(Request.CurrentExecutionFilePath.LastIndexOf("/") + 1));
            }
            else if (Menu1.SelectedItem.Text == "SignUp")
            {
                Response.Redirect("SignupPage.aspx?callingpage=" + Request.CurrentExecutionFilePath.Substring(Request.CurrentExecutionFilePath.LastIndexOf("/") + 1));
            }
        }*/
    }
}