<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrincipalUsuario.aspx.cs" Inherits="SitioWeb.UI.PrincipalUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>CITA SALUD</title>

    <link rel="icon" type="image/x-icon" href="../img/CitaVeteLogo.ico" />
    <link href="../css/stylesBootstrap.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body>

    <form id="form2" runat="server">
        <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
            <div class="container">
                <div class="logo">
                    <a href="InicioCitaSalud.aspx">
                        <img src="../img/CitaVeteLogo.png" alt="" style="height: 50px; width: 80px" /></a>
                </div>
                <button class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
            <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">

                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="RegistroCitas.aspx">Registro Citas</a></li>
                        <asp:Button type="button" class="btn btn-danger" OnClick="btnCerrar_Click" runat="server" Text="Cerrar Sesión"></asp:Button>
                    </ul>
                </div>
            </div>
        </nav>
        <hr />
        <hr />
        <hr />
        <hr />
        <hr />
        <hr />

        <div class="container mt-15 text-center">
            <h1>Bienvenido!</h1>
        </div>


        <div class="row">
            <div class="col-md-10 offset-md-1">
                <div class="card mt-5 text-center">
                    <div class="mt-3">
                        <h3>Tus Citas Agendadas</h3>
                    </div>
                    <div>
                        <asp:GridView ID="GridView_Citas" runat="server" AutoGenerateColumns="False" DataKeyNames="id" CssClass="table table-hover table-secondary">
                            <Columns>
                                <asp:TemplateField HeaderText="Acciones">
                                    <ItemTemplate>
                                        <asp:Button runat="server" Text="Eliminar" CommandName="Delete" CssClass="btn btn-danger" OnClientClick='<%# "showDeleteModal(\"ListadoCitas.aspx/EliminarFila\", " + Eval("id") + "); return false;" %>' />
                                    </ItemTemplate>
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
                                        <asp:Label ID="LabelVeterinario" runat="server" Text='<%# Bind("Veterinario") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBoxVeterinario" runat="server" Text='<%# Bind("Doctor") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <div class="modal fade" id="confirmDeleteModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabelDelete">Advertencia</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    ¿Esta seguro que desea eleimnar la Cita?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-danger" id="btnConfirmDelete">Eliminar</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function showDeleteModal(url, id) {
            $('#confirmDeleteModal').modal('show');
            $('#btnConfirmDelete').off('click'); // Asegurarse de eliminar cualquier manejador anterior
            $('#btnConfirmDelete').on('click', function () {
                $.ajax({
                    type: 'POST',
                    url: url, // Cambia esto por la URL correcta de tu página
                    data: JSON.stringify({ id: id }),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (response) {
                        if (response.d === 'success') {
                            location.reload();
                        } else {
                            // Maneja una eliminación fallida si es necesario
                        }
                        $('#confirmDeleteModal').modal('hide');
                    },
                    error: function () {
                        // Maneja el error si ocurre algún problema con la solicitud AJAX
                    }
                });
            });
        }
    </script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
