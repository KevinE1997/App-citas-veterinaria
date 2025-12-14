<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrincipalAdmin.aspx.cs" Inherits="SitioWeb.UI.PrincipalAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>ADMINISTRADOR</title>
    <link rel="icon" type="image/x-icon" href="../img/CitaVeteLogo.ico" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../css/stylesBootstrap.css" rel="stylesheet" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body runat="server">
    <form runat="server" method="post">
        <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
            <div class="container-fluid">
                <div class="logo">
                    <a href="InicioCitaSalud.aspx">
                        <img src="../img/CitaVeteLogo.png" alt="" style="height: 50px; width: 80px" /></a>
                    <a href="InicioCitaVeterinaria.aspx" class="navbar-brand">CITA VETERINARIO </a>
                </div>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#opciones">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-center" id="opciones">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link">Inicio</a>
                        </li>
                        <!--PACIENTES-->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Pacientes
                            </a>
                            <ul class="dropdown-menu">
                               
                                <li>
                                    <asp:HyperLink class="dropdown-item" runat="server" NavigateUrl="ListadoPacientes.aspx" OnServerClick="btnCerrar_Click">
                                Lista de Pacientes
                                    </asp:HyperLink>
                                </li>
                            </ul>

                           
                            <!--VETERINARIOS-->
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="ListadoVeterinarios.aspx" role="button" data-bs-toggle="dropdown">Veterinarios
                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a class="dropdown-item" href="RegistroVeterinarios.aspx">Registro de Veterinarios
                                        </a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="ListadoVeterinarios.aspx">Lista de Veterinarios
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="ListadoCitas.aspx" role="button" data-bs-toggle="dropdown">Citas
                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a class="dropdown-item" href="RegistroCitas.aspx">Generación de Citas 
                                        </a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="ListadoCitas.aspx">Lista de Citas 
                                        </a>
                                    </li>
                                </ul>
                            </li>
                    </ul>

                    <!--BUTÓN DE SALIR-->

                    <asp:Button type="button" class="btn btn-danger" OnClick="btnCerrar_Click" runat="server" Text="Cerrar Sesión"></asp:Button>
                </div>
            </div>
        </nav>
    </form>
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>


    <header class="masthead bg-primary text-white text-center">
        <div class="container d-flex align-items-center flex-column">
            <!-- Masthead Avatar Image-->
            <img class="masthead-avatar mb-5" src="../img/conjuntoVets.jpg" alt="..." />
            <!-- Masthead Heading-->
            <h1 class="masthead-heading text-uppercase mb-0">Bienvenido Veterinario Admin</h1>
            <!-- Icon Divider-->
            <div class="divider-custom divider-light">
                <div class="divider-custom-line"></div>
                <div class="divider-custom-icon"><i class="fas fa-stethoscope"></i></div>
                <div class="divider-custom-line"></div>
            </div>
            <!-- Masthead Subheading-->
            <p class="masthead-subheading font-weight-light mb-0">Cita Veterinaria</p>
        </div>
    </header>
</body>
</html>
