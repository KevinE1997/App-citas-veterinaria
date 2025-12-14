using Salud.Modelos;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using static Salud.Modelos.CitaDB.Cita;
using System.Configuration;
using Newtonsoft.Json;
using static Salud.Modelos.VetDB;

namespace Salud.WS
{

    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]

    public class WebService_Cita : System.Web.Services.WebService
    {
        static string strconexion = ConfigurationManager.ConnectionStrings["CitaVeterinaria"].ConnectionString;
        private SqlDataReader leerFilas;

        [WebMethod]
        public String registrarCita(int paciente, string fechaSeleccionada, string hora, int medico)
        {
            using (SqlConnection Conexion= new SqlConnection(strconexion))
            {
                using (SqlCommand cmd2 = new SqlCommand("InsertarCita", Conexion))
                {
                    cmd2.CommandType = CommandType.StoredProcedure;
                    cmd2.Parameters.AddWithValue("@P_paciente", paciente);
                    cmd2.Parameters.AddWithValue("@P_fecha", DateTime.Parse(fechaSeleccionada));
                    cmd2.Parameters.AddWithValue("@P_hora", DateTime.Parse(hora));
                    cmd2.Parameters.AddWithValue("@P_IdVet", medico);
                    try
                    {
                        Conexion.Open();
                        cmd2.ExecuteNonQuery();
                        return "Cita Agregada con exito";
                    }
                    catch (Exception ex)
                    {
                        return "Error: no se logró agregar cita";
                    }
                }
            }
        }
        [WebMethod]
        public String listarPacientes()
        {
            DataTable dt = new DataTable();
            using (SqlConnection Conexion= new SqlConnection(strconexion))
            {
                using (SqlCommand comando= new SqlCommand("ListarPacientes", Conexion))
                {
                    comando.Connection.Open();
                    comando.CommandType = CommandType.StoredProcedure;
                    leerFilas = comando.ExecuteReader();
                    dt.Load(leerFilas);
                    leerFilas.Close();
                }
            }
            String jsonResult = JsonConvert.SerializeObject(dt);
            return jsonResult;
        }
        [WebMethod]
        public String listarVeterinarios()
        {
            DataTable dt = new DataTable();
            using (SqlConnection Conexion= new SqlConnection(strconexion))
            {
                using (SqlCommand comando= new SqlCommand("listarVeterinarios", Conexion))
                {
                    comando.Connection.Open();
                    comando.CommandType = CommandType.StoredProcedure;
                    leerFilas = comando.ExecuteReader();
                    dt.Load(leerFilas);
                    leerFilas.Close();
                }
            }
            String jsonResult = JsonConvert.SerializeObject(dt);
            return jsonResult;
        }
        [WebMethod]
        public String TraerCita(string condicion = "")
        {
            List<CitaDB.Cita> Cita = new List<CitaDB.Cita>();
            using (SqlConnection Conexion= new SqlConnection(strconexion))
            {
                string sql = (condicion =="")
                    ? "Select * From citas"
                    : "Select * From citas Where paciente Like @condicion";
                using (SqlCommand comando = new SqlCommand(sql, Conexion))
                {
                    if (condicion != "")
                    {
                        comando.Parameters.AddWithValue("@condicion", condicion);
                    }
                    else
                    {
                        comando.Parameters.AddWithValue("@condicion", condicion + '%');
                    }
                    comando.CommandType = CommandType.Text;
                    try
                    {
                        Conexion.Open();
                        SqlDataReader reader = comando.ExecuteReader();
                        while (reader.Read())
                        {
                            CitaDB.Cita oCita = new CitaDB.Cita {
                                id = reader.GetInt32(0),
                                Paciente = reader.GetInt32(1),
                                Fecha = reader.GetDateTime(2).ToString(),
                                Hora = reader.GetTimeSpan(3).ToString(),
                                Veterinario = reader.GetInt32(4) 
                            };
                            Cita.Add(oCita);
                        }
                        reader.Close();
                    }
                    catch (Exception ex)
                    {
                        throw new Exception("Error: " + ex.Message);
                    }
                }   
            }
            String jsonResult = JsonConvert.SerializeObject(Cita);
            return jsonResult;
        }
        [WebMethod]
        public String eliminarCita(int íd)
        {
            using (SqlConnection Conexion= new SqlConnection(strconexion))
            {
                using (SqlCommand cmd2 = new SqlCommand("EliminarCita", Conexion))
                {
                    cmd2.CommandType = CommandType.StoredProcedure;
                    cmd2.Parameters.AddWithValue("@id", íd);
                    try
                    {
                        Conexion.Open();
                        cmd2.ExecuteNonQuery();
                        return "success";
                    }
                    catch (Exception ex)
                    {
                        return "Error: no se logró eliminar cita";
                    }
                }
            }
        }
        [WebMethod]
        public String modificarCita(int id, int paciente, string fecha, string hora, int doctor)
        {
            using (SqlConnection Conexion= new SqlConnection(strconexion))
            {
                using (SqlCommand cmd2 = new SqlCommand("ActualizarCita", Conexion))
                {
                    cmd2.CommandType = CommandType.StoredProcedure;
                    cmd2.Parameters.AddWithValue("@id", id);
                    cmd2.Parameters.AddWithValue("@paciente", paciente);
                    cmd2.Parameters.AddWithValue("@fecha", DateTime.Parse(fecha));
                    cmd2.Parameters.AddWithValue("@hora", DateTime.Parse(hora));
                    cmd2.Parameters.AddWithValue("@id_vet", doctor);
                    try
                    {
                        Conexion.Open();
                        cmd2.ExecuteNonQuery();
                        return "success";
                    }
                    catch (Exception ex)
                    {
                        return "Error: no se logró modificar cita";
                    }
                }
            }
        }
    }
}
