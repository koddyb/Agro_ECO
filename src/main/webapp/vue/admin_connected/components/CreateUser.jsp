<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="controleur.Controleur" %>

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
            <h3>Ajouter un nouvel utilisateur</h3>
            <form action="components/CreateUser.jsp" method="POST">
                <label for="nom">Nom</label>
                <input type="text" id="nom" name="nom" required>

                <label for="prenom">Prénom</label>
                <input type="text" id="prenom" name="prenom" required>

                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>

                <label for="password">Mot de passe</label>
                <input type="password" id="password" name="password" required>

                <label for="role">Rôle</label>
                <select id="role" name="role">
                    <option value="admin">Admin</option>
                    <option value="user">Personnel</option>
                </select>

                <input type="text" id="status" name="status" value="new" required hidden>

                <div class="buttons">
                    <button type="reset">Annuler</button>
                    <button type="submit">Ajouter l'utilisateur</button>
                </div>
            </form>
			<%
			    if ("POST".equalsIgnoreCase(request.getMethod())) {
			        String nom = request.getParameter("nom");
			        String prenom = request.getParameter("prenom");
			        String email = request.getParameter("email");
			        String password = request.getParameter("password");
			        String role = request.getParameter("role");
			        String status = request.getParameter("status");
			
			        // Appel à la méthode du contrôleur pour ajouter l'utilisateur
			        String message = Controleur.addUser(nom, prenom, email, password, role, status);
			
			        // Stockage du message dans la session pour le rediriger avec
			        session.setAttribute("message", message);
			
			        // Redirection vers la page de confirmation ou la page appropriée
			        //response.sendRedirect("index_admin.jsp");
			        response.sendRedirect(request.getContextPath() + "/vue/admin_connected/index_admin.jsp?redirect=store");
			%>

                    <div class="message"><%= message %></div>
            <%
                }
            %>
        </div>
    </div>
</body>
</html>
