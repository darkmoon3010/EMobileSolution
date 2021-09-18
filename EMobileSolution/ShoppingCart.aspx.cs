using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccessLayer.Models;

namespace EMobileSolution
{
    public partial class ShoppingCart : System.Web.UI.Page
    {
        EMobileDBEntities db = new EMobileDBEntities();
        private string strCart = "Cart";
        bool isDelete = false;
        bool isUpdate = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["Status"]).ToString() == "IsLogout")
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                LoadingDataToShoppingCart();
            }
        }

        private void LoadingDataToShoppingCart()
        {
            int proId;
            List<Cart> lstCart = new List<Cart>();
            decimal? totalPrice = 0;
            var check = int.TryParse(Request.QueryString["proId"] , out proId);
            if (check && !isDelete & !isUpdate)
            {
                lstCart = OrderNow(proId);
                rptProductList.DataSource = lstCart;
                rptProductList.DataBind();
                foreach (var item in lstCart)
                {
                    totalPrice += item.Price * item.Quantity;
                }
                lblTotalPrices.Text = string.Format("{0:###,###,###}", Convert.ToDecimal(totalPrice.ToString()));
            }
            else
            {
                if(Session[strCart] != null)
                {
                    lstCart = (List<Cart>)Session[strCart];
                    if (lstCart.Count > 0) 
                    { 
                        rptProductList.DataSource = Session[strCart];
                        rptProductList.DataBind();

                        foreach(var item in lstCart)
                        {
                            totalPrice += item.Price * item.Quantity;
                        }
                        lblTotalPrices.Text = string.Format("{0:###,###,###}", Convert.ToDecimal(totalPrice.ToString()));
                    }
                    else
                    {
                        lblText.Text = "Không có sản phẩm nào trong giỏ hàng";
                        divProductList.Visible = false;
                    }
                }
                else
                {
                    lblText.Text = "Không có sản phẩm";
                }
            }
        }
        public List<Cart> OrderNow(int? id)
        {
            if (Session[strCart] == null)
            {
                List<Cart> lstCart = new List<Cart>
                {
                    new Cart(db.Products.Find(id), 1)
                };
                Session[strCart] = lstCart;
            }
            else
            {
                List<Cart> lstCart = (List<Cart>)Session[strCart];
                int check = IsExistingCheck(id);
                if (check == -1)
                    lstCart.Add(new Cart(db.Products.Find(id), 1));
                else
                {
                    lstCart[check].Quantity++;
                    lstCart[check].Subtotal = lstCart[check].Price * lstCart[check].Quantity;
                }
                Session[strCart] = lstCart;
            }
            return (List<Cart>)Session[strCart];
        }
        private int IsExistingCheck(int? id)
        {
            List<Cart> lstCart = (List<Cart>)Session[strCart];
            for (int i = 0; i < lstCart.Count; i++)
            {
                if (lstCart[i].Product.ProductId == id) return i;
            }
            return -1;
        }
        protected void rptProductList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            
        }

        protected void rptProductList_ItemCreated(object sender, RepeaterItemEventArgs e)
        {

        }
        protected void linkDelete_Click(object sender, EventArgs e)
        {
            int productId = int.Parse(((sender as LinkButton).NamingContainer.FindControl("lblProductId") as Label).Text);
            int check = IsExistingCheck(productId);
            List<Cart> lstCart = (List<Cart>)Session[strCart];
            lstCart.RemoveAt(check);
            isDelete = true;
            LoadingDataToShoppingCart();

        }

     

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            List<Cart> lstCart = (List<Cart>)Session[strCart];
            for (int i=0; i<rptProductList.Items.Count; i++)
            {
                RepeaterItem item = rptProductList.Items[i];
                var txtQuantity = (TextBox)item.FindControl("txtQuantity");
                lstCart[i].Quantity = Convert.ToInt32(txtQuantity.Text);
                lstCart[i].Subtotal = lstCart[i].Price * lstCart[i].Quantity;
            }
            Session[strCart] = lstCart;
            isUpdate = true;
            LoadingDataToShoppingCart();
        }
    }
}