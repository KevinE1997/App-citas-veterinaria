using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Salud.Modelos;

namespace Salud.Modelos
{
    internal class VetDB
    {
        public class Veterinario
        {
            public int id { get; set; }
            public string nombre { get; set; }
            public string apellido { get; set; }
           
        }
    }
}
