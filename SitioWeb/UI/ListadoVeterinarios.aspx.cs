using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static SitioWeb.Modelos.VetDB;

namespace SitioWeb.UI
{
    public partial class Listado : System.Web.UI.Page
    {
        private static ServiceReference_Vet.DoctorSoapClient doctor = new ServiceReference_Vet.DoctorSoapClient();
        // Creación de un cliente para el servicio web de veterinarios.

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

        protected void GridView_Doctores_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int rowId = Convert.ToInt32(GridView_Doctores.DataKeys[e.RowIndex]["id"]);
            GridViewRow row = GridView_Doctores.Rows[e.RowIndex];
            String nombre = (row.FindControl("TextBoxNombre") as TextBox).Text;
            String apellido = (row.FindControl("TextBoxApellido") as TextBox).Text;
            String mensaje = doctor.modificarVeterinario(rowId, nombre, apellido);
            CargarGrid(); // Recarga los datos en el GridView.
            Response.Redirect(Request.Url.AbsoluteUri); // Redirige a la misma página.
        }

        protected void GridView_Doctores_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView_Doctores.EditIndex = e.NewEditIndex; // Cambiar a modo de edición.
            CargarGrid(); // Recarga los datos en el GridView.
        }

        protected void GridView_Doctores_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView_Doctores.EditIndex = -1; // Salir del modo de edición.
            CargarGrid(); // Recarga los datos en el GridView.
            Response.Redirect(Request.Url.AbsoluteUri); // Redirige a la misma página.
        }

        private void CargarGrid()
        {
            String jsonResult = doctor.mostrarVeterinario(""); // Obtiene datos de veterinarios en formato JSON.
            List<Veterinario> médicos = JsonConvert.DeserializeObject<List<Veterinario>>(jsonResult); // Deserializa los datos JSON.
            GridView_Doctores.DataSource = médicos; // Asigna los datos al GridView.
            GridView_Doctores.DataBind(); // Enlaza y muestra los datos en el GridView.
        }

        [WebMethod]
        public static string EliminarFila(int id)
        {
            int rowId = id;
            String mensaje = doctor.eliminarVeterinario(rowId); // Llama al método del servicio web para eliminar un médico.
            return mensaje; // Retorna "success" o "error" en caso de fallo.
        }
    }
}
