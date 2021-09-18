using DataAccessLayer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class UserDAL
    {
        EMobileDBEntities db = new EMobileDBEntities();
        public List<User> GetUserList()
        {
            var users = db.Users.ToList();
            return users;
        }
        //[CREATE]
        public void CreateNewUser(User user)
        {
            db.Users.Add(user);
            db.SaveChanges();
        }

        //[GET]
        public User GetUserById(int? id)
        {
            User user = db.Users.Find(id);
            return user;

        }

        //[UPDATE]
        public void UpdateUser(User user)
        {
            db.Entry(user).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
        }

        //[DELETE]
        public void DeleteUser(int id)
        {
            var user = db.Users.Find(id);
            db.Users.Remove(user);
            db.SaveChanges();
        }

    }
}

