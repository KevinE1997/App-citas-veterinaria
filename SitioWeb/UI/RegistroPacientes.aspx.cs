using Salud.WS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SitioWeb.UI
{
    public partial class RegistroPacientes : System.Web.UI.Page
    {
        // Creación de una instancia del cliente SOAP para acceder al servicio de paciente
        private static ServiceReference_Paciente.PacienteSoapClient paciente = new ServiceReference_Paciente.PacienteSoapClient();

        // Propiedades para controlar la visibilidad de las alertas
        public bool Alerta { get; set; } = false;
        public bool Info { get; set; } = false;

        // Método que se ejecuta cuando la página se carga por primera vez
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataBind();
            }
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetNoStore();

            // Verificar si hay una sesión de usuario activa.
            if (Session["UsuarioLogeado"] != null)
            {
                // El usuario está autenticado y la sesión es válida.                
            }
            else
            {
                // Si no hay una sesión de usuario autenticado, redirigir a la página de inicio de sesión.
                Response.Redirect("InicioSesion.aspx");
            }
        }

        // Método que se ejecuta al hacer clic en el botón "Registrar"
        protected void Button_Registrar_Click(object sender, EventArgs e)
        {
            String mensajeR = "";
            if (TextBox_Nombre.Text != "" && TextBox_Apellido.Text != "" && TextBox_Email.Text != "" && TextBox_Password.Text != "")
            {
                // Llamada al método del servicio para registrar un paciente
                mensajeR = paciente.registrarPaciente(TextBox_Nombre.Text, TextBox_Apellido.Text, TextBox_Email.Text, TextBox_Password.Text);
                Label_Info.Text = mensajeR;

                // Limpiar los campos después de registrar
                TextBox_Nombre.Text = "";
                TextBox_Apellido.Text = "";
                TextBox_Email.Text = "";
                TextBox_Password.Text = "";

                // Controlar la visibilidad de las alertas
                Alerta = false;
                Info = true;
                DataBind();
            }
            else
            {
                mensajeR = "Es necesario que llene todos los campos";
                Label_Alerta.Text = mensajeR;

                // Controlar la visibilidad de las alertas
                Alerta = true;
                DataBind();
            }
        }
    }
}