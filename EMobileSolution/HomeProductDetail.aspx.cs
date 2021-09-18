using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;

namespace EMobileSolution
{
    public partial class HomeProductDetail : System.Web.UI.Page
    {
        ProductLogic logic = new ProductLogic();

        protected void Page_Load(object sender, EventArgs e)
        {
            {
                if (!IsPostBack)
                {
                    GetProductDetailById();
                }
            }
        }
            private void GetProductDetailById()
            {
                if (!String.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    var product = logic.GetProductById(Convert.ToInt32(Request.QueryString["id"]));
                    var productList = new List<DataAccessLayer.Models.Product> { product };
                    dlProductDetail.DataSource = productList;
                    dlProductDetail.DataBind();
                }
            }
        }
    }

