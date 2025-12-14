<%@ Page Language="C#" MasterPageFile="~/UI/Layout.master" AutoEventWireup="true" CodeBehind="ListadoVeterinarios.aspx.cs" Inherits="SitioWeb.UI.Listado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titulo" runat="server">Listado Veterinarios</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cuerpo" runat="server">

    <div class="row">
        <div class="col-md-10 offset-md-1">
            <div class="card mt-5 text-center">
                <div class="mt-3">
                    <h3>Listado Veterinarios</h3>
                </div>
                <form id="form1" runat="server">
                    <div>
                        <asp:GridView ID="GridView_Doctores" runat="server" AutoGenerateColumns="False" DataKeyNames="id" CssClass="table table-hover table-secondary"
                             OnRowUpdating="GridView_Doctores_RowUpdating" OnRowEditing="GridView_Doctores_RowEditing"
                            OnRowCancelingEdit="GridView_Doctores_RowCancelingEdit">
                            <Columns>
                                <asp:TemplateField HeaderText="Acciones">
                                    <ItemTemplate>
                                        <asp:Button runat="server" Text="Editar" CommandName="Edit" CssClass="btn btn-primary" />
                                        <asp:Button runat="server" Text="Eliminar" CommandName="Delete" CssClass="btn btn-danger" OnClientClick='<%# "showDeleteModal(\"ListadoDoctores.aspx/EliminarFila\", " + Eval("id") + "); return false;" %>' />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Button runat="server" Text="Modificar" CommandName="Update" CssClass="btn btn-success" />
                                        <asp:Button runat="server" Text="Cancelar" CommandName="Cancel" CssClass="btn btn-secondary" />
                                    </EditItemTemplate>
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
                                
                            </Columns>
                        </asp:GridView>
                    </div>
                </form>
            </div>
        </div>
    </div>

</asp:Content>

