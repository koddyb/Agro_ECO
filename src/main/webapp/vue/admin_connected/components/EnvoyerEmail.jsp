<%@ page import="controleur.Controleur" %>
<%@ page import="Modele.Modele" %>
<%@ page import="controleur.User" %>
<%
    // Récupérer l'ID de l'utilisateur à partir du formulaire
    String userId = request.getParameter("userId");

    // Assurez-vous que l'ID n'est pas nul et est un nombre valide
    if (userId != null && !userId.isEmpty()) {
        int id = Integer.parseInt(userId);

        // Utilisation d'un service ou d'une méthode pour récupérer l'utilisateur en fonction de son ID
        Modele modele = new Modele(); // Assurez-vous que tu as un modèle pour récupérer l'utilisateur
        User user = modele.getUserById(id); // Méthode fictive, adapte selon ton modèle

        // Récupérer l'email et le mot de passe de l'utilisateur
        String userEmail = user.getEmail();
        String userPassword = user.getPassword();

        // Appel de la méthode pour envoyer l'email
        Controleur.envoyerEmail(userEmail, userPassword);

        // Affichage d'un message de confirmation
        out.println("L'email a été envoyé avec succès à " + userEmail);
    } else {
        out.println("ID utilisateur non valide");
    }
%>
