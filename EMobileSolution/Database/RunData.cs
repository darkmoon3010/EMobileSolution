using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace EMobileSolution.Database
{
    public class RunData
    {
        public DataTable GetData(string strSQL)
        {
            String connStr;
            SqlConnection connection;
            SqlDataAdapter adapter;

            DataTable dt = new DataTable();
            connStr = @"Data Source=.;Initial Catalog=EMobileDB;Integrated Security=True";
            connection = new SqlConnection(connStr);
            connection.Open();

            adapter = new SqlDataAdapter(strSQL, connStr);
            adapter.Fill(dt);
            connection.Close();

            return dt;
        }
        
    }
}