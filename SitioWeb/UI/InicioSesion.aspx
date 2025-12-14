<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InicioSesion.aspx.cs" Inherits="SitioWeb.UI.InicioSesion" %>

<!-- Declaración de la página ASP.NET. Especifica la clase de código detrás y el archivo de código asociado. -->

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Inicio Sesión</title>

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="../img/CitaSaludLogo.png" />

    <!-- CSS del tema principal (incluye Bootstrap) -->
    <link href="../css/stylesLogin.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Estilos de Remixicon -->
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../css/stylesBootstrap.css" rel="stylesheet" />
</head>
<body runat="server">



    <div class="login">

        <div class="container mt-4">
            <asp:Panel runat="server" Visible='<%# Alerta %>'>
                <div class="alert alert-dismissible alert-danger fade show" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <asp:Label ID="Label_Alerta" runat="server" Text=""></asp:Label>
                </div>
            </asp:Panel>
        </div>

        <!-- Formulario de inicio de sesión -->
        <form runat="server" class="login__form">
            <h1>Iniciar Sesión</h1>
            <div class="login-container1">

                <!-- Campo de entrada para el nombre de usuario -->
                <div class="login__box-input">
                    <label for="username" runat="server">Usuario:</label>
                    <div class="textbox-icon">
                        <i class="ri-user-3-line login__icon"></i>
                        <asp:TextBox ID="username" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <!-- Campo de entrada para la contraseña -->
                <div class="login__box1">
                    <label for="password">Contraseña:</label>
                    <div class="textbox-icon1">
                        <i class="ri-lock-2-line login__icon"></i>
                        <asp:TextBox ID="password" runat="server" Text="" CssClass="form-control" TextMode="Password" />
                    </div>
                </div>

                <!-- Botón para iniciar sesión -->
                <div class="centered-button">
                    <asp:Button type="button" class="btn btn-secondary" ID="btnLogin" runat="server" Text="Iniciar Sesión" OnClick="btnLogin_Click" />
                </div>
                <br />

                <!-- Etiqueta para mostrar mensajes de error -->
                <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red" CssClass="alert-danger " />
            </div>

            <!-- Sección de registro -->
            <div class="login__register">
                ¿No tienes una cuenta?
                <button type="button" class="register-button"></button>
                <asp:Button type="button" class="btn btn-secondary" ID="Button1" runat="server" Text="Registrate" OnClick="miBoton_Click" />
            </div>
        </form>

    </div>


    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

