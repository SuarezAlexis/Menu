using System;
using System.Collections.Generic;
using System.Web.Mvc;
using Ninject;
using Menu.Domain.Abstract;
using Menu.Domain.Concrete;

namespace Menu.Infrastructure
{
    public class NinjectDependencyResolver : IDependencyResolver
    {
        private IKernel kernel;

        public NinjectDependencyResolver(IKernel kernelParam)
        {
            kernel = kernelParam;
            AddBindings();
        }

        public object GetService(Type serviceType)
        {
            return kernel.TryGet(serviceType);
        }

        public IEnumerable<object> GetServices(Type serviceType)
        {
            return kernel.GetAll(serviceType);
        }

        private void AddBindings()
        {
            kernel.Bind<IDbContext>().To<SqlServerDbContext>();
            kernel.Bind<IPuntoVentaRepository>().To<PuntoVentaRepository>();
        }
    }
}