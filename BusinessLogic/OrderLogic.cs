using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer.Models;

namespace BusinessLogic
{

    public class OrderLogic
    {
        OrderDAL dal = new OrderDAL();
        public List<Order> GetOrderList()
        {
            return GetOrderList();
        }

        public Order GetOrderById(int? id)
        {
            return dal.GetOrderById(id);
        }


        //[UPDATE]
        public void UpdateOrder(Order Order)
        {
            dal.UpdateOrder(Order);
        }

        //[DELETE]
        public void DeleteOrder(int id)
        {
            dal.DeleteOrder(id);
        }
        public List<OderDetail> GetProductListByOrderId(int OrderId)
        {
            return dal.GetProductListByOrderId(OrderId);
        }
    }
}

