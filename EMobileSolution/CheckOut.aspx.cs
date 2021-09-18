using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using DataAccessLayer.Models;

namespace EMobileSolution
{
    public partial class CheckOut : System.Web.UI.Page
    {
        EMobileDBEntities db = new EMobileDBEntities();
        ShoppingCartLogic logic = new ShoppingCartLogic();
        private string strCart = "Cart";
        protected void Page_Load(object sender, EventArgs e)
        {
            divProductList.Visible = true;
            divClientInfo.Visible = true;

            if (!IsPostBack)
            {
                LoadingDataToShoppingCart();
            }
        }

        private void LoadingDataToShoppingCart()
        {
            List<Cart> lstCart = new List<Cart>();
            decimal? totalPrice = 0;
            if (Session[strCart] != null)
            {
                lstCart = (List<Cart>)Session[strCart];
                if (lstCart.Count > 0)
                {
                    rptProductList.DataSource = Session[strCart];
                    rptProductList.DataBind();

                    foreach (var item in lstCart)
                    {
                        totalPrice += item.Price * item.Quantity;
                    }
                    lblTotalPrices.Text = string.Format("{0:###,###,###}", Convert.ToDecimal(totalPrice.ToString()));
                }
                else
                {
                    Response.Redirect("~/HomeShoppingCart.aspx");
                }
            }
            else
            {
                Response.Redirect("~/HomeShoppingCart.aspx");
            }
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            Order order = new Order()
            {
                CustomerName = txtName.Text.Trim(),
                CustomerPhone = txtPhone.Text.Trim(),
                CustomerEmail = txtEmail.Text.Trim(),
                CustomerAddress = txtAddress.Text.Trim()
            };
            var check = logic.CheckOut(order, (List<Cart>)Session[strCart]);
            if (check)
            {
                Session.Remove(strCart);
                lblText.Text = "Thanh toán thành công";
                divProductList.Visible = false;
                divClientInfo.Visible = false;
            }
            else
            {
                lblText.Text = "Không thể lưu hoá đơn";
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtAddress.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtName.Text = string.Empty;
            txtPhone.Text = string.Empty;
        }
    }
       
}