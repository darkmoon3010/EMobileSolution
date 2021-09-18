using DataAccessLayer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class ProductDAL
    {
     
        EMobileDBEntities db = new EMobileDBEntities();
        public List<Product> ProductList()
        {
            var products = db.Products.ToList();
            return products;
        }
        public List<Product> ProductList(int? category)
        {
            if(category != null)
            {
                var products = db.Products
                                .OrderByDescending(x => x.ProductId)
                                .Where(x => x.CategoryId == category)
                                .ToList();
                return products;
            }
            else
            {
                var products = db.Products.OrderByDescending(x=>x.ProductId).ToList();
                return products;
            }
            
        }
        public List<Category> GetCategoryList()
        {
            var cats = db.Categories.ToList();
            return cats;
        }
        //[CREATE]
        public void CreateNewProduct(Product product)
            {
                db.Products.Add(product);
                db.SaveChanges();
            }

            //[GET]
            public Product GetProductById(int? id)
            {
                Product product = db.Products.Find(id);
                return product;

            }

            //[UPDATE]
            public void UpdateProduct(Product product)
            {
                db.Entry(product).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
            }

            //[DELETE]
            public void DeleteProduct(int id)
            {
                var product = db.Products.Find(id);
                db.Products.Remove(product);
                db.SaveChanges();
            }

        }
    }
