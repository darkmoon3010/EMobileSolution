using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer.Models;

namespace BusinessLogic
{
    public class UserLogic
    {
        UserDAL dal = new UserDAL();
        public List<User> GetUserList()
        {
            var users = dal.GetUserList();
            return users;
        }
        //[CREATE]
        public void CreateNewUser(User user)
        {
            dal.CreateNewUser(user);
        }

        //[GET]
        public User GetUserById(int? id)
        {
            User user = dal.GetUserById(id);
            return user;

        }

        //[UPDATE]
        public void UpdateUser(User user)
        {
            
            dal.UpdateUser(user);
        }

        //[DELETE]
        public void DeleteUser(int id)
        {
       
            dal.DeleteUser(id);
        }

    }
}
