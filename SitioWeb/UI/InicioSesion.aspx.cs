using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SitioWeb.UI
{
    public partial class InicioSesion : System.Web.UI.Page
    {
        private static ServiceReference_Paciente.PacienteSoapClient paciente = new ServiceReference_Paciente.PacienteSoapClient();
        public bool Alerta { get; set; } = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataBind();
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Manejo del evento clic en el botón de inicio de sesión.
            String mensajeR = paciente.validarUsuario(username.Text, password.Text);
            if (mensajeR == "Bienvenido")
            {
                Session["UsuarioLogeado"] = mensajeR;
                Response.Redirect("PrincipalAdmin.aspx");
                
            }
            else if (mensajeR != "Por favor, verifique sus credenciales e intente nuevamente")
            {
                Session["PacienteLogeado"] = mensajeR;
                Response.Redirect("PrincipalUsuario.aspx");
            }
            else
            {
                password.Text = "";
                username.Text = "";
                Label_Alerta.Text = mensajeR;
                Alerta = true;
                DataBind();
            }
        }

        protected void miBoton_Click(object sender, EventArgs e)
        {
            // Manejo del evento clic en el botón de registro.
            // Redirecciona al usuario a la página de registro.
            Response.Redirect("RegistroUsuario.aspx");
        }
    }
}
