using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer.Models;

namespace DataAccessLayer
{
    public class OrderDAL
    {
        EMobileDBEntities db = new EMobileDBEntities();
        public List<Order> GetOrderList()
        {
            var Order = db.Orders.OrderByDescending(x => x.OrderId).ToList();
            return Order;
        }

        public Order GetOrderById(int? id)
        {
            Order Order = db.Orders.Find(id);
            return Order;
        }

  
        //[UPDATE]
        public void UpdateOrder(Order Order)
        {
            db.Entry(Order).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
        }

        //[DELETE]
        public void DeleteOrder(int id)
        {
            var orderDetail = db.OderDetails.Where(x => x.OrderId.Equals(id)).ToList();
            foreach(var item in orderDetail)
            {
                db.OderDetails.Remove(item);
                db.SaveChanges();
            }
            var product = db.Orders.Find(id);
            db.Orders.Remove(product);
            db.SaveChanges();
        }
        public List<OderDetail> GetProductListByOrderId(int OrderId)
        {
            var orderDetails = db.OderDetails.Where(x => x.OrderId.Equals(OrderId)).ToList();
            return orderDetails;
        }
    }
 }
