using Salud.Modelos;

namespace Salud.Modelos
{
    internal class PacienteDB
    {
        public class Paciente
        {
            public int id { get; set; }
            public string nombre { get; set; }
            public string apellido { get; set; }
            public string correo { get; set; }
            public string contrasena { get; set; }
        }
    }
}
