<%@ page import="controleur.*, java.sql.*" %>

<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Capatel - Solar Energy HTML Template</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <%@ include file="../../components/liens.jsp" %>
    </head>
    <body>
        <%
        // Variables pour stocker le message et son type
        String message = null;
        String messageType = null;
        String destination = null;

     	// Vérification des informations de connexion si le bouton "Connexion" a été cliqué
        if (request.getParameter("Connexion") != null) {
            // Récupération des paramètres email et mot de passe soumis par le formulaire
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            // Appel de la méthode pour vérifier les informations de connexion
            User unUser = Controleur.verifConnexion(email, password);

            // Si un utilisateur correspondant est trouvé
            if (unUser != null) {
                // On vérifie le statut de l'utilisateur
                String status = unUser.getStatus();

                // Si le statut est "new", l'utilisateur doit changer son mot de passe
                if ("new".equals(status)) {
                    // Enregistrer l'utilisateur dans la session et rediriger vers la page de changement de mot de passe
                    session.setAttribute("user", unUser);
                    response.sendRedirect("changePassword.jsp");
                    return;
                }

                // Si le statut est "confirmed", l'utilisateur peut se connecter
                if ("confirmed".equals(status)) {
                    // Ajouter l'ID de l'utilisateur connecté dans la session
                    session.setAttribute("currentUserId", unUser.getIduser());

                    // Message de bienvenue à afficher après la connexion
                    message = "Bienvenue, " + unUser.getNom() + "! Vous êtes connecté.";
                    messageType = "success";

                    // Vérification du rôle de l'utilisateur pour redirection appropriée
                    if ("admin".equals(unUser.getRole())) {
                        // Redirection vers le tableau de bord administrateur
                        destination = request.getContextPath() + "/vue/admin_connected/index_admin.jsp"; 
                    } else if ("user".equals(unUser.getRole())) {
                        // Redirection vers le tableau de bord utilisateur
                        destination = request.getContextPath() + "/vue/user_connected/index_user.jsp"; 
                    }
                    
                    // Redirection vers la destination appropriée après connexion
                    response.sendRedirect(destination);
                    return;
                }

                // Si le statut est "suspended", l'accès est bloqué
                if ("suspended".equals(status)) {
                    // Message d'erreur indiquant que le compte est suspendu
                    message = "Votre compte est suspendu. Veuillez contacter l'administrateur.";
                    messageType = "alert";
                }
            } else {
                // Si aucun utilisateur ne correspond, afficher une erreur d'authentification
                message = "Email ou mot de passe incorrect.";
                messageType = "alert";
            }
        }
    %>

    <!-- main-area -->
        <main>          
        <!-- search-popup -->
		<div class="modal fade bs-example-modal-lg search-bg popup1" tabindex="-1" role="dialog">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content search-popup">
					<div class="text-center">
						<a href="#" class="close2" data-dismiss="modal" aria-label="Close">× close</a>
					</div>
					<div class="row search-outer">
						<div class="col-md-11"><input type="text" placeholder="Search for products..." /></div>
						<div class="col-md-1 text-right"><a href="#"><i class="fa fa-search" aria-hidden="true"></i></a></div>
					</div>
				</div>
			</div>
		</div>
		<!-- /search-popup -->

        <!-- contact-area -->
        <section id="contact" class="contact-area after-none contact-bg pt-120 pb-120 p-relative fix">
            <div class="container">
                <div class="row">
                    <div class="col-lg-5">
                        <div class="contact-info" style="background: url(${pageContext.request.contextPath}/assets/img/bg/footer-bg.png) no-repeat;background-size: cover;">
                            <div class="single-cta pb-30 mb-30 wow fadeInUp animated" data-animation="fadeInDown animated" data-delay=".2s">
                                <div class="f-cta-icon">
                                    <i class="far fa-map"></i>
                                </div> 
                                <h5>Ecrire votre adresse mail</h5>
                                <p>380 St Kilda Road, Melbourne <br>
                                    VIC 3004, Australia</p>
                            </div>
                            <div class="single-cta pb-30 mb-30 wow fadeInUp animated" data-animation="fadeInDown animated" data-delay=".2s">
                                <div class="f-cta-icon">
                                    <i class="far fa-clock"></i>
                                </div>
                                <h5>Working Hours</h5>
                                <p>Monday to Friday 09:00 to 18:30 and <br>
                                    Saturday we work until 15:30</p>
                            </div>
                            <div class="single-cta pb-30 mb-30 wow fadeInUp animated" data-animation="fadeInDown animated" data-delay=".2s">
                                <div class="f-cta-icon">
                                    <i class="far fa-envelope-open"></i>
                                </div>
                                <h5>Message Us</h5>
                                <p>We are always with you to solve your problem
                                    mail us : <a href="#">support@example.com</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <div class="contact-bg02 wow fadeInLeft animated">
                            <div class="section-title center-align">
                                <h5>CONTACT US</h5>
                                <h2>Connexion</h2>

                                <% if (message != null) { %>
                                    <div class="<%= messageType %>">
                                        <%= message %>
                                    </div>
                                <% } %>
                            </div>
                         
                            <form method="post" class="contact-form mt-30">
                                <div class="row">
                                    <div class="col-lg-7">                               
                                        <div class="contact-field p-relative c-subject mb-30"> 
                                            <label for="email">Adresse mail</label>                                  
                                            <input type="email" id="email" name="email" placeholder="Votre adresse mail" required>
                                        </div>
                                    </div>		
                                    <div class="col-lg-7">                               
                                        <div class="contact-field p-relative c-subject mb-30">   
                                            <label for="password">Mot de passe</label>                                
                                            <input type="password" id="password" name="password" placeholder="Saisissez votre mot de passe" required>
                                        </div>
                                    </div>	
                                    
                                    <div class="col-lg-12">
                                        <div class="slider-btn">                                          
                                            <button type="submit" class="btn ss-btn" data-animation="fadeInRight" data-delay=".8s" name="Connexion">Se Connecter</button>				
                                        </div>                             
                                    </div>
                                </div>     
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- contact-area-end -->
        </main>
        <!-- main-area-end -->
        <%@ include file="../../components/scripts.jsp" %>
    </body>
</html>
