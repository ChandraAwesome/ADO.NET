using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ADO.NET.CRUD
{
    internal class FetchDataFromServer
    {
        public static void RetrieveDatafromtheServer()
        {
            string ConnectionAString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Assignment;Integrated Security=True;Encrypt=False;TrustServerCertificate=False;";

            using(SqlConnection connection = new SqlConnection(ConnectionAString)) 
            {
                SqlCommand command = new SqlCommand("GetDetails", connection);
                command.CommandType = CommandType.StoredProcedure;
                connection.Open();
                SqlDataReader Read = command.ExecuteReader();

                while(Read.Read())
                {
                    int id = (int)Read["Id"];
                    string Name = (string)Read["Name"];
                    long PhoneNumber = (long)Read["PhoneNumber"];
                    string Address = (string)Read["Address"];
                    
                    Console.WriteLine($" Id= {id} Name= {Name} PhoneNumber= {PhoneNumber} Address= {Address}");
                }
                Read.Close();
                connection.Close();
            }
        }

        public static void AddDataintoServer()
        {
            string ConnectionAstring= "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Assignment;Integrated Security=True;Encrypt=False;TrustServerCertificate=False;";

            using (SqlConnection connection = new SqlConnection(ConnectionAstring))
            {
                SqlCommand command = new SqlCommand("EnterDetails", connection);
                    command.CommandType= CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@ProductName", "Jack");
                command.Parameters.AddWithValue("@Quantity", 7);
                command.Parameters.AddWithValue("@Rating", 5);
                connection.Open();

                //int effectedrows = command.ExecuteNonQuery();

                connection.Close();
            }
        }

        public static void UpdateDataintoServer()
        {
            string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Assignment;Integrated Security=True;Encrypt=False;TrustServerCertificate=False;";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("UPDATE Details SET Name=@Name, PhoneNumber=@PhoneNumber, Address=@Address WHERE Id=@Id", connection);
                command.Parameters.AddWithValue("@Id", 1);
                command.Parameters.AddWithValue("@Name", "John Smith"); 
                command.Parameters.AddWithValue("@PhoneNumber", 9876543210);
                command.Parameters.AddWithValue("@Address", "456 Oak St");
                connection.Open();
                int rowsAffected = command.ExecuteNonQuery();
                connection.Close();
            }

        }

        public static void DeleteDataFromServer()
        {
                string connectionString = "Data Source = (localdb)\\MSSQLLocalDB; Initial Catalog = Assignment; Integrated Security = True; Encrypt = False; TrustServerCertificate = False; ";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("DELETE FROM Details WHERE Id = @Id", connection);
                command.Parameters.AddWithValue("@Id",2);

                connection.Open();
                int rowsAffected = command.ExecuteNonQuery();
                connection.Close();

                if (rowsAffected > 0)
                {
                    Console.WriteLine("Data deleted successfully!");
                }
                else
                {
                    Console.WriteLine("No data found to delete.");
                }
            }

        }
    }
}
