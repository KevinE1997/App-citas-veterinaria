<%@ Page Language="C#" MasterPageFile="~/UI/Layout.master" AutoEventWireup="true" CodeBehind="RegistroVeterinarios.aspx.cs" Inherits="SitioWeb.UI.RegistroVeterinarios" %>


<asp:Content ID="Content1" ContentPlaceHolderID="titulo" runat="server">Listado Veterinarios</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="cuerpo" runat="server">


    <div class="container mt-4">
        <asp:Panel runat="server" Visible='<%# Alerta %>'>
            <div class="alert alert-dismissible alert-danger fade show" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <asp:Label ID="Label_Alerta" runat="server" Text=""></asp:Label>
            </div>
        </asp:Panel>
       
        <asp:Panel runat="server" Visible='<%# Info %>'>
            <div class="alert alert-dismissible alert-success fade show" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <asp:Label ID="Label_Info" runat="server" Text=""></asp:Label>
            </div>
        </asp:Panel>
    </div>


    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card mt-5 text-center">
                <div class="card-header">
                    <h3>Registro Veterinarios</h3>
                </div>
                <div class="card-body">
                    <form id="form2" runat="server">
                 
                        <div class="form-group">
                            <asp:Label ID="Label1" runat="server" Text="Ingrese Nombre Veterinario"></asp:Label>
                            <asp:TextBox ID="TextBox_Nombre" runat="server" Text="" CssClass="form-control" oninput="validarTexto(this)"></asp:TextBox>
                        </div>
              
                        <div class="form-group">
                            <asp:Label ID="Label2" runat="server" Text="Ingrese Apellido Veterinario"></asp:Label>
                            <asp:TextBox ID="TextBox_Apellido" runat="server" Text="" CssClass="form-control" oninput="validarTexto(this)"></asp:TextBox>
                        </div>
            
                        
                        <asp:Button ID="Button_Registrar" runat="server" Text="Registrar" OnClick="Button_Registrar_Click" CssClass="btn btn-primary btn-block mt-4" />
                    </form>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
