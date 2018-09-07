using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Common;
using System.Data;

namespace Menu.Domain.Abstract
{
    public interface IDbContext
    {
        DataTable TableQuery(string CommandText, IDbDataParameter[] Parameters);
        DataTable TableQuery(string CommandText);
        object ScalarQuery(string CommandText, IDbDataParameter[] Parameters);
        object ScalarQuery(string CommandText);
    }
}
