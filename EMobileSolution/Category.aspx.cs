using BusinessLogic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace EMobileSolution
{
    public partial class Category : System.Web.UI.Page
    {
        CategoryLogic logic = new CategoryLogic();
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["Status"]).ToString() == "IsLogout")
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                if (!String.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    divContentDetail.Visible = true;
                    divAdd_Edit.Visible = false;
                    var cat = logic.GetNewCategoryById(Convert.ToInt32((Request.QueryString["id"])));

                    lblName.Text = cat.Name;
                }
                else
                {
                    BindingCategoryDataIntoGridView();
                    divAdd_Edit.Visible = false;
                    divContentDetail.Visible = false;
                }
              
                
            }
        }

        private void BindingCategoryDataIntoGridView()
        {
            try
            {
                var listCategory = logic.CategoryList();
                grvListCategory.DataSource = listCategory;
                grvListCategory.DataBind();
            }
            catch (Exception)
            {
                throw;
            }
            
   
        }
        
        protected void btnAddNew_Click(object sender, EventArgs e)
        {
            divAdd_Edit.Visible = true;
            divGridView.Visible = false;
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
                BindingCategoryDataIntoGridView();
            }
        }

        private void Update()
        {
            try
            {
                var strName = txtCategoryName.Text.ToString().Trim();
                var cat = new DataAccessLayer.Models.Category()
                {
                    Name = strName,
                    CategoryId = Convert.ToInt32(hiddenFieldValue.Value)
                };
                logic.UpdateNewCategory(cat);
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
                var strName = txtCategoryName.Text.ToString().Trim();
                var cat = new DataAccessLayer.Models.Category()
                {
                    Name = strName
                };
                logic.CreateNewCategory(cat);
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
        private void ResetForm()
        {
            txtCategoryName.Text = string.Empty;
            divAdd_Edit.Visible = false;
            divContentDetail.Visible = false;
            divGridView.Visible = true;
            hiddenFieldValue.Value = string.Empty;
            lblDisplay.Visible = false;
        }

      

        protected void grvListCategory_RowCommand(object sender, GridViewCommandEventArgs e)
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
                        logic.DeleteNewCategory(Convert.ToInt32(strId));
                        lblDisplay.Visible = false;
                        BindingCategoryDataIntoGridView();
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
                var cat = logic.GetNewCategoryById(Convert.ToInt32(hiddenFieldValue.Value));
                txtCategoryName.Text = cat.Name;
            }
            catch (Exception ex)
            {
                lblDisplay.Visible = true;
                lblDisplay.Text = ex.Message;
            }
        }

        protected void btnGoBack_Click(object sender, EventArgs e)
        {
            ResetForm();
            BindingCategoryDataIntoGridView();
        }
    }

}