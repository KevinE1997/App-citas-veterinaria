<%@ Page Language="C#" MasterPageFile="~/UI/Layout.master" AutoEventWireup="true" CodeBehind="RegistroPacientes.aspx.cs" Inherits="SitioWeb.UI.RegistroPacientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titulo" runat="server">Registro Pacientes</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cuerpo" runat="server">

    <!-- Contenedor para mostrar alertas de error -->
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

    <!-- Formulario para el registro de pacientes -->
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card mt-5 text-center">
                <div class="card-header">
                    <h3>Registro Pacientes</h3>
                </div>
                <div class="card-body">
                    <form id="form2" runat="server">
                        <div class="form-group">
                            <asp:Label ID="Label1" runat="server" Text="Ingrese Nombre"></asp:Label>
                            <asp:TextBox ID="TextBox_Nombre" runat="server" oninput="validarTexto(this)" Text="" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label2" runat="server" Text="Ingrese Apellido"></asp:Label>
                            <asp:TextBox ID="TextBox_Apellido" runat="server" oninput="validarTexto(this)" Text="" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label3" runat="server" Text="Ingrese Email"></asp:Label>
                            <asp:TextBox type="email" ID="TextBox_Email" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label4" runat="server" Text="Ingrese Contraseña"></asp:Label>
                            <asp:TextBox type="password" ID="TextBox_Password" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                        </div>
                        <asp:Button ID="Button_Registrar" runat="server" Text="Registrar" OnClick="Button_Registrar_Click" CssClass="btn btn-primary btn-block mt-4" />
                    </form>
                </div>
            </div>
        </div>
    </div>


</asp:Content>

