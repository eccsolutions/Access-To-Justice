namespace Tals.ProBono.Web.Infrastructure {
    public interface IAuditor {
        void Audit(string username, int i);
    }
}