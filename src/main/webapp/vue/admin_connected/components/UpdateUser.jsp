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
    <link rel="stylesheet" href="../../assets/css/form.css">
    <title>Editer Agro Eco</title>
</head>
<body>
	<style>
	    .form-update {
	        display: flex;
	        justify-content: center;
	        align-items: center;
	        height: 100vh;
	        background-color: #eeeeee;
	        font-family: 'Roboto', sans-serif;
	    }
	
	    .table-data {
	        background-color: #fff;
	        border-radius: 8px;
	        padding: 20px;
	        width: 100%;
	        max-width: 400px;
	        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	    }
	
	    form {
	        display: flex;
	        flex-direction: column;
	        gap: 15px;
	    }
	
	    form div {
	        display: flex;
	        flex-direction: column;
	    }
	
	    label {
	        font-size: 14px;
	        font-weight: 600;
	        margin-bottom: 8px;
	        color: #444;
	    }
	
	    input[type="text"],
	    input[type="email"],
	    input[type="password"],
	    select {
	        padding: 10px;
	        font-size: 14px;
	        border: 1px solid #ccc;
	        border-radius: 5px;
	        transition: border-color 0.3s ease;
	        background-color: #fff;
	    }
	
	    input[type="text"]:focus,
	    input[type="email"]:focus,
	    input[type="password"]:focus,
	    select:focus {
	        border-color: #45a048;
	        outline: none;
	    }
	
	    .buttons {
	        display: flex;
	        justify-content: space-between; 
	        gap: 10px;
	    }
	
	    .buttons button {
	        padding: 8px 16px;
	        background-color: #45a048;
	        color: #fff;
	        border: none;
	        border-radius: 5px;
	        font-size: 16px; 
	        cursor: pointer;
	        transition: background-color 0.3s ease;
	    }
	
	    .buttons button:hover {
	        background-color: #3e8e41;
	    }
	
	    input:disabled,
	    select:disabled {
	        background-color: #e0e0e0;
	        cursor: not-allowed;
	    }
	</style>

    <div class="form-update"> <!-- Div pour centrer le formulaire -->
        <div class="table-data">
        	<div class="order">
        		<h3>Modifier l'utilisateur</h3>
		        <form method="post">
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
					    <select id="role" name="role" required>
					        <option value="admin" <%= user.getRole().equals("admin") ? "selected" : "" %>>Administrateur</option>
					        <option value="user" <%= user.getRole().equals("user") ? "selected" : "" %>>Utilisateur</option>
					    </select>
					</div>
		            <div>
					    <label for="status">Statut</label>
					    <select id="status" name="status" required>
					        <option value="new" <%= user.getStatus().equals("new") ? "selected" : "" %>>Nouveau</option>
					        <option value="suspended" <%= user.getStatus().equals("suspended") ? "selected" : "" %>>Suspendu</option>
					        <option value="confirmed" <%= user.getStatus().equals("confirmed") ? "selected" : "" %>>Confirmé</option>
					    </select>
					</div>
		           	<div class="buttons">
		                <a href="javascript:history.back();" style="
			                    display: inline-block;
			                    padding: 8px 16px;
			                    background-color: #45a048;
			                    color: white;
			                    text-decoration: none;
			                    border-radius: 5px;
			                    text-align: center;
			                    transition: background-color 0.3s ease;
		                	">Annuler</a>
		                <button type="submit">Mettre à jour</button>
		            </div>
		        </form>
		        <!-- Bloc JSP pour traiter la requête POST -->
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

