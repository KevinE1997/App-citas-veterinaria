using Newtonsoft.Json; 
using Salud.WS;
using System; 
using System.Collections.Generic; 
using System.Linq; 
using System.Web; 
using System.Web.Services; 
using System.Web.UI; 
using System.Web.UI.WebControls; 
using static SitioWeb.Modelos.CitaDB; 


namespace SitioWeb.UI // Espacio de nombres y definición de la clase ListadoCitas.
{
    public partial class ListadoCitas : System.Web.UI.Page // Definición de la clase ListadoCitas que hereda de Page.
    {
        private static ServiceReference_Cita.WebService_CitaSoapClient cita = new ServiceReference_Cita.WebService_CitaSoapClient();
        // Creación de un cliente para el servicio web de citas.

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
            if (Session["UsuarioLogeado"] != null)
            {                              
            }
            else
            {
                // Si no hay una sesión de usuario autenticado, redirigir a la página de inicio de sesión.
                Response.Redirect("InicioSesion.aspx");
            }
        }

        protected void GridView_Citas_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView_Citas.EditIndex = -1; // Salir del modo de edición.
            CargarGrid(); // Recarga los datos en el GridView.
            Response.Redirect(Request.Url.AbsoluteUri); 
        }

        protected void GridView_Citas_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView_Citas.EditIndex = e.NewEditIndex; // Cambiar a modo de edición.
            CargarGrid(); // Recarga los datos en el GridView.
        }

        protected void GridView_Citas_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int rowId = Convert.ToInt32(GridView_Citas.DataKeys[e.RowIndex]["id"]);
            GridViewRow row = GridView_Citas.Rows[e.RowIndex];
            String paciente = (row.FindControl("TextBoxPaciente") as TextBox).Text;
            String fecha = (row.FindControl("TextBoxFecha") as TextBox).Text;
            String hora = (row.FindControl("TextBoxHora") as TextBox).Text;
            String veterinario = (row.FindControl("TextBoxDoctor") as TextBox).Text;
            String mensaje = cita.modificarCita(rowId, int.Parse(paciente), fecha, hora, int.Parse(veterinario));
            CargarGrid(); // Recarga los datos en el GridView.
            Response.Redirect(Request.Url.AbsoluteUri); // Redirige a la misma página.
        }

        private void CargarGrid()
        {
            String jsonResult = cita.TraerCita(""); // Obtiene datos de citas en formato JSON.
            List<Cita> citaL = JsonConvert.DeserializeObject<List<Cita>>(jsonResult); // Deserializa los datos JSON.
            GridView_Citas.DataSource = citaL; // Asigna los datos al GridView.
            GridView_Citas.DataBind(); // Enlaza y muestra los datos en el GridView.
        }

        [WebMethod]
        public static string EliminarFila(int id)
        {
            int rowId = id;
            String mensaje = cita.eliminarCita(rowId); // Llama al método del servicio web para eliminar una cita.
            return mensaje; // Retorna "success" o "error" en caso de fallo.
        }
    }
}
