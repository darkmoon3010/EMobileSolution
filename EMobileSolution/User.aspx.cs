using BusinessLogic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMobileSolution
{
    public partial class User : System.Web.UI.Page
    {
        UserLogic logic = new UserLogic();
        private void ResetForm()
        {
            txtUser.Text = string.Empty;
            txtPassword.Text = string.Empty;
            divAdd_Edit.Visible = false;
            divContentDetail.Visible = false;
            divGridView.Visible = true;
            hiddenFieldValue.Value = string.Empty;
            lblDisplay.Visible = false;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["Status"]).ToString() == "IsLogout")
            {
                Response.Redirect("User.aspx");
            }
            if (!IsPostBack)
            {

                    if (!String.IsNullOrEmpty(Request.QueryString["id"]))
                    {
                        divContentDetail.Visible = true;
                        divAdd_Edit.Visible = false;
                        var user = logic.GetUserById(Convert.ToInt32((Request.QueryString["id"])));
                        lblName.Text = user.Username;
                        lblPassword.Text = user.Password;
                    }
                    else
                    {
                        BindingUserDataIntoGridView();
                        divAdd_Edit.Visible = false;
                        divContentDetail.Visible = false;
                    }
                }
        }

        
           

        private void BindingUserDataIntoGridView()
        {
            try
            {
                var listUser = logic.GetUserList();
                grvListUser.DataSource = listUser;
                grvListUser.DataBind();
            }
            catch (Exception)
            {
                throw;
            }
        }


        protected void grvListUser_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string strId = e.CommandArgument.ToString();
            string strName = e.CommandName.ToLower();
            switch (strName)
            {
                case "_edit":
                    divAdd_Edit.Visible = true;
                    divGridView.Visible = false;
                    hiddenFieldValue.Value = strId;
                    LoadDataForEdit();
                    break;
                case "_delete":
                    try
                    {
                        logic.DeleteUser(Convert.ToInt32(strId));
                        lblDisplay.Visible = false;
                        BindingUserDataIntoGridView();
                    }
                    catch (Exception)
                    {
                        lblDisplay.Visible = true;
                        lblDisplay.Text = "Không thể xoá";
                    }
                    break;
            }
        }
        private void LoadDataForEdit()
        {
            try
            {
                var user = logic.GetUserById(Convert.ToInt32(hiddenFieldValue.Value));
                txtUser.Text = user.Username;
                txtPassword.Text = user.Password;
            }
            catch (Exception ex)
            {
                lblDisplay.Visible = true;
                lblDisplay.Text = ex.Message;
            }
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                if (hiddenFieldValue.Value == string.Empty)
                {
                    Insert();
                }
                else
                {
                    Update();
                }
                ResetForm();
                BindingUserDataIntoGridView();
            }
        }
        private void Update()
        {
            try
            {
                var strName = txtUser.Text.ToString().Trim();
                var strPassword = txtPassword.Text.ToString().Trim();

                var user = new DataAccessLayer.Models.User()
                {
                    Username = strName,
                    Password = strPassword,
                    UserId = Convert.ToInt32(hiddenFieldValue.Value),
                };
                logic.UpdateUser(user);
            }
            catch (Exception ex)
            {
                lblDisplay.Visible = true;
                lblDisplay.Text = ex.Message;
            }
        }

        private void Insert()
        {
            try
            {
                var strName = txtUser.Text.ToString().Trim();
                var strPassword = txtPassword.Text.ToString().Trim();
                var user = new DataAccessLayer.Models.User()
                {
                    Username = strName,
                    Password = strPassword,
                };
                logic.CreateNewUser(user);
            }
            catch (Exception ex)
            {
                lblDisplay.Visible = true;
                lblDisplay.Text = ex.Message;
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ResetForm();
        }

        protected void btnGoBack_Click(object sender, EventArgs e)
        {
            ResetForm();
            BindingUserDataIntoGridView();
        }

        protected void hiddenFieldValue_ValueChanged(object sender, EventArgs e)
        {

        }

        protected void btnAddNew_Click(object sender, EventArgs e)
        {
            divAdd_Edit.Visible = true;
            divGridView.Visible = false;
        }
    }
}