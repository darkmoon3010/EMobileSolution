using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer.Models;
namespace DataAccessLayer
{
    public class ShoppingCartDAL
    {
        EMobileDBEntities db = new EMobileDBEntities();
        
        public bool CheckOut(Order order, List<Cart> lstCart)
        {
            bool check = false;
            //1. save the order into order table
            var userOrder = new Order()
            {
                CustomerName = order.CustomerName,
                CustomerPhone = order.CustomerPhone,
                CustomerAddress = order.CustomerAddress,
                CustomerEmail = order.CustomerEmail,
                OrderDate = DateTime.Now,
                PaymentType = "Tiền mặt",
                Status = "Đang xử lý",
            };
            try
            {
                db.Orders.Add(userOrder);
                db.SaveChanges();
                check = true;
            }
            catch (Exception)
            {

                check = false;
            }
            //2 save orderdetail into OD table
            foreach(Cart cart in lstCart)
            {
                OderDetail oderDetail = new OderDetail()
                {
                    OrderId = userOrder.OrderId,
                    ProductId = cart.Product.ProductId,
                    Quantity = cart.Quantity,
                    Price = cart.Product.Price
                };
                try
                {
                    db.OderDetails.Add(oderDetail);
                    db.SaveChanges();
                    check = true;
                }
                catch (Exception)
                {

                    check = false;
                    
                }
            }
            return check;
        }
    }
}
