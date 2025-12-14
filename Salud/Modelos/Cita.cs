using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using static Salud.Modelos.CitaDB;

namespace Salud.Modelos
{
    internal class CitaDB
    {
        public class Cita
        {
            public int id { get; set; }
            public int Paciente { get; set; }
            public string Fecha { get; set; }
            public string Hora { get; set; }
            public int Veterinario { get; set; }
        }
    }
}
