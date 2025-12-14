<%@ Page Language="C#" MasterPageFile="~/UI/Layout.master" AutoEventWireup="true" CodeBehind="ListadoPacientes.aspx.cs" Inherits="SitioWeb.UI.ListadoPacientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titulo" runat="server">Listado Pacientes</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cuerpo" runat="server">

    <div class="row">
        <div class="col-md-10 offset-md-1">
            <div class="card mt-5 text-center">
                <div class="mt-3">
                    <h3>Listado Pacientes</h3>
                </div>
                <form id="form1" runat="server">
                    <div>
                        <asp:GridView ID="GridView_Pacientes" runat="server" AutoGenerateColumns="False" DataKeyNames="id" CssClass="table table-hover table-secondary"
                             OnRowUpdating="GridView_Pacientes_RowUpdating" OnRowEditing="GridView_Pacientes_RowEditing"
                            OnRowCancelingEdit="GridView_Pacientes_RowCancelingEdit">
                            <Columns>
                                <asp:TemplateField HeaderText="Acciones">
                                    <ItemTemplate>
                                        <asp:Button runat="server" Text="Eliminar" CommandName="Delete" CssClass="btn btn-danger" OnClientClick='<%# "showDeleteModal(\"ListadoPacientes.aspx/EliminarFila\", " + Eval("id") + "); return false;" %>' />
                                    </ItemTemplate>
                                    
                                </asp:TemplateField>
                                <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="true" />
                                <asp:TemplateField HeaderText="Nombre">
                                    <ItemTemplate>
                                        <asp:Label ID="LabelNombre" runat="server" Text='<%# Bind("nombre") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBoxNombre" runat="server" oninput="validarTexto(this)" Text='<%# Bind("nombre") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Apellido">
                                    <ItemTemplate>
                                        <asp:Label ID="LabelApellido" runat="server" Text='<%# Bind("apellido") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBoxApellido" runat="server" oninput="validarTexto(this)" Text='<%# Bind("apellido") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Email">
                                    <ItemTemplate>
                                        <asp:Label ID="LabelEmail" runat="server" Text='<%# Bind("correo") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBoxEmail" runat="server" oninput="validarTexto(this)" Text='<%# Bind("correo") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Contraseña">
                                    <ItemTemplate>
                                        <asp:Label ID="LabelPassword" runat="server" Text='<%# Bind("contrasena") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBoxPassword" runat="server" oninput="validarTexto(this)" Text='<%# Bind("contrasena") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </form>
            </div>
        </div>
    </div>

</asp:Content>

