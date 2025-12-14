using Newtonsoft.Json;
using Salud.WS;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SitioWeb.UI
{
    public partial class RegistroCitas : System.Web.UI.Page
    {
        private static ServiceReference_Cita.WebService_CitaSoapClient cita = new ServiceReference_Cita.WebService_CitaSoapClient();
        private static ServiceReference_Paciente.PacienteSoapClient paciente = new ServiceReference_Paciente.PacienteSoapClient();

        // Propiedades para mostrar alertas y mensajes de información en la página
        public bool Alerta { get; set; } = false;
        public bool Info { get; set; } = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetNoStore();

            // Verificar si hay una sesión de usuario activa.
            if (Session["UsuarioLogeado"] != null || Session["PacienteLogeado"] != null)
            {
                // El usuario está autenticado y la sesión es válida.                
            }
            else
            {
                // Si no hay una sesión de usuario autenticado, redirigir a la página de inicio de sesión.
                Response.Redirect("InicioSesion.aspx");
            }
            if (!IsPostBack)
            {
                // Llamar a las funciones para cargar la lista de pacientes y veterinarios.
                ListarPaciente();
                ListarVeterinario();
                DataBind();
            }
        }

        protected void Button_Registrar_Click(object sender, EventArgs e)
        {
            String mensajeR = "";
            String selectedDate = datePicker.Text;
            String selectedTime = timePicker.Text;

            if (Convert.ToInt32(DropDownList_Paciente.SelectedValue) != 0 && selectedDate != "" && selectedTime != "" && Convert.ToInt32(DropDownList_Doctor.SelectedValue) != 0)
            {
                // Llamar a la función para registrar la cita
                if (Session["PacienteLogeado"] != null)
                {
                    mensajeR = cita.registrarCita(Convert.ToInt32(Session["PacienteLogeado"]), selectedDate, selectedTime, Convert.ToInt32(DropDownList_Doctor.SelectedValue));
                }
                else
                {
                    mensajeR = cita.registrarCita(Convert.ToInt32(DropDownList_Paciente.SelectedValue), selectedDate, selectedTime, Convert.ToInt32(DropDownList_Doctor.SelectedValue));
                }

                // Mostrar mensaje de éxito
                Label_Info.Text = mensajeR;
                DropDownList_Paciente.SelectedIndex = 0;
                datePicker.Text = "";
                timePicker.Text = "";
                DropDownList_Doctor.SelectedIndex = 0;
                Alerta = false;
                Info = true;
                DataBind();
            }
            else
            {
                // Mostrar mensaje de alerta si los campos no están llenos
                mensajeR = "Es necesario que llene todos los campos";
                Label_Alerta.Text = mensajeR;
                Alerta = true;
                DataBind();
            }
        }

        private void ListarPaciente()
        {
            if (Session["PacienteLogeado"] != null)
            {
                String jsonResult = paciente.mostrarPaciente(Session["PacienteLogeado"].ToString());
                DataTable dt = JsonConvert.DeserializeObject<DataTable>(jsonResult);
                dt.Columns.Add("nombre_completo", typeof(string), "nombre + ' ' + apellido");

                DropDownList_Paciente.DataSource = dt;
                DropDownList_Paciente.DataTextField = "nombre_completo";
                DropDownList_Paciente.DataValueField = "id";
                DropDownList_Paciente.SelectedIndex = 1;
                DropDownList_Paciente.DataBind();
                DropDownList_Paciente.Enabled = false;
            }
            else
            {
                // Obtener la lista de pacientes desde el servicio web y cargarla en el DropDownList_Paciente
                String jsonResult = cita.listarPacientes();
                DataTable dt = JsonConvert.DeserializeObject<DataTable>(jsonResult);

                DataRow defaultRow = dt.NewRow();
                defaultRow["id"] = 0; // Valor en blanco o null para el valor por defecto
                defaultRow["nombre"] = "Seleccione Paciente"; // Texto del valor por defecto
                dt.Rows.InsertAt(defaultRow, 0);

                dt.Columns.Add("nombre_completo", typeof(string), "nombre + ' ' + apellido");

                DropDownList_Paciente.DataSource = dt;
                DropDownList_Paciente.DataTextField = "nombre_completo";
                DropDownList_Paciente.DataValueField = "id";
                DropDownList_Paciente.DataBind();
            }
        }

        private void ListarVeterinario()
        {
            // Obtener la lista de veterinarios desde el servicio web y cargarla en el DropDownList_Doctor
            String jsonResult = cita.listarVeterinarios();
            DataTable dt = JsonConvert.DeserializeObject<DataTable>(jsonResult);

            DataRow defaultRow = dt.NewRow();
            defaultRow["id"] = 0; // Valor en blanco o null para el valor por defecto
            defaultRow["nombre"] = "Seleccione Veterinario"; // Texto del valor por defecto
            dt.Rows.InsertAt(defaultRow, 0);

            dt.Columns.Add("nombre_completo", typeof(string), "nombre + ' ' + apellido");

            DropDownList_Doctor.DataSource = dt;
            DropDownList_Doctor.DataTextField = "nombre_completo";
            DropDownList_Doctor.DataValueField = "id";
            DropDownList_Doctor.DataBind();
        }
    }
}
