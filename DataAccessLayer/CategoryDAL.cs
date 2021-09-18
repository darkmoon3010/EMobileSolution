using DataAccessLayer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class CategoryDAL
    {
        EMobileDBEntities db = new EMobileDBEntities();
        public List<Category> GetCategoryList()
        {
            var categories = db.Categories.ToList();
            return categories;
        }
        //[CREATE]
        public void CreateNewCategory(Category category)
        {
            db.Categories.Add(category);
            db.SaveChanges();
        }

        //[GET]
        public Category GetNewCategoryById(int? id)
        {
            Category category = db.Categories.Find(id);
            return category;

        }

        //[UPDATE]
        public void UpdateNewCategory(Category category)
        {
            db.Entry(category).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
        }

        //[DELETE]
        public void DeleteNewCategory(int id)
        {
            var category = db.Categories.Find(id);
            db.Categories.Remove(category);
            db.SaveChanges();
        }

    }
}
