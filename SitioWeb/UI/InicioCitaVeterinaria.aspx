<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InicioCitaVeterinaria.aspx.cs" Inherits="SitioWeb.UI.InicioCitaVeterinaria" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>CITA VETERINARIA</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="../img/CitaVeteLogo.png" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/stylesBootstrap.css" rel="stylesheet" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
 
</head>
<body id="page-top">
       <!-- Navigation-->
       <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
           <div class="container">
               <!--<a class="navbar-brand" href="#page-top">CITA VETERINARIA</a>-->
                <div class="logo">
					<a href="InicioCitaVeterinaria.aspx"><img src="../img/CitaVeteLogo.png" alt="" style="height: 50px; width: 80px"/></a>
				 </div>
               <button class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                   Menu
                   <i class="fas fa-bars"></i>
               </button>
               <div class="collapse navbar-collapse" id="navbarResponsive">
                   <ul class="navbar-nav ms-auto">
                       <li class="nav-item mx-0 mx-lg-1"><a  class="nav-link py-3 px-0 px-lg-3 rounded" href="InicioSesion.aspx">Inicio Sesion</a></li>                       
                       <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#about">Acerca de Nosotros</a></li>
                       <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#contact">Contacto</a></li>
                   </ul>
               </div>
           </div>
       </nav>
       <!-- Masthead-->
       <header class="masthead bg-primary text-white text-center">
           <div class="container d-flex align-items-center flex-column">
               <!-- Masthead Avatar Image-->
               <img class="masthead-avatar mb-5" src="../img/imginicio.png" alt="..." />
               <!-- Masthead Heading-->
               <h1 class="masthead-heading text-uppercase mb-0">BIENVENIDO A MI MASCOTA !!</h1>
               <!-- Icon Divider-->
               <div class="divider-custom divider-light">
                   <div class="divider-custom-line"></div>
                   <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                   <div class="divider-custom-line"></div>
               </div>
               <!-- Masthead Subheading-->
               <p class="masthead-subheading font-weight-light mb-0">El bienestar de tu mascota está salvo en nuestras manos</p>
           </div>
       </header>       
       <!-- About Section-->
       <section class="page-section bg-primary text-white mb-0" id="about">
           <div class="container">
               <!-- About Section Heading-->
               <h2 class="page-section-heading text-center text-uppercase text-white">Sobre nosotros</h2>
               <!-- Icon Divider-->
               <div class="divider-custom divider-light">
                   <div class="divider-custom-line"></div>
                   <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                   <div class="divider-custom-line"></div>
               </div>
               <!-- About Section Content-->
               <div class="row">
                   <div class="ms-auto"><p class="lead">Bienvenidos a Veterinaria MI MASCOTA, tu destino confiable para el cuidado integral de tus mascotas. En MI MASCOTA, nos enorgullece ofrecer servicios veterinarios excepcionales con un enfoque cálido y compasivo. 
                                                        Nuestro equipo de profesionales altamente calificados está dedicado a brindar atención excepcional a tus amigos peludos. Nos comprometemos a proporcionar servicios médicos de alta calidad, desde exámenes de rutina hasta tratamientos especializados, con un enfoque en el bienestar y la comodidad de cada animal.
                                                        Gracias por confiar en MI MASCOTA para el cuidado de tus animales. Estamos comprometidos con la excelencia y ansiosos por ser parte de la vida y la salud de tus mascotas.¡Esperamos verte pronto en nuestra clínica!
                                        </p></div>
               </div>
               <!-- About Section Button-->
           </div>
       </section>
       <!-- Contact Section-->
       <section class="page-section" id="contact">
           <div class="container">
               <!-- Contact Section Heading-->
               <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">Envíanos tus dudas</h2>
               <!-- Icon Divider-->
               <div class="divider-custom">
                   <div class="divider-custom-line"></div>
                   <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                   <div class="divider-custom-line"></div>
               </div>
               <!-- Contact Section Form-->
               <div class="row justify-content-center">
                   <div class="col-lg-8 col-xl-7">
                       <!-- * * * * * * * * * * * * * * *-->
                       <!-- * * SB Forms Contact Form * *-->
                       <!-- * * * * * * * * * * * * * * *-->
                       <!-- This form is pre-integrated with SB Forms.-->
                       <!-- To make this form functional, sign up at-->
                       <!-- https://startbootstrap.com/solution/contact-forms-->
                       <!-- to get an API token!-->
                       <form id="contactForm" data-sb-form-api-token="API_TOKEN">
                           <!-- Name input-->
                           <div class="form-floating mb-3">
                               <input class="form-control" id="name" type="text" placeholder="Enter your name..." data-sb-validations="required" />
                               <label for="name">Nombre completo</label>
                               <div class="invalid-feedback" data-sb-feedback="name:required">Es necesario ingresar un nombre</div>
                           </div>
                           <!-- Email address input-->
                           <div class="form-floating mb-3">
                               <input class="form-control" id="email" type="email" placeholder="name@example.com" data-sb-validations="required,email" />
                               <label for="email">Correo electrónico</label>
                               <div class="invalid-feedback" data-sb-feedback="email:required">Es necesario un correo</div>
                               <div class="invalid-feedback" data-sb-feedback="email:email">El correo no es válido</div>
                           </div>
                           <!-- Phone number input-->
                           <div class="form-floating mb-3">
                               <input class="form-control" id="phone" type="tel" placeholder="(123) 456-7890" data-sb-validations="required" />
                               <label for="phone">Número de teléfono</label>
                               <div class="invalid-feedback" data-sb-feedback="phone:required">Ingrese un número de teléfono</div>
                           </div>
                           <!-- Message input-->
                           <div class="form-floating mb-3">
                               <textarea class="form-control" id="message" type="text" placeholder="Enter your message here..." style="height: 10rem" data-sb-validations="required"></textarea>
                               <label for="message">Mensaje</label>
                               <div class="invalid-feedback" data-sb-feedback="message:required">Ingrese un mensaje</div>
                           </div>
                           <!-- Submit success message-->
                           <!---->
                           <!-- This is what your users will see when the form-->
                           <!-- has successfully submitted-->
                           <div class="d-none" id="submitSuccessMessage">
                               <div class="text-center mb-3">
                                   <div class="fw-bolder">Form submission successful!</div>
                                   To activate this form, sign up at
                                   <br />
                                   <a href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
                               </div>
                           </div>
                           <!-- Submit error message-->
                           <!---->
                           <!-- This is what your users will see when there is-->
                           <!-- an error submitting the form-->
                           <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error, no se pudo enviar el mensaje!</div></div>
                           <!-- Submit Button-->
                           <button class="btn btn-primary btn-xl disabled" id="submitButton" type="submit">Enviar</button>
                       </form>
                   </div>
               </div>
           </div>
       </section>
       <!-- Footer-->
       <footer class="footer text-center">
           <div class="container">
               <div class="row">
                   <!-- Footer Location-->
                   <div class="col-lg-4 mb-5 mb-lg-0">
                       <h4 class="text-uppercase mb-4">Ubicación</h4>
                       <p class="lead mb-0">
                           Universidad Central del Ecuador
                           <br />
                           Junto al edificio de Idiomas
                       </p>
                   </div>
                   <!-- Footer Social Icons-->
                   <div class="col-lg-4 mb-5 mb-lg-0">
                       <h4 class="text-uppercase mb-4">Around the Web</h4>
                       <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-facebook-f"></i></a>
                       <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-twitter"></i></a>
                       <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-linkedin-in"></i></a>
                       <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-dribbble"></i></a>
                   </div>
                   <!-- Footer About Text-->
                   <div class="col-lg-4">
                       <h4 class="text-uppercase mb-4">ACERCA DE NUESTROS VETERINARIOS</h4>
                       <p class="lead mb-0">
                           Lo que distingue a nuestros profesionales es que puedes confiar en que recibirás un servicio adaptado a tus necesidades, 
                           respaldado por una ética de trabajo sólida y un compromiso constante con la satisfacción del cliente y tus mascotas.
                           Disfrutarás de la expericiencia por nuestra parte.
                           
                       </p>
                   </div>
               </div>
           </div>
       </footer>
       <!-- Copyright Section-->
       <div class="copyright py-4 text-center text-white">
           <div class="container"><small>Copyright &copy; CitasVeterinarias-UCE 2024</small></div>
       </div>       
       <!-- Bootstrap core JS-->
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
       <!-- Core theme JS-->
       <script src="js/scripts.js"></script>
       <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
       <!-- * *                               SB Forms JS                               * *-->
       <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
       <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
       <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
   </body>
</html>
