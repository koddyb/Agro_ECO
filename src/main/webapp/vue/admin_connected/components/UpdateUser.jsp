<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="controleur.User" %>
<%@ page import="controleur.Controleur" %>
<%@ page import="java.sql.ResultSet" %>

<%	
	

    // On récupère l'ID de l'utilisateur à modifier
    int userId = Integer.parseInt(request.getParameter("userId"));
    
    // On récupère les informations de l'utilisateur par son ID
    User user = Controleur.getUserById(userId);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="../../../assets/css/index_admin.css">
    <title>Modifier l'utilisateur</title>
</head>
<body>
    <div class="form-container">
        <div class="table-data">
        	<div class="order">
        		<h3>Modifier l'utilisateur</h3>
		        <form  method="post">
		            <input type="hidden" name="userIduser" value="<%= user.getIduser() %>" />
		            <div>
		                <label for="name">Nom</label>
		                <input type="text" id="name" name="name" value="<%= user.getNom() %>" required />
		            </div>
		            <div>
		                <label for="firstName">Prénom</label>
		                <input type="text" id="firstName" name="firstName" value="<%= user.getFirstName() %>" required />
		            </div>
		            <div>
		                <label for="email">Email</label>
		                <input type="email" id="email" name="email" value="<%= user.getEmail() %>" required />
		            </div>
		            <div>
		                <label for="password">Mot de passe</label>
		                <input type="password" id="password" name="password" value="<%= user.getPassword() %>" required />
		            </div>
		            <div>
		                <label for="role">Rôle</label>
		                <input type="text" id="role" name="role" value="<%= user.getRole() %>" required />
		            </div>
		            <div>
		                <label for="status">Statut</label>
		                <input type="text" id="status" name="status" value="<%= user.getStatus() %>" required />
		            </div>
		            <button type="submit">Mettre à jour</button>
		        </form>
		        <%
				    if ("POST".equalsIgnoreCase(request.getMethod())) {
				        String name = request.getParameter("name");
				        String firstName = request.getParameter("firstName");
				        String email = request.getParameter("email");
				        String password = request.getParameter("password");
				        String role = request.getParameter("role");
				        String status = request.getParameter("status");
				        int userIduser = Integer.parseInt(request.getParameter("userIduser"));
				        
				        // Appel à la méthode du contrôleur pour mettre à jour l'utilisateur
				        String message = Controleur.updateUser(userId, name, firstName, email, password, role, status);
				        
				        // On stocke le message dans la session pour l'afficher après la redirection
				        session.setAttribute("message", message);
				        
				        // Redirection vers la page appropriée
				        response.sendRedirect(request.getContextPath() + "/vue/admin_connected/index_admin.jsp?redirect=addUser");
				    }
				%>
        	</div>
        </div>
    </div>
</body>
</html>

