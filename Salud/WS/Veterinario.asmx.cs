using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using static Salud.Modelos.VetDB.Veterinario;
using Salud.Modelos;
using System.Configuration;
using Newtonsoft.Json;

namespace Salud.WS
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]


    public class Doctor : System.Web.Services.WebService
    {
        static string strconexion = ConfigurationManager.ConnectionStrings["CitaVeterinaria"].ConnectionString;
        public SqlConnection Conexion = new SqlConnection(strconexion);
        private SqlCommand Comando = new SqlCommand();
        private SqlDataReader leerFilas;

        [WebMethod]
        public String mostrarVeterinario(string condicion = "")
        {
            List<VetDB.Veterinario> Vet = new List<VetDB.Veterinario>();
            string sql = "";
            //using (SqlConnection conexion = new SqlConnection(strconexion))
            using (Conexion)
            {
                if (condicion == "")
                {
                    sql = "Select * From veterinarios";
                }
                else
                {
                    //sql = "Select * From usuarios Where nombrePersona Like '" + condicion + "%'";
                    sql = "Select * From veterinarios Where id Like @condicion";
                }
                //Sanitización
                SqlCommand comando = new SqlCommand();
                comando.Connection = Conexion;
                comando.CommandText = sql;
                comando.Parameters.AddWithValue("@condicion", condicion + '%');
                comando.CommandType = CommandType.Text;
                try
                {
                    Conexion.Open();
                    SqlDataReader reader = comando.ExecuteReader();
                    while (reader.Read())
                    {
                        VetDB.Veterinario oVet = new VetDB.Veterinario();
                        oVet.id = reader.GetInt32(0);
                        oVet.nombre = reader.GetString(1);
                        oVet.apellido = reader.GetString(2);
                        Vet.Add(oVet);
                    }
                    reader.Close();
                    Conexion.Close();
                }
                catch (Exception ex)
                {
                    throw new Exception("Error: " + ex.Message);
                }
            }
            String jsonResult = JsonConvert.SerializeObject(Vet);
            return jsonResult;
        }
        [WebMethod]
        //public String registrarMédico(string nombre, string apellido, int especialidad)
        public String registrarVeterinario(string nombre, string apellido)
        {
            String res = "";
            using (Conexion)
            {
                SqlCommand cmd2 = new SqlCommand();
                cmd2.Connection = Conexion;
                cmd2.CommandType = CommandType.StoredProcedure;
                cmd2.CommandText = "Crear_Veterinarios";
                cmd2.Parameters.AddWithValue("@P_Nombre", nombre);
                cmd2.Parameters.AddWithValue("@P_Apellido", apellido);
                
                try
                {
                    Conexion.Open();
                    cmd2.ExecuteNonQuery();
                    res = "Veterinario Agregado con exito";
                }
                catch (Exception ex)
                {
                    res = "Error: No se logró crear veterinario";
                }

            }
            return res;
        }
                
        [WebMethod]
        public String eliminarVeterinario(int íd)
        {
            String res = "";
            using (Conexion)
            {
                SqlCommand cmd2 = new SqlCommand();
                cmd2.Connection = Conexion;
                cmd2.CommandType = CommandType.StoredProcedure;
                cmd2.CommandText = "EliminarVeterinario";
                cmd2.Parameters.AddWithValue("@id", íd);
                try
                {
                    Conexion.Open();
                    cmd2.ExecuteNonQuery();
                    res = "success";
                }
                catch (Exception ex)
                {
                    res = "Veterinario referenciado en una cita, no se logró eliminar registro";                }

            }
            return res;
        }
        [WebMethod]
        
        public String modificarVeterinario(int id, string nombre, string apellido)
        {
            String res = "";
            using (Conexion)
            {
                SqlCommand cmd2 = new SqlCommand();
                cmd2.Connection = Conexion;
                cmd2.CommandType = CommandType.StoredProcedure;
                cmd2.CommandText = "ActualizarVeterinario";
                cmd2.Parameters.AddWithValue("@id", id);
                cmd2.Parameters.AddWithValue("@nombre", nombre);
                cmd2.Parameters.AddWithValue("@apellido", apellido);
                try
                {
                    Conexion.Open();
                    cmd2.ExecuteNonQuery();
                    res= "success";
                }
                catch (Exception ex)
                {
                    res = "No se logró modificar el Veterinario";
                }

            }
            return res;
        }
    }
}
