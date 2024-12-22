<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="controleur.User" %>
<%@ page import="controleur.Controleur" %>

<%
    // Récupérer le paramètre de recherche
    String query = request.getParameter("query");
    List<User> search = null;

    if (query != null && !query.trim().isEmpty()) {
        search = Controleur.searchUsers(query);
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Résultats de recherche</title>
    <link rel="stylesheet" href="../../assets/css/index_admin.css">
</head>
<body>
    <section id="content">
        <nav>
            <a href="${pageContext.request.contextPath}/vue/admin_connected/index_admin.jsp">Retour à l'administration</a>
        </nav>
        
        <main>
            <div class="head-title">
                <h1>Résultats de la recherche</h1>
            </div>
            
            <% if (search != null && !search.isEmpty()) { %>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nom</th>
                            <th>Prénom</th>
                            <th>Email</th>
                            <th>Rôle</th>
                            <th>Status</th>
                            <th>Date de création</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (User user : search) { %>
                            <tr>
                                <td><%= user.getIduser() %></td>
                                <td><%= user.getNom() %></td>
                                <td><%= user.getFirstName() %></td>
                                <td><%= user.getEmail() %></td>
                                <td><%= user.getRole() %></td>
                                <td><%= user.getStatus() %></td>
                                <td><%= user.getCreatedAt() %></td>
                                <td>
								    <form action="UpdateUser.jsp" method="get" style="display: inline;">
								        <input type="hidden" name="userId" value="<%= user.getIduser() %>" />
								        <button type="submit" style="all: unset;">
								            <img src="../../assets/img/icon/editer.png" alt="Modifier">
								        </button>
								    </form>
								</td>
								<td>
								    <form action="DeleteUser.jsp" method="post" style="display: inline;">
								        <input type="hidden" name="userId" value="<%= user.getIduser() %>" />
								        <button type="submit" style="all: unset;">
								            <img src="../../assets/img/icon/supprimer.png" alt="Supprimer">
								        </button>
								    </form>
								</td>
								<td><button type="submit" style="all: unset;"><img src="../../assets/img/icon/prevenir.png"></button></td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            <% } else { %>
                <p>Aucun utilisateur trouvé pour "<%= query %>".</p>
            <% } %>
        </main>
    </section>
</body>
</html>
