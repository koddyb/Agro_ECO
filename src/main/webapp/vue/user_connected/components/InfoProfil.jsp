<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="controleur.User" %>
<%@ page import="controleur.Controleur" %>
<%@ page import="java.util.List" %>

<% 


int currentUserId = (int) session.getAttribute("currentUserId");
User user = Controleur.getUserById(currentUserId);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter un utilisateur</title>
    <link rel="stylesheet" href="../../assets/css/form.css">
</head>
<body>
    <div class="table-data">
        <div class="order">

            <form method="POST" action="./components/UpdateUser.jsp">
                <h3>Mes informations</h3>

                <input type="hidden" name="userId" value="<%= user.getIduser() %>" />

                <label for="nom">Nom</label>
                <input type="text" id="nom" name="nom" value="<%= user.getNom() %>" required>

                <label for="prenom">Prénom</label>
                <input type="text" id="prenom" name="prenom" value="<%= user.getFirstName() %>" required>

                <label for="email">Email</label>
                <input type="email" id="email" name="email" value="<%= user.getEmail() %>" required>

                <label for="password">Mot de passe</label>
                <input type="password" id="password" name="password" value="<%= user.getPassword() %>" required>

                <label for="role">Rôle</label>
                <input type="text" id="role" name="role" value="<%= user.getRole() %>" disabled>
 
                <label for="status">Statut</label>
                <input type="text" id="status" name="status" value="<%= user.getStatus() %>" required disabled>

                <div class="buttons">
                    <button type="reset">Annuler</button>
                    <button type="submit">Modifier mes informations</button>
                </div>
            </form>

        </div>
    </div>
</body>
</html>
