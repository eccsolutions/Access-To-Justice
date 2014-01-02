using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Objects;
using System.Linq;
using System.Text;
using Tals.ProBono.Domain.Abstract;
using Tals.ProBono.Domain.Entities;

namespace Tals.ProBono.Domain.Concrete
{
    public class CountyRepositorySql : ICountyRepository
    {
        private readonly LegalAdviceContainer _container;

        public CountyRepositorySql()
        {
            _container = new LegalAdviceContainer();
        }
        public IQueryable<County> Counties
        {
            get { return _container.Counties; }
        }
        public void SaveChanges()
        {
            _container.SaveChanges();
        }

        public void Save(County county)
        {
            if (county.Id == 0)
                _container.Counties.AddObject(county);
            else if (county.EntityState == EntityState.Detached)
            {
                _container.Counties.Attach(county);
                _container.ObjectStateManager.GetObjectStateEntry(county).SetModified();
                _container.Refresh(RefreshMode.ClientWins, county);
            }

            _container.SaveChanges();
        }
    }
}
