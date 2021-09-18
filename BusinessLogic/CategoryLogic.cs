using DataAccessLayer;
using DataAccessLayer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
    public class CategoryLogic
    {
        CategoryDAL dal = new CategoryDAL();
        public List<Category> CategoryList()
        {
            var listCategory = dal.GetCategoryList();
            return listCategory;
        }
        //[CREATE]
        public void CreateNewCategory(Category category)
        {
            dal.CreateNewCategory(category);
        }

        //[GET]
        public Category GetNewCategoryById(int? id)
        {
            Category category = dal.GetNewCategoryById(id);
            return category;

        }

        //[UPDATE]
        public void UpdateNewCategory(Category category)
        {
            dal.UpdateNewCategory(category);
        }

        //[DELETE]
        public void DeleteNewCategory(int id)
        {
            dal.DeleteNewCategory(id);
        }
    }
}
