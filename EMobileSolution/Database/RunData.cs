using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace EMobileSolution.Database
{
    public class Rundata
    {
        public DataTable GetData(string strSQL)
        {
            String connStr;
            SqlConnection conn;
            SqlDataAdapter adapter;

            DataTable dt = new DataTable();
            connStr = @"Data Source=.;Initial Catalog=EMobileDB;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework";
            conn = new SqlConnection(connStr);
            conn.Open();

            adapter = new SqlDataAdapter(strSQL, connStr);
            adapter.Fill(dt);
            conn.Close();
            return dt;
        }
        public void Execute(string strSQL)
        {
            String connStr;
            SqlConnection conn;
            SqlCommand command;

            connStr = @"Data Source=.;Initial Catalog=EMobileDB;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework";
            conn = new SqlConnection(connStr);
            conn.Open();

            command = new SqlCommand(strSQL, conn);
            command.ExecuteNonQuery();
            conn.Close();
        }
    }
}
