<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="controleur.*, java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion • Agro Eco</title>
    <link rel="stylesheet" href="../../assets/css/login.css">
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
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            // Méthode pour vérifier la connexion
            User unUser = Controleur.verifConnexion(email, password);

            if (unUser != null) {
                // On vérifie le statut de l'utilisateur
                String status = unUser.getStatus();
                
                // Si le statut est "new", nouveau mot de passe
                if ("new".equals(status)) {
                    // Redirection vers la page pour changer le mot de passe
                    session.setAttribute("user", unUser);
                    response.sendRedirect("changePassword.jsp");
                    return;
                }
                
                // Si le statut est "confirmed", on permet la connexion
                if ("confirmed".equals(status)) {
                    session.setAttribute("user", unUser);
                    message = "Bienvenue, " + unUser.getNom() + "! Vous êtes connecté.";
                    messageType = "success";
                    
                    // Vérification du rôle de l'utilisateur après la confirmation du mot de passe
                    if ("admin".equals(unUser.getRole())) {
                        // Redirection vers la page Admin
                        destination = request.getContextPath() + "/vue/admin_connected/index_admin.jsp"; 
                    } else if ("user".equals(unUser.getRole())) {
                        // Redirection vers la page Utilisateur
                        destination = request.getContextPath() + "/vue/user_connected/index_user.jsp"; 
                    }
                    response.sendRedirect(destination);
                    return;
                }
                
                // Si le statut est "suspended", on bloque la connexion
                if ("suspended".equals(status)) {
                    message = "Votre compte est suspendu. Veuillez contacter l'administrateur.";
                    messageType = "alert";
                }
            } else {
                message = "Email ou mot de passe incorrect.";
                messageType = "alert";
            }
        }
    %>

    <div class="login-container">
        <!-- Affichage du message  -->
        <% if (message != null) { %>
            <div class="<%= messageType %>">
                <%= message %>
            </div>
        <% } %>

        <form class="login-form" method="post">
            <div class="login-header">
                <h1>Connexion</h1>
                <a href="../../index.jsp">
                    <img src="../../assets/img/logo/loder.png" width="40px" height="40px" alt="Login Icon" class="login-icon">
                </a>
            </div>
            <label for="email">Identifiant</label>
            <input type="text" id="email" name="email" placeholder="Entrez votre email" required>
            
            <label for="password">Mot de passe</label>
            <input type="password" id="password" name="password" placeholder="Entrez votre mot de passe" required>
            
            <button type="submit" name="Connexion">Se connecter</button>
        </form>
    </div>
</body>
</html>
