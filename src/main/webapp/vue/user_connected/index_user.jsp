
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="controleur.User" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agro Eco</title>
</head>
<body>

    <%
        // Récupérer l'utilisateur connecté depuis la session
        User connectedUser = (User) session.getAttribute("user");

        if (connectedUser != null) {
    %>
        <h1>Bienvenue, <%= connectedUser.getNom() %></h1>
        <p>Vous êtes connecté en tant qu'Utilisateur.</p>
    <% } else { %>
        <p>Veuillez vous connecter.</p>
    <% } %>

    <p>Voici le tableau de bord de l'utilisateur.</p>

</body>
</html>
