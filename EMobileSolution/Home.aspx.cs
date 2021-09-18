using BusinessLogic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMobileSolution
{
    public partial class Home1 : System.Web.UI.Page
    {
        ProductLogic logic = new ProductLogic();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                LastestProducts();
            }
        }
            private void LastestProducts()
            {
                var products = logic.ProductList();
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
