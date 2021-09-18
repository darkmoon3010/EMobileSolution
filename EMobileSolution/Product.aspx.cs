using BusinessLogic;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMobileSolution
{
    public partial class Product : System.Web.UI.Page
    {
        ProductLogic logic = new ProductLogic();
        
        private void ResetForm()
        {
            txtProductName.Text = string.Empty;
            //txtImage.Text = string.Empty;
            txtPrice.Text = string.Empty;
            divAdd_Edit.Visible = false;
            divContentDetail.Visible = false;
            divGridView.Visible = true;
            hiddenFieldValue.Value = string.Empty;
            lblDisplay.Visible = false;
        }
        private void LoadDataForEdit()
        {
            try
            {
                var product = logic.GetProductById(Convert.ToInt32(hiddenFieldValue.Value));
                txtProductName.Text = product.ProductName;
                //txtImage.Text = product.Image;
                txtPrice.Text = product.Price.ToString();
                drdlCategory.Text = drdlCategory.SelectedValue.ToString();
            }
            catch (Exception ex)
            {
                lblDisplay.Visible = true;
                lblDisplay.Text = ex.Message;
            }
        }

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
                    var product = logic.GetProductById(Convert.ToInt32((Request.QueryString["id"])));
                    lblName.Text = product.ProductName;
                    Image1.ImageUrl = product.Image;
                    lblPrice.Text = product.Price.ToString();
                    lblCategory.Text = product.CategoryId.ToString();
                }
                else
                {
                    BindingProductDataIntoGridView();
                    BindingCategoryDropdown();
                    divAdd_Edit.Visible = false;
                    divContentDetail.Visible = false;
                }


            }
        }
        private void BindingProductDataIntoGridView()
        {
            try
            {
                var listdata = logic.ProductList();
                grvListProduct.DataSource = listdata;
                grvListProduct.DataBind();
            }
            catch (Exception)
            {
                throw;
            }
        }
        private void BindingCategoryDropdown()
        {
            try
            {
                var cats = logic.GetCategoryList();
                drdlCategory.DataValueField = "CategoryId";
                drdlCategory.DataTextField = "Name";
                drdlCategory.DataSource = cats;
                drdlCategory.DataBind();
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
                BindingProductDataIntoGridView();
            }
        }
        private void Update()
        {
            string imagePathFile = string.Empty;
            if (FileUpload1.HasFile)
            {
                FileUpload1.SaveAs(Server.MapPath("~/images/" + FileUpload1.FileName));
                imagePathFile = "~/images/" + FileUpload1.FileName;
            }
            try
            {
                var strName = txtProductName.Text.ToString().Trim();
                var strImage = string.Format(imagePathFile);
                var strPrice = txtPrice.Text.Trim();
                var categoryId = drdlCategory.SelectedValue;

                var product = new DataAccessLayer.Models.Product()
                {
                    ProductName = strName,
                    Image = strImage,
                    Price = Convert.ToDecimal(strPrice),
                    CategoryId = Convert.ToInt32(categoryId),
                    ProductId = Convert.ToInt32(hiddenFieldValue.Value),
                };
                logic.UpdateProduct(product);
            }
            catch (Exception ex)
            {
                lblDisplay.Visible = true;
                lblDisplay.Text = ex.Message;
            }
        }

        private void Insert()
        {
            string imagePathFile = string.Empty;
            if (FileUpload1.HasFile)
            {
                FileUpload1.SaveAs(Server.MapPath("~/images/" + FileUpload1.FileName));
                imagePathFile = "~/images/" + FileUpload1.FileName;
            }
            try
            {
             
                //----------------------------------------------------//
                var strName = txtProductName.Text.ToString().Trim();
                var strImage = string.Format(imagePathFile);
                var strPrice = txtPrice.Text.ToString().Trim();
                var categoryId = drdlCategory.SelectedValue;

                var product = new DataAccessLayer.Models.Product
                {
                    ProductName = strName,
                    Image = strImage,
                    Price = Convert.ToDecimal(strPrice),
                    CategoryId = Convert.ToInt32(categoryId),
                };
                logic.CreateNewProduct(product);
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
            BindingProductDataIntoGridView();
        }


        protected void grvListProduct_RowCommand(object sender, GridViewCommandEventArgs e)
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
                        logic.DeleteProduct(Convert.ToInt32(strId));
                        lblDisplay.Visible = false;
                        BindingProductDataIntoGridView();
                    }
                    catch (Exception)
                    {
                        lblDisplay.Visible = true;
                        lblDisplay.Text = "Không thể xoá";
                    }
                    break;
            }
        }

       
    }
    
}