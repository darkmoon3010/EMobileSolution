using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMobileSolution
{
    public partial class SignUp : System.Web.UI.Page
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
            cmd.CommandText = "INSERT INTO [User](Username, Password)VALUES(@usernameval,@passwordval)";
            cmd.Parameters.AddWithValue("@usernameval", usernameTxt.Text);
            cmd.Parameters.AddWithValue("@passwordval", passwordTxt.Text);
            int result = cmd.ExecuteNonQuery();
            if (result > 0)
            {
                lblText.Text = "Đăng ký thành công";
                lblText.ForeColor = Color.Green;
            }
        }
    }
}