namespace ADO.NET.CRUD
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Enter 1 or 2 or 3 or 4");

            int i = Convert.ToInt32(Console.ReadLine());
            switch (i)
            {
                case 1: FetchDataFromServer.RetrieveDatafromtheServer();
                    break;
                case 2: FetchDataFromServer.AddDataintoServer();
                    break;
                case 3: FetchDataFromServer.UpdateDataintoServer();
                    break;
                case 4: FetchDataFromServer.DeleteDataFromServer();
                    break;
                default: Console.WriteLine("Enter correct use case");
                    break;

            }
        }
    }
}