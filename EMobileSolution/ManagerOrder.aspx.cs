using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMobileSolution
{
    public partial class ManagerOrder : System.Web.UI.Page
    {
        OrderDAL logic = new OrderDAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["Status"]).ToString() == "IsLogout")
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                divProductList.Visible = false;

                if (!String.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    divProductList.Visible = true;
                    var order = logic.GetProductListByOrderId(Convert.ToInt32((Request.QueryString["id"])));
                    rptProductList.DataSource = order;
                    rptProductList.DataBind();

                    decimal? totalPrice = 0;
                    foreach(var item in order)
                    {
                        totalPrice += item.Price * item.Quantity;
                    }
                    lblTotalPrices.Text = string.Format("{0:###,###,###}", Convert.ToDecimal(totalPrice.ToString()));
                }
              
            }
        }

        protected void btnGoBack_Click(object sender, EventArgs e)
        {
            divProductList.Visible = false;
        }
    }
}