<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="controleur.User" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
	
	<title>Agro Eco • Admin</title>
	
	<link rel="stylesheet" href="../../assets/css/index_admin.css">
	
	<style>
		.hidden {
			display: none;
		}
	</style>
</head>
<body>
	<section id="sidebar">
		<a href="#" class="brand">
			<i class='bx bxs-smile'></i>
			<span class="text">Agro Eco</span>
		</a>
		<ul class="side-menu top">
			<li class="active">
				<a href="#" onclick="showSection('dashboard')">
					<i class='bx bxs-dashboard' ></i>
					<span class="text">Dashboard</span>
				</a>
			</li>
			<li>
				<a href="#" onclick="showSection('addUser')">
					<i class='bx bxs-user-plus' ></i>
					<span class="text">Ajouter un utilisateur</span>
				</a>
			</li>
			<li>
				<a href="#" onclick="showSection('readUser')">
					<i class='bx bxs-group' ></i>
					<span class="text">Liste des utilisateurs</span>
				</a>
			</li>
			<li>
				<a href="#" onclick="showSection('statistiques')">
					<i class='bx bxs-bar-chart-alt-2' ></i>
					<span class="text">Statistique</span>
				</a>
			</li>
			<li>
				<a href="#" onclick="showSection('historique')">
					<i class='bx bx-history' ></i>
					<span class="text">Historique</span>
				</a>
			</li>
		</ul>
		<ul class="side-menu">
			<!--<li>
				<a href="#" onclick="showSection('settings')">
					<i class='bx bxs-cog' ></i>
					<span class="text">Settings</span>
				</a>
			</li>-->
			
			<li>
			    <a href="logout.jsp" class="logout">
			        <i class='bx bxs-log-out-circle'></i>
			        <span class="text">Logout</span>
			    </a>
			</li>
		</ul>
	</section>

	<section id="content">
	
		<nav>
			<i class='bx bx-menu' id="icon-toggler"></i>
			<a href="#" class="nav-link" id="resizing">Agrandir</a>
			<form action="#">
				<div class="form-input">
					<input type="search" placeholder="Search...">
					<button type="submit" class="search-btn"><i class='bx bx-search' ></i></button>
				</div>
			</form>
			<input type="checkbox" id="switch-mode" hidden>
			<label for="switch-mode" class="switch-mode"></label>
			<a href="#" class="notification">
				<i class='bx bxs-bell' ></i>
				<span class="num">8</span>
			</a>
			<a href="#" class="profile">
				<img src="../../assets/img/icon/icone-person.png">
			</a>
		</nav>

		<main>
			<div id="dashboard" class="section">
				<div class="head-title">
					<h1>Dashboard</h1>
				</div>
				<p>Welcome to the dashboard!</p>
			</div>

			<div id="addUser" class="section hidden">
				<%@ include file="components/CreateUser.jsp" %>
			</div>
			
			<div id="readUser" class="section hidden">
				 <%@ include file="components/ReadUser.jsp" %>	
			</div>

			<div id="statistiques" class="section hidden">
				<%@ include file="components/statistiques.jsp" %>
			</div>

			<div id="historique" class="section hidden">
				<h1>Hello worlds</h1>
				<p>L'historiques sera ici</p>
			</div>

			<!--<div id="settings" class="section hidden">
				<h1>Settings</h1>
				<p>Manage your settings here.</p>
			</div>-->
		</main>
	</section>
	
	<script src="../../assets/js/dashboard.js"></script>
	<script src="../../assets/js/dynamicDashboard.js"></script>

</body>
</html>
	
</body>
</html>
