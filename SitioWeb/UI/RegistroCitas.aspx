<%@ Page Language="C#" MasterPageFile="~/UI/Layout.master" AutoEventWireup="true" CodeBehind="RegistroCitas.aspx.cs" Inherits="SitioWeb.UI.RegistroCitas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titulo" runat="server">Registro Citas</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cuerpo" runat="server">

    <div class="container mt-4">
        <!-- Panel para mostrar alerta en caso de error -->
        <asp:Panel runat="server" Visible='<%# Alerta %>'>
            <div class="alert alert-dismissible alert-danger fade show" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <!-- Etiqueta para mostrar el mensaje de alerta -->
                <asp:Label ID="Label_Alerta" runat="server" Text=""></asp:Label>
            </div>
        </asp:Panel>
        <!-- Panel para mostrar información exitosa -->
        <asp:Panel runat="server" Visible='<%# Info %>'>
            <div class="alert alert-dismissible alert-success fade show" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <!-- Etiqueta para mostrar el mensaje de información exitosa -->
                <asp:Label ID="Label_Info" runat="server" Text=""></asp:Label>
            </div>
        </asp:Panel>
    </div>

    <!-- Formulario para registrar citas -->
    <form id="form2" runat="server">
        <div class="container">
            <div class="row">
                <!-- Columna para seleccionar paciente y veterinario -->
                <div class="col-md-6 d-inline-block ml-5">
                    <div class="card mt-5 text-center">
                        <div class="card-header">
                            <h3>Registro Citas</h3>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <!-- Etiqueta para seleccionar paciente -->
                                <asp:Label ID="Label1" runat="server" Text="Seleccione Paciente"></asp:Label>
                                <!-- Lista desplegable para seleccionar paciente -->
                                <asp:DropDownList ID="DropDownList_Paciente" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <!-- Etiqueta para seleccionar Veterinario -->
                                <asp:Label ID="Label3" runat="server" Text="Seleccione Veterinario"></asp:Label>
                                <!-- Lista desplegable para seleccionar doctor -->
                                <asp:DropDownList ID="DropDownList_Doctor" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                            <!-- Botón para registrar la cita -->
                            <asp:Button ID="Button_Registrar" runat="server" Text="Registrar" OnClick="Button_Registrar_Click" CssClass="btn btn-primary btn-block mt-4" />
                        </div>
                    </div>
                </div>

                <!-- Columna para seleccionar horario -->
                <div class="col-md-4 d-inline-block">
                    <div class="card mt-5 text-center">
                        <div class="card-header">
                            <h5>Seleccione Horario</h5>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <!-- Etiqueta para seleccionar fecha de la cita -->
                                <asp:Label ID="Label6" runat="server" Text="Seleccione fecha cita"></asp:Label>
                                <div class="mx-2">
                                    <!-- Cuadro de texto para seleccionar fecha de la cita -->
                                    <asp:TextBox ID="datePicker" runat="server" CssClass="date-picker"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <!-- Etiqueta para seleccionar hora de la cita -->
                                <asp:Label ID="Label7" runat="server" Text="Seleccione hora cita"></asp:Label>
                                <!-- Cuadro de texto para seleccionar hora de la cita -->
                                <asp:TextBox ID="timePicker" runat="server" CssClass="time-picker"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </form>
</asp:Content>

