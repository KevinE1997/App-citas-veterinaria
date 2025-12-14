<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistroUsuario.aspx.cs" Inherits="SitioWeb.UI.RegistroUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Registro Usuario</title>

    <!-- Icono de la página -->
    <link rel="icon" type="image/x-icon" href="../img/CitaSaludLogo.ico" />

    <!-- Estilos de la página -->
    <link href="../css/stylesRegister.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" />

    <!-- Estilos de iconos -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" />
</head>
<body>
    <!-- Contenedor de alerta para mostrar mensajes de error -->
    <div class="container mt-4">
        <asp:Panel runat="server" Visible='<%# Alerta %>'>
            <div class="alert alert-dismissible alert-danger fade show" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <!-- Etiqueta para mostrar el mensaje de alerta -->
                <asp:Label ID="Label_Alerta" runat="server" Text=""></asp:Label>
            </div>
        </asp:Panel>
        <!-- Contenedor para mostrar mensajes informativos -->
        <asp:Panel runat="server" Visible='<%# Info %>'>
            <div class="alert alert-dismissible alert-success fade show" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <!-- Etiqueta para mostrar el mensaje informativo -->
                <asp:Label ID="Label_Info" runat="server" Text=""></asp:Label>
            </div>
        </asp:Panel>
    </div>

    <!-- Formulario de registro -->
    <div class="register">
        <div class="col-md-4 offset-md-4">
            <form id="form2" runat="server" class="register__form">
                <div class="text-center mb-4">
                    <h3>Registrarse</h3>
                </div>
                <div class="form-group mt-4">
                    <i class="ri-user-line"></i>
                    <asp:Label ID="Label1" runat="server" Text="Nombre"></asp:Label>
                    <asp:TextBox ID="TextBox_Nombre" runat="server" Text="" oninput="validarTexto(this)" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group mt-4">
                    <i class="ri-user-line"></i>
                    <asp:Label ID="Label2" runat="server" Text="Apellido"></asp:Label>
                    <asp:TextBox ID="TextBox_Apellido" runat="server" Text="" oninput="validarTexto(this)" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group mt-4">
                    <i class="ri-mail-line"></i>
                    <asp:Label ID="Label3" runat="server" Text="Email"></asp:Label>
                    <asp:TextBox type="email" ID="TextBox_Email" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group mt-4">
                    <i class="ri-lock-password-line"></i>
                    <asp:Label ID="Label4" runat="server" Text="Contraseña"></asp:Label>
                    <asp:TextBox type="password" ID="TextBox_Password" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="centered-button">
                    <asp:Button ID="Button_Registrar" runat="server" Text="Registrar" OnClick="Button_Registrar_Click" CssClass="btn btn-primary btn-block mt-4" />
                </div>
                <div class="container text-center mt-3">
                    <a href="InicioCitaVeterinaria.aspx" >Regresar al Inicio</a>
                </div>
            </form>
        </div>
    </div>


    <script>
        function validarTexto(input) {
            var newText = input.value.replace(/[0-9]/g, ''); // Remover números
            input.value = newText;
        }
    </script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
