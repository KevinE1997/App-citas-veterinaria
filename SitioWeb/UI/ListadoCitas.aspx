<%@ Page Language="C#" MasterPageFile="~/UI/Layout.master" AutoEventWireup="true" CodeBehind="ListadoCitas.aspx.cs" Inherits="SitioWeb.UI.ListadoCitas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titulo" runat="server">Listado Citas</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cuerpo" runat="server">

    <div class="row">
        <div class="col-md-10 offset-md-1">
            <div class="card mt-5 text-center">
                <div class="mt-3">
                    <h3>Listado Citas</h3>
                </div>
                <form id="form1" runat="server">
                    <div>
                        <asp:GridView ID="GridView_Citas" runat="server" AutoGenerateColumns="False" DataKeyNames="id" CssClass="table table-hover table-secondary"
                             OnRowUpdating="GridView_Citas_RowUpdating" OnRowEditing="GridView_Citas_RowEditing"
                            OnRowCancelingEdit="GridView_Citas_RowCancelingEdit">
                            <Columns>
                                <asp:TemplateField HeaderText="Acciones">
                                    <ItemTemplate>
                                        <asp:Button runat="server" Text="Editar" CommandName="Edit" CssClass="btn btn-primary" />
                                        <asp:Button runat="server" Text="Eliminar" CommandName="Delete" CssClass="btn btn-danger" OnClientClick='<%# "showDeleteModal(\"ListadoCitas.aspx/EliminarFila\", " + Eval("id") + "); return false;" %>' />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Button runat="server" Text="Modificar" CommandName="Update" CssClass="btn btn-success" />
                                        <asp:Button runat="server" Text="Cancelar" CommandName="Cancel" CssClass="btn btn-secondary" />
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="true" />
                                <asp:TemplateField HeaderText="Paciente">
                                    <ItemTemplate>
                                        <asp:Label ID="LabelPaciente" runat="server" Text='<%# Bind("Paciente") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBoxPaciente" runat="server" Text='<%# Bind("Paciente") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Fecha">
                                    <ItemTemplate>
                                        <asp:Label ID="LabelFecha" runat="server" Text='<%# Bind("Fecha") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBoxFecha" runat="server" Text='<%# Bind("Fecha") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Hora">
                                    <ItemTemplate>
                                        <asp:Label ID="LabelHora" runat="server" Text='<%# Bind("Hora") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBoxHora" runat="server" Text='<%# Bind("Hora") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Veterinario">
                                    <ItemTemplate>
                                        <asp:Label ID="LabelDoctor" runat="server" Text='<%# Bind("Veterinario") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBoxDoctor" runat="server" Text='<%# Bind("Veterinario") %>'></asp:TextBox>
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
