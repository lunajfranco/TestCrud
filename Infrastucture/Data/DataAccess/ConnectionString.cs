using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infrastucture.Data.DataAccess
{
    public static class ConnectionString
    {
        public static string MiCadenaConexion()
        { 
            return @"Server=DESKTOP-HRTAQGU\SQLEXPRESS;Database=TestCrud;trusted_connection=true;Encrypt=false";
        }
    }
}
