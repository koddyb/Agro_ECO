<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="controleur.User" %>
<%@ page import="controleur.Controleur" %>

<%
    // ID de l'utilisateur connecté récupéré via la session
    int currentUserId = (int) session.getAttribute("currentUserId");
    List<User> users = Controleur.getAllUsersExcept(currentUserId);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="../../assets/css/index_admin.css">
    <title>Liste des utilisateurs</title>
</head>
<body>
    <div class="table-data">
		<div class="order">
			<div class="head">
				<h3>Liste des utilisateurs</h3>
				<i class='bx bx-search' ></i>
				<i class='bx bx-filter' ></i>
			</div>
			<table>
				<thead>
					<tr>
						<th></th>
						<th>Nom</th>
						<th>Prénom</th>
						<th>Email</th>
						<th>Role</th>
						<th>Date de creat.</th>
					</tr>
				</thead>
				<tbody>
					<%
	                	for (User user : users) {
	            	%>
					<tr>
						<td>
							<img src="../../assets/img/icon/icone-person.png">
						</td>
						<td><%= user.getNom() %></td>
						<td><%= user.getFirstName() %></td>
						<td><%= user.getEmail() %></td>
						<td><%= user.getRole() %></td>
						<td><%= user.getCreatedAt() %></td>
						<td>
						    <form action="components/UpdateUser.jsp" method="get" style="display: inline;">
						        <input type="hidden" name="userId" value="<%= user.getIduser() %>" />
						        <button type="submit" style="all: unset;">
						            <img src="../../assets/img/icon/editer.png" alt="Modifier">
						        </button>
						    </form>
						</td>
						<td>
						    <form action="components/DeleteUser.jsp" method="post" style="display: inline;">
						        <input type="hidden" name="userId" value="<%= user.getIduser() %>" />
						        <button type="submit" style="all: unset;">
						            <img src="../../assets/img/icon/supprimer.png" alt="Supprimer">
						        </button>
						    </form>
						</td>
						<td><button type="submit" style="all: unset;"><img src="../../assets/img/icon/prevenir.png"></button></td>
					</tr>
					 <%
			         	}
			         %>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>