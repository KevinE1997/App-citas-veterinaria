using Newtonsoft.Json;
using Salud.WS;
using SitioWeb.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static SitioWeb.Modelos.PacienteDB;

namespace SitioWeb.UI
{
    public partial class ListadoPacientes : System.Web.UI.Page
    {
        // Instancia del cliente SOAP para interactuar con el servicio de Paciente.
        private static ServiceReference_Paciente.PacienteSoapClient paciente = new ServiceReference_Paciente.PacienteSoapClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Cargar el GridView con los datos de los pacientes solo si no es un postback.
                CargarGrid();
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

        protected void GridView_Pacientes_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            // Salir del modo de edición y recargar el GridView.
            GridView_Pacientes.EditIndex = -1;
            CargarGrid();
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void GridView_Pacientes_RowEditing(object sender, GridViewEditEventArgs e)
        {
            // Cambiar a modo de edición y recargar el GridView.
            GridView_Pacientes.EditIndex = e.NewEditIndex;
            CargarGrid();
        }

        protected void GridView_Pacientes_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int rowId = Convert.ToInt32(GridView_Pacientes.DataKeys[e.RowIndex]["id"]);
            GridViewRow row = GridView_Pacientes.Rows[e.RowIndex];
            // Obtener los valores editados en los TextBox de la fila.
            String nombre = (row.FindControl("TextBoxNombre") as TextBox).Text;
            String apellido = (row.FindControl("TextBoxApellido") as TextBox).Text;
            String email = (row.FindControl("TextBoxEmail") as TextBox).Text;
            String password = (row.FindControl("TextBoxPassword") as TextBox).Text;
            // Llamar al servicio para modificar el paciente y recargar el GridView.
            String mensaje = paciente.modificarPaciente(rowId, nombre, apellido, email, password);
            CargarGrid();
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        private void CargarGrid()
        {
            // Obtener la información de los pacientes desde el servicio y cargarla en el GridView.
            String jsonResult = paciente.mostrarPaciente("");
            List<PacienteDB.Paciente> pacientes = JsonConvert.DeserializeObject<List<PacienteDB.Paciente>>(jsonResult);
            GridView_Pacientes.DataSource = pacientes;
            GridView_Pacientes.DataBind();
        }

        [WebMethod]
        public static string EliminarFila(int id)
        {
            int rowId = id;
            // Llamar al servicio para eliminar el paciente y retornar el resultado.
            String mensaje = paciente.eliminarPaciente(rowId);
            return mensaje; // O "error" en caso de fallo
        }
    }
}
