using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SitioWeb.UI
{
    public partial class RegistroUsuario : System.Web.UI.Page
    {
        private static ServiceReference_Usuario.UsuarioSoapClient usuario = new ServiceReference_Usuario.UsuarioSoapClient();
        // Propiedades para controlar la visibilidad de las alertas
        public bool Alerta { get; set; } = false;
        public bool Info { get; set; } = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            // Este método se ejecuta cuando la página se carga.
            if (!IsPostBack)
            {
                DataBind();
            }
        }

        protected void Button_Registrar_Click(object sender, EventArgs e)
        {
            // Este método se ejecuta cuando se hace clic en el botón "Registrar".

            // Llama al servicio web para registrar un usuario con los datos proporcionados.
            String mensajeR = usuario.registrarUsuario(TextBox_Nombre.Text, TextBox_Apellido.Text, TextBox_Email.Text, TextBox_Password.Text);

            if (mensajeR == "Usuario registrado con éxito")
            {
                // Si el registro es exitoso, muestra el mensaje de éxito en la etiqueta y redirige a la página de inicio de sesión.
                Label_Info.Text = mensajeR;
                TextBox_Nombre.Text = "";
                TextBox_Apellido.Text = "";
                TextBox_Email.Text = "";
                TextBox_Password.Text = "";
                Alerta = false;
                Info = true;
                DataBind();
            }
            else
            {
                // Si hay un error en el registro, muestra el mensaje de error en la etiqueta.
                Label_Alerta.Text = mensajeR;
                Alerta = true;
                DataBind();
            }
        }
    }
}