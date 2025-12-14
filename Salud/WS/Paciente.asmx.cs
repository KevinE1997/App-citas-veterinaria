using Newtonsoft.Json;
using Salud.Modelos;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using static Salud.Modelos.PacienteDB.Paciente;

namespace Salud.WS
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]


    public class Paciente : System.Web.Services.WebService
    {
        private string strconexion = ConfigurationManager.ConnectionStrings["CitaVeterinaria"].ConnectionString;

        [WebMethod]

        public String mostrarPaciente(string condicion = "")
        {
            List<PacienteDB.Paciente> Paciente = new List<PacienteDB.Paciente>();
            using (SqlConnection Conexion = new SqlConnection(strconexion))
            {
                string sql = (condicion == "")
                    ? "Select * From usuarios"
                    : "Select * From usuarios Where id = @condicion";
                using (SqlCommand comando = new SqlCommand(sql, Conexion))
                {
                    if (condicion!="")
                    {
                        comando.Parameters.AddWithValue("@condicion", condicion);
                    }
                    else
                    {
                        comando.Parameters.AddWithValue("@condicion", condicion);
                    }
                    comando.CommandType = CommandType.Text;
                    try
                    {
                        Conexion.Open();
                        SqlDataReader reader = comando.ExecuteReader();
                        while (reader.Read())
                        {
                            PacienteDB.Paciente oPaciente = new PacienteDB.Paciente
                            {
                                id = reader.GetInt32(0),
                                nombre = reader.GetString(1),
                                apellido = reader.GetString(2),
                                correo = reader.GetString(3),
                                contrasena = reader.GetString(4)
                            };
                            Paciente.Add(oPaciente);
                        }
                        reader.Close();
                    }
                    catch (Exception ex)
                    {
                        throw new Exception("Error: " + ex.Message);
                    }
                }
            }
            String jsonResult = JsonConvert.SerializeObject(Paciente);
            return jsonResult;
        }
        [WebMethod]
        public String registrarPaciente(string nombre, string apellido, string email, string contrasena)
        {
            using (SqlConnection Conexion = new SqlConnection(strconexion))
            {
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
                try
                {
                    Conexion.Open();
                    cmd2.ExecuteNonQuery();
                    return "Paciente Agregado con exito";
                }
                catch (Exception ex)
                {
                    return "Error: No se logró crear Paciente";
                }
            }
        }
        [WebMethod]
        public String validarUsuario(string username, string password)
        {
            using (SqlConnection Conexion = new SqlConnection(strconexion))
            {
                Conexion.Open();
                using (SqlCommand comando = new SqlCommand("BuscarLogin", Conexion))
                {
                    comando.CommandType = CommandType.StoredProcedure;
                    comando.Parameters.AddWithValue("@Condicion", username);
                    comando.Parameters.AddWithValue("@Condicion2", password);

                    SqlDataReader dr = comando.ExecuteReader();
                    if (dr.Read())
                    {
                        if (username == "admin" && password == "admin")
                        {
                            //InicioAdministrador FrmAdmin = new InicioAdministrador();
                            return "Bienvenido";
                        }
                        else
                        {
                            //InicioUsuario FrmUser = new InicioUsuario();
                            return dr[0].ToString();
                        }
                    }
                    else
                    {
                        return "Por favor, verifique sus credenciales e intente nuevamente";
                    }
                }
            }
        }
        [WebMethod]
        public String eliminarPaciente(int íd)
        {
            using (SqlConnection Conexion= new SqlConnection(strconexion))
            {
                SqlCommand cmd2 = new SqlCommand
                {
                    Connection = Conexion,
                    CommandType = CommandType.StoredProcedure,
                    CommandText = "EliminarUsuario"
                };
                cmd2.Parameters.AddWithValue("@id", íd);
                try
                {
                    Conexion.Open();
                    cmd2.ExecuteNonQuery();
                    return "success";
                }
                catch (Exception ex)
                {
                    return "Paciente Referenciado en una cita, no se logró eliminar registro";
                }

            }
        }
        [WebMethod]
        public String modificarPaciente(int id, string nombre, string apellido, string email, string contrasena)
        {
            using (SqlConnection Conexion = new SqlConnection(strconexion))
            {
                SqlCommand cmd2 = new SqlCommand
                {
                    Connection = Conexion,
                    CommandType = CommandType.StoredProcedure,
                    CommandText = "ActualizarPaciente"
                };
                cmd2.Parameters.AddWithValue("@id", id);
                cmd2.Parameters.AddWithValue("@nombre", nombre);
                cmd2.Parameters.AddWithValue("@apellido", apellido);
                cmd2.Parameters.AddWithValue("@correo", email);
                cmd2.Parameters.AddWithValue("@contrasena", contrasena);
                try
                {
                    Conexion.Open();
                    cmd2.ExecuteNonQuery();
                    return "success";
                }
                catch (Exception ex)
                {
                    return "Error: no se logró modificar";
                }

            }
        }
    }
}
