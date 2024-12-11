<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List" %>
<%@ page import="controleur.User" %>
<%@ page import="controleur.Controleur" %>

<%
    int localCurrentUserId = (int) session.getAttribute("currentUserId");
    List<User> localUsers = Controleur.getAllUsersExcept(localCurrentUserId);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<main>
			<div class="head-title">
				<div class="left">
					<h1>Statistiques</h1>
					<ul class="breadcrumb">
						<li>
							<a href="#">Dashboard</a>
						</li>
						<li><i class='bx bx-chevron-right' ></i></li>
						<li>
							<a class="active" href="#">Stats</a>
						</li>
					</ul>
				</div>
				<!--<a href="#" class="btn-download">
					<i class='bx bxs-cloud-download' ></i>
					<span class="text">Download PDF</span>
				</a>-->
			</div>

			<ul class="box-info">
				<li>
					<i class='bx bxs-calendar-check' ></i>
					<span class="text">
						<h3>1020</h3>
						<p>New Order</p>
					</span>
				</li>
				<li>
					<i class='bx bxs-group' ></i>
					<span class="text">
						<h3>2834</h3>
						<p>Visitors</p>
					</span>
				</li>
				<li>
					<i class='bx bxs-dollar-circle' ></i>
					<span class="text">
						<h3>$2543</h3>
						<p>Total Sales</p>
					</span>
				</li>
			</ul>


			<div class="table-data">
				<div class="order">
					<div class="head">
						<h3>Suivi des utilisateurs</h3>
						<i class='bx bx-search' ></i>
						<i class='bx bx-filter' ></i>
					</div>
					<table>
					    <thead>
					        <tr>
					            <th>Utilisateur</th>
					            <th>Date de créat.</th>
					            <th>Status</th>
					        </tr>
					    </thead>
					    <tbody>
					        <%
					            for (User user : localUsers) {
					                String statusClass = "";
					                String statusText = "";
					                switch (user.getStatus()) {
					                    case "new":
					                        statusClass = "status process";
					                        statusText = "nouveau";
					                        break;
					                    case "confirmed":
					                        statusClass = "status completed";
					                        statusText = "confirmé";
					                        break;
					                    case "suspended":
					                        statusClass = "status pending";
					                        statusText = "suspendu";
					                        break;
					                }
					        %>
					        <tr>
					            <td>
					                <img src="../../assets/img/icon/icone-person.png">
					                <p><%= user.getFirstName() %> <%= user.getNom() %></p>
					            </td>
					            <td><%= user.getCreatedAt() %></td>
					            <td><span class="<%= statusClass %>"><%= statusText %></span></td>
					        </tr>
					        <%
					            }
					        %>
					    </tbody>
					</table>	
				</div>
				<div class="todo">
					<div class="head">
						<h3>Objectifs</h3>
						<i class='bx bx-plus' ></i>
						<i class='bx bx-filter' ></i>
					</div>
					<ul class="todo-list">
						<li class="completed">
							<p>Todo List</p>
							<i class='bx bx-dots-vertical-rounded' ></i>
						</li>
						<li class="completed">
							<p>Todo List</p>
							<i class='bx bx-dots-vertical-rounded' ></i>
						</li>
						<li class="not-completed">
							<p>Todo List</p>
							<i class='bx bx-dots-vertical-rounded' ></i>
						</li>
						<li class="completed">
							<p>Todo List</p>
							<i class='bx bx-dots-vertical-rounded' ></i>
						</li>
						<li class="not-completed">
							<p>Todo List</p>
							<i class='bx bx-dots-vertical-rounded' ></i>
						</li>
					</ul>
				</div>
			</div>
		</main>
</body>
</html>