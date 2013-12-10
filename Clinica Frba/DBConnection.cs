using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace Clinica_Frba
{
    class DBConnection
    {
        private static DBConnection instance;
        private static SqlConnection persistentConnection;

        private DBConnection(string connectionString)
        {
            persistentConnection = new SqlConnection(connectionString);
        }

        public static DBConnection getInstance
        {
            get
            {
                if (instance == null) {
                    instance = new DBConnection(Configuration.getInstance.getConnectionString());
                } 
                return instance;
            }
        }

        public DataTable ExecuteQuery(string procedureName, List<SqlParameter> parameters){
        SqlDataAdapter adapter = null;
        using(persistentConnection)
        {
            persistentConnection.Open();
            adapter = new SqlDataAdapter(procedureName, persistentConnection);
            adapter.SelectCommand.Parameters.AddRange(parameters.ToArray());
            adapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable data = new DataTable();
            adapter.Fill(data);
            return (data.Rows.Count > 0) ? data : null;
           
        }
        

    }
}
    }
