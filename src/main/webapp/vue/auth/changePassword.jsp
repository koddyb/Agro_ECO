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
        User user = (User) session.getAttribute("user");
        String message = null;
        String messageType = null;

        if (request.getParameter("Submit") != null) {
            String currentPassword = request.getParameter("currentPassword");
            String newPassword = request.getParameter("newPassword");
            String confirmPassword = request.getParameter("confirmPassword");

            if (newPassword.equals(confirmPassword)) {
                if (Controleur.verifPassword(user.getEmail(), currentPassword)) {
                    // Mise à jour du password
                    boolean success = Controleur.updatePassword(user.getEmail(), newPassword);
                    if (success) {
                        // Mise à jour du statut à "confirmed"
                        Controleur.updateStatus(user.getEmail(), "confirmed");
                        message = "Mot de passe changé avec succès. Vous pouvez maintenant vous connecter.";
                        messageType = "success";
                        response.sendRedirect("login.jsp");
                        return;
                    } else {
                        message = "Erreur lors de la mise à jour du mot de passe.";
                        messageType = "alert";
                    }
                } else {
                    message = "Le mot de passe actuel est incorrect.";
                    messageType = "alert";
                }
            } else {
                message = "Les mots de passe ne correspondent pas.";
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
        <section id="contact" class="contact-area after-none contact-bg pt-120 pb-120 p-relative fix" >
                
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
                        <div class="contact-bg02 wow fadeInLeft  animated">
                        <div class="section-title center-align">
                           <h5>CONTACT US</h5>
                            <h2>
                                Changer le mot de passe
                            </h2>

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
                                <label for="currentPassword">Mot de passe actuel</label>                               
                                <input type="password" id="password" name="currentPassword" placeholder="Entrez votre mot de passe actuel" required>
                            </div>
                        </div>		
                        <div class="col-lg-7">                               
                            <div class="contact-field p-relative c-subject mb-30">             
                                <label for="newPassword">Nouveau mot de passe</label>                      
                                <input type="password" id="password" name="newPassword" placeholder="Entrez votre nouveau mot de passe" required>
                            </div>
                        </div>	
                        <div class="col-lg-7">                               
                            <div class="contact-field p-relative c-subject mb-30">    
                                <label for="confirmPassword">Confirmez votre nouveau mot de passe</label>                               
                                <input type="password" id="password" name="confirmPassword" placeholder="Confirmez votre nouveau mot de passe" required>
                            </div>
                        </div>	
                        
                        <div class="col-lg-12">
                            <div class="slider-btn">                                          
                            <button type="submit" class="btn ss-btn" data-animation="fadeInRight" data-delay=".8s" name="Submit">Se Connecter</button>				
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
		<!-- JS here -->
</html>