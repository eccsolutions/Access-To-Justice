using System.Linq;
using Tals.ProBono.Domain.Entities;

namespace Tals.ProBono.Domain.Abstract
{
    public interface ICountyRepository
    {
        IQueryable<County> Counties { get; }
        void SaveChanges();
        void Save(County county);
    }
}