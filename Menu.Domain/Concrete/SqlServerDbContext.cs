using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using Menu.Domain.Abstract;
using System.Configuration;

namespace Menu.Domain.Concrete
{
    public class SqlServerDbContext : IDbContext
    {
        #region Propiedades privadas
        private const string connStringName = "LocalDb";
        private string connString;
        private SqlConnection conn;
        private SqlCommand cmd;
        private DataTable data;
        private string nowTime { get { return "'" + DateTime.Now.ToString("yyyyMMdd hh:mm:ss tt") + "'"; } }
        #endregion

        public SqlServerDbContext()
        {
            connString = ConfigurationManager.ConnectionStrings[connStringName].ConnectionString;
            conn = new SqlConnection(connString);
        }

        public DataTable TableQuery(string CommandText, IDbDataParameter[] Parameters)
        {
            data = new DataTable();

            cmd = new SqlCommand(CommandText, conn);
            if (Parameters != null)
                cmd.Parameters.AddRange((SqlParameter[])Parameters);

            conn.Open();
            data.Load(cmd.ExecuteReader(CommandBehavior.CloseConnection));

            return data;
        }

        public DataTable TableQuery(string CommandText)
        { return TableQuery(CommandText, null); }

        public object ScalarQuery(string CommandText, IDbDataParameter[] Parameters)
        {
            cmd = new SqlCommand(CommandText, conn);
            if (Parameters != null)
                cmd.Parameters.AddRange(Parameters);

            conn.Open();
            object result = cmd.ExecuteScalar();
            conn.Close();

            return result;
        }

        public object ScalarQuery(string CommandText)
        { return ScalarQuery(CommandText, null); }

    }

}
