using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace Salud.WS
{
    
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    
    public class Usuario : System.Web.Services.WebService
    {
        private string strconexion = ConfigurationManager.ConnectionStrings["CitaVeterinaria"].ConnectionString;
        [WebMethod]
        public String registrarUsuario(string nombre, string apellido, string email, string contrasena)
        {
            if (string.IsNullOrEmpty(nombre) && string.IsNullOrEmpty(apellido) && string.IsNullOrEmpty(email) && string.IsNullOrEmpty(contrasena))
            {
                return "Todos los campos son obligatorios";
            }

            using (SqlConnection Conexion = new SqlConnection(strconexion))

            {
                SqlCommand cmd1 = new SqlCommand
                {
                    Connection = Conexion,
                    CommandType = CommandType.StoredProcedure,
                    CommandText = "BuscarCorreo"
                };
                cmd1.Parameters.AddWithValue("@P_correo", email);

                try
                {
                    Conexion.Open();
                    int count = (int)cmd1.ExecuteScalar();

                    if(count > 0)
                    {
                        return "Este correo ya está en uso";
                    }
                    SqlCommand cmd2 = new SqlCommand
                    {
                        Connection = Conexion,
                        CommandType = CommandType.StoredProcedure,
                        CommandText = "InsertarUsuario"
                    };
                    cmd2.Parameters.AddWithValue("@P_nombre", nombre);
                    cmd2.Parameters.AddWithValue("@P_apellido", apellido);
                    cmd2.Parameters.AddWithValue("@P_correo", email);
                    cmd2.Parameters.AddWithValue("@P_contrasena", contrasena);
                   
                    cmd2.ExecuteNonQuery();

                    return "Usuario registrado con éxito";
                }
                catch (Exception ex)
                {
                    return "Error: No se logró crear usuario: " + ex.Message;
                }
            }

        }
    }
}

