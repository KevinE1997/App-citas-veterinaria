using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SitioWeb.UI
{
    public partial class PrincipalAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Deshabilitar la caché en la página para evitar problemas de seguridad.
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
            Session.Remove("UsuarioLogeado");

            // Redirigir a la página de inicio de sesión después de cerrar sesión.
            Response.Redirect("InicioCitaVeterinaria.aspx");
        }
    }
}
