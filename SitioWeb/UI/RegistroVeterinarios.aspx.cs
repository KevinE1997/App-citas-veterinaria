using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SitioWeb.UI
{
    public partial class RegistroVeterinarios : System.Web.UI.Page
    {
        private static ServiceReference_Vet.DoctorSoapClient vet = new ServiceReference_Vet.DoctorSoapClient();
        // Propiedades para controlar la visibilidad de las alertas en la página
        public bool Alerta { get; set; } = false;
        public bool Info { get; set; } = false;

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

        protected void Button_Registrar_Click(object sender, EventArgs e)
        {
            String mensajeR = "";

            // Verificar que se hayan completado los campos necesarios
            if (TextBox_Nombre.Text != "" && TextBox_Apellido.Text != "")
            {
                // Llamar al método para registrar al médico
                mensajeR = vet.registrarVeterinario(TextBox_Nombre.Text, TextBox_Apellido.Text);

                // Mostrar mensaje de éxito y limpiar los campos
                Label_Info.Text = mensajeR;
                TextBox_Nombre.Text = "";
                TextBox_Apellido.Text = "";
                //DropDownList_Especialidad.SelectedIndex = 0;
                Alerta = false;
                Info = true;
                DataBind();
            }
            else
            {
                // Mostrar alerta si no se han completado todos los campos
                mensajeR = "Es necesario que llene todos los campos";
                Label_Alerta.Text = mensajeR;
                Alerta = true;
                DataBind();
            }
        }
    }
}
