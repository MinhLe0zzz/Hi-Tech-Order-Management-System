using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FinalProject.DAL;

namespace FinalProject.BLL
{
    public class Publisher
    {
        private int pubID;
        private string pubName;
        private string pubWeb;
        public Publisher(int pubID, string pubName, string pubWeb)
        {
            this.pubID = pubID;
            this.pubName = pubName;
            this.pubWeb = pubWeb;
        }
        public Publisher()
        {
        }
        public int PublisherID { get => pubID; set => pubID = value; }
        public string PublisherName { get => pubName; set => pubName = value; }
        public string PublisherWeb { get => pubWeb; set => pubWeb = value; }
        public void SavePublisher(Publisher pub)
        {
            PublisherDB.SavePublisherRecord(pub);
        }
        public void DeletePublisher(Publisher pub)
        {
            PublisherDB.DeletePublisherRecord(pub);
        }
        public List<Publisher> GetPublisherList()
        {
            return PublisherDB.GetPublisherList();
        }
        public void UpdatePublisher(Publisher pub)
        {
            PublisherDB.UpdatePublisherRecord(pub);
        }
        public Publisher GetPublisher(int pId)
        {
            return PublisherDB.GetPublisher(pId);
        }
        public Publisher GetPublisherRecordName(string pubName)
        {
            return PublisherDB.GetPublisherRecordName(pubName);
        }
        public Publisher GetPublisherRecordWeb(string pubWeb)
        {
            return PublisherDB.GetPublisherRecordWeb(pubWeb);
        }
    }
}
