using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FinalProject.DAL;

namespace FinalProject.BLL
{
    public class Category
    {
        private int categID;
        private string categName;
        public Category(int categID, string categName)
        {
            this.categID = categID;
            this.categName = categName;
        }
        public Category()
        {
        }
        public int CategoryID { get => categID; set => categID = value; }
        public string CategoryName { get => categName; set => categName = value; }
        public void SaveCategory(Category cat)
        {
            CategoryDB.SaveCategoryRecord(cat);
        }
        public void DeleteCategory(Category cat)
        {
            CategoryDB.DeleteCategoryRecord(cat);
        }
        public List<Category> GetCategoryList()
        {
            return CategoryDB.GetCategoryList();
        }
        public void UpdateCategory(Category cat)
        {
            CategoryDB.UpdateCategoryRecord(cat);
        }
        public Category GetCategoryRecordID(int catId)
        {
            return CategoryDB.GetCategoryRecordID(catId);
        }
        public Category GetCategoryRecordName(string catName)
        {
            return CategoryDB.GetCategoryRecordName(catName);
        }
    }
}
