using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMobileSolution
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["EMobileDBConnectionString"].ToString();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "SELECT * FROM [User] WHERE Username= @username AND Password= @password";
            cmd.Parameters.AddWithValue("@username", usernameTxt.Text);
            cmd.Parameters.AddWithValue("@password", passwordTxt.Text);
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.HasRows)
            {
                Session["Username"] = usernameTxt.Text.Trim();
                Session["Status"] = "IsLogin";
                Response.Redirect("Product.aspx");
            }
           
        }
    }
}