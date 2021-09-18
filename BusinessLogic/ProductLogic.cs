using DataAccessLayer;
using DataAccessLayer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
    public class ProductLogic
    {
        ProductDAL dal = new ProductDAL();
        public List<Product> ProductList()
        {
            var listProduct = dal.ProductList();
            return listProduct;
        }
        public List<Product> ProductList(int? category)
        {
            var products = dal.ProductList(category);
            return products;
        }
        public List<Category> GetCategoryList()
        {
            var cats = dal.GetCategoryList();
            return cats;
        }
        //[CREATE]
        public void CreateNewProduct(Product product)
        {
            dal.CreateNewProduct(product);
        }

        //[GET]
        public Product GetProductById(int? id)
        {
            Product product = dal.GetProductById(id);
            return product;

        }

        //[UPDATE]
        public void UpdateProduct(Product product)
        {
            dal.UpdateProduct(product);
        }

        //[DELETE]
        public void DeleteProduct(int id)
        {
            dal.DeleteProduct(id);
        }

        public void UpdateProduct(Category cat)
        {
            throw new NotImplementedException();
        }
    }
}
