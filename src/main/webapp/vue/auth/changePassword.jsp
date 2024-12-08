<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="controleur.*, java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Changer le mot de passe</title>
    <link rel="stylesheet" href="../../assets/css/login.css">
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

    <div class="login-container">

        <% if (message != null) { %>
            <div class="<%= messageType %>">
                <%= message %>
            </div>
        <% } %>

        <form class="login-form" method="post">
        	<div class="login-header">
        		<h1>Changer le mot de passe</h1>
        		<a href="../../index.jsp">
                    <img src="../../assets/img/logo/loder.png" width="40px" height="40px" alt="Login Icon" class="login-icon">
                </a>
        	</div>
            <label for="currentPassword">Mot de passe actuel</label>
            <input type="password" id="password" name="currentPassword" placeholder="Entrez votre mot de passe actuel" required>

            <label for="newPassword">Nouveau mot de passe</label>
            <input type="password" id="password" name="newPassword" placeholder="Entrez votre nouveau mot de passe" required>

            <label for="confirmPassword">Confirmer le mot de passe</label>
            <input type="password" id="password" name="confirmPassword" placeholder="Confirmez votre nouveau mot de passe" required>

            <button type="submit" name="Submit">Soumettre</button>
        </form>
    </div>
</body>
</html>
