using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.HtmlControls;


namespace candyshop
{
    public partial class SignupPage : Page
    {
        string address;
        string phone;
        protected void Page_Load(object sender, EventArgs e)
        {
            CreateUserWizard1.Question = "1";
            CreateUserWizard1.Answer = "1";
        }


        protected void CreateUserWizard1_ContinueButtonClick(object sender, EventArgs e)
        {
            // --connect to database
            SqlConnection sqlcon = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            sqlcon.Open();
            SqlDataAdapter da = new SqlDataAdapter("select * from Userinfo", sqlcon);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt==null||dt.Select("Name = '" + CreateUserWizard1.UserName + "'").Length == 0)
            {
                string sqlstr = "insert into Userinfo values(" + dt.Rows.Count.ToString() + ",'" + CreateUserWizard1.UserName.ToString()+ "','" + CreateUserWizard1.Password.ToString()+ "',NULL,NULL)";
                SqlCommand sqlcomm = new SqlCommand(sqlstr, sqlcon);
                int i = Convert.ToInt32(sqlcomm.ExecuteNonQuery());
                if (i >= 1)
                {
                    CreateUserWizard1.ActiveStepIndex = 1;
                    sqlcon.Close();
                }else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('Failed, please retry');</script>");
                    sqlcon.Close();
                    CreateUserWizard1.ActiveStepIndex = 0;
                }
            }
            else if(CreateUserWizard1.ActiveStepIndex == 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('account already exist, try another username');</script>");
                sqlcon.Close();
                CreateUserWizard1.ActiveStepIndex = 0;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Signin.aspx?callingpage="+Request["callingpage"].ToString());
        }
    }

}
