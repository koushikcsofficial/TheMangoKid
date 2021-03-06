﻿using DataAccess;
using DomainModel;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServiceLayer
{
    public class PurchaseRecordQueriesCommands
    {
        public int UpdatePurchaseRecord(PurchaseRecord purchaseRecordObject)
        {
            using(DatabaseContext db = new DatabaseContext())
            {
                try
                {
                    db.Entry(purchaseRecordObject).State = EntityState.Modified;
                    db.SaveChanges();
                    //Changes Done Successfully
                    return 1;
                }
                catch
                {
                    //Internal Error occured
                    return 0;
                }
            }
        }

        public int AddPurchaseRecord(PurchaseRecord purchaseRecordObject)
        {
            using(DatabaseContext db = new DatabaseContext())
            {
                try
                {
                    db.PurchaseRecords.Add(purchaseRecordObject);
                    db.SaveChanges();
                    //Successfully Added the record
                    return 1;
                }
                catch
                {
                    //Internal Error occured
                    return 0;
                }
            }
        }

        public int DeletePurchaseRecord(PurchaseRecord purchaseRecordObject)
        {
            using(DatabaseContext db = new DatabaseContext())
            {
                try
                {
                    db.Entry(purchaseRecordObject).State = EntityState.Deleted;
                    db.SaveChanges();
                    //operation done successfully
                    return 1;
                }
                catch
                {
                    //Internal error occured
                    return 0;
                }
            }
        }

        public List<PurchaseRecord> GetAllPurchaseRecords()
        {
            using(DatabaseContext db = new DatabaseContext())
            {
                return db.PurchaseRecords.ToList();
            }
        }

        public List<PurchaseRecord> GetAllPurchaseRecordsBetween(DateTime startDate, DateTime endDate)
        {
            using(DatabaseContext db = new DatabaseContext())
            {
                return db.PurchaseRecords.Where(rec => rec.PurchaseDate > startDate && rec.PurchaseDate < endDate).ToList();
            }
        }

        public List<PurchaseRecord> GetAllPurchaseRecordsBetweenDesc(DateTime startDate, DateTime endDate)
        {
            using (DatabaseContext db = new DatabaseContext())
            {
                return db.PurchaseRecords.Where(rec => rec.PurchaseDate > startDate && rec.PurchaseDate < endDate).OrderByDescending(rec=>rec.PurchaseDate).ToList();
            }
        }

        public List<PurchaseRecord> GetAllPurchaseRecordsOf(Account accountObject)
        {
            using(DatabaseContext db = new DatabaseContext())
            {
                return db.PurchaseRecords.Where(rec => rec.Account_Id == accountObject.Id).ToList();
            }
        }

        public List<PurchaseRecord> GetAllPurchaseRecordsOf(DateTime startDate, DateTime endDate, Account accountObject)
        {
            using (DatabaseContext db = new DatabaseContext())
            {
                return db.PurchaseRecords.Where(rec => (rec.PurchaseDate > startDate) && (rec.PurchaseDate < endDate) && (rec.Account == accountObject)).ToList();
            }
        }

        public List<PurchaseRecord> GetAllPurchaseRecordsOfDesc(Account accountObject)
        {
            using (DatabaseContext db = new DatabaseContext())
            {
                return db.PurchaseRecords.Where(rec => rec.Account == accountObject).OrderByDescending(rec=>rec.PurchaseDate).ToList();
            }
        }

        public List<PurchaseRecord> GetAllPurchaseRecordsOfDesc(DateTime startDate, DateTime endDate, Account accountObject)
        {
            using (DatabaseContext db = new DatabaseContext())
            {
                return db.PurchaseRecords.Where(rec => (rec.PurchaseDate > startDate) && (rec.PurchaseDate < endDate) && (rec.Account == accountObject)).OrderByDescending(rec => rec.PurchaseDate).ToList();
            }
        }

        public List<PurchaseRecord> GetUnUsedAlbumPurchaseRecordOf(Account account)
        {
            using(DatabaseContext db = new DatabaseContext())
            {
                return db.PurchaseRecords.Where(rec => rec.Account_Id == account.Id && rec.Purchased_Category.Equals("Album", StringComparison.CurrentCultureIgnoreCase) && rec.Usage_Date == null).ToList();
            }
        }

        public List<PurchaseRecord> GetUnUsedEpPurchaseRecordOf(Account account)
        {
            using (DatabaseContext db = new DatabaseContext())
            {
                return db.PurchaseRecords.Where(rec => rec.Account_Id == account.Id && rec.Purchased_Category.Equals("Ep", StringComparison.CurrentCultureIgnoreCase) && rec.Usage_Date == null).ToList();
            }
        }

        public List<PurchaseRecord> GetUnUsedSoloPurchaseRecordOf(Account account)
        {
            using (DatabaseContext db = new DatabaseContext())
            {
                return db.PurchaseRecords.Where(rec => rec.Account_Id == account.Id && rec.Purchased_Category.Equals("Solo", StringComparison.CurrentCultureIgnoreCase) && rec.Usage_Date == null).ToList();
            }
        }

        public List<PurchaseRecord> GetUsedAlbumPurchaseRecordOf(Account account)
        {
            using (DatabaseContext db = new DatabaseContext())
            {
                return db.PurchaseRecords.Where(rec => rec.Account_Id == account.Id && rec.Purchased_Category.Equals("Album", StringComparison.CurrentCultureIgnoreCase) && rec.Usage_Date != null).ToList();
            }
        }

        public List<PurchaseRecord> GetUsedEpPurchaseRecordOf(Account account)
        {
            using (DatabaseContext db = new DatabaseContext())
            {
                return db.PurchaseRecords.Where(rec => rec.Account_Id == account.Id && rec.Purchased_Category.Equals("Ep", StringComparison.CurrentCultureIgnoreCase) && rec.Usage_Date != null).ToList();
            }
        }

        public List<PurchaseRecord> GetUsedSoloPurchaseRecordOf(Account account)
        {
            using (DatabaseContext db = new DatabaseContext())
            {
                return db.PurchaseRecords.Where(rec => rec.Account_Id == account.Id && rec.Purchased_Category.Equals("Solo", StringComparison.CurrentCultureIgnoreCase) && rec.Usage_Date != null).ToList();
            }
        }

        public PurchaseRecord GetPurchaseRecordById(Guid? id)
        {
            using(DatabaseContext db = new DatabaseContext())
            {
                return db.PurchaseRecords.Find(id);
            }
        }

        //public bool IsPurchaseAlreadyNotUsed(Guid? id)
        //{
        //    using(DatabaseContext db = new DatabaseContext())
        //    {
        //        return db.PurchaseRecords.Any(rec => rec.Id == id && rec.Usage_Date == null);
        //    }
        //}

        public bool IsPurchaseExpired(Guid? id, DateTime currentTime)
        {
            using (DatabaseContext db = new DatabaseContext())
            {
                var purchaseObject = db.PurchaseRecords.Where(rec => rec.Id == id).SingleOrDefault();
                if (purchaseObject != null)
                {
                    if (purchaseObject.Usage_Exp_Date < currentTime)
                    {
                        return true;
                    }
                }
                return false;
            }
        }
    }
}
