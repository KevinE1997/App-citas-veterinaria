using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static SitioWeb.Modelos.CitaDB;


namespace SitioWeb.UI
{
    public partial class PrincipalUsuario : System.Web.UI.Page
    {
        private static ServiceReference_Cita.WebService_CitaSoapClient cita = new ServiceReference_Cita.WebService_CitaSoapClient();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarGrid(); // Carga los datos en el GridView si no es una solicitud de envío.
            }
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetNoStore();

            // Verificar si hay una sesión de usuario activa.
            if (Session["PacienteLogeado"] != null)
            {
                // El usuario está autenticado y la sesión es válida.                
            }
            else
            {
                // Si no hay una sesión de usuario autenticado, redirigir a la página de inicio de sesión.
                Response.Redirect("InicioSesion.aspx");
            }
        }
        private void CargarGrid()
        {
            String jsonResult = cita.TraerCita(Session["PacienteLogeado"].ToString()); // Obtiene datos de citas en formato JSON.
            List<Cita> citaL = JsonConvert.DeserializeObject<List<Cita>>(jsonResult); // Deserializa los datos JSON.
            GridView_Citas.DataSource = citaL; // Asigna los datos al GridView.
            GridView_Citas.DataBind(); // Enlaza y muestra los datos en el GridView.
        }

        [WebMethod]
        public static string EliminarFila(int id)
        {
            int rowId = id;
            String mensaje = cita.eliminarCita(rowId); // Llama al método del servicio web para eliminar una cita.
            return "success"; // Retorna "success" o "error" en caso de fallo.
        }

        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            // Deshabilitar la caché y limpiar cookies y sesiones al cerrar sesión.
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetNoStore();

            Response.Cookies.Clear();
            Session.Clear();
            Session.Abandon();
            FormsAuthentication.SignOut();
            Session.Remove("PacienteLogeado");

            // Redirigir a la página de inicio de sesión después de cerrar sesión.
            Response.Redirect("InicioCitaVeterinaria.aspx");
        }
    }
}