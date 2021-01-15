using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace candyshop
{
    public partial class Cart : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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

    }   
}