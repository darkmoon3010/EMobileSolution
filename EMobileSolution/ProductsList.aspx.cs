using BusinessLogic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMobileSolution
{
    public partial class ProductsList : System.Web.UI.Page
    {
        ProductLogic logic = new ProductLogic();
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["Status"]).ToString() == "IsLogout")
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                GetProductList();
            }
        }
        private void GetProductList()
        {
            List<DataAccessLayer.Models.Product> products = new List<DataAccessLayer.Models.Product>();
            string category = Request.QueryString["cat"];
            if (!string.IsNullOrEmpty(category))
            {
                products = logic.ProductList(Convert.ToInt32(category));
            }
            else products = logic.ProductList();
            try
            {
                rptLastestProducts.DataSource = products.OrderByDescending(x => x.ProductId);
                rptLastestProducts.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
        }
        }
}
