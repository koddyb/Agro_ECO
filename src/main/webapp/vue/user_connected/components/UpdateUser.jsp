<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="controleur.User" %>
<%@ page import="controleur.Controleur" %>
<%@ page import="java.util.List" %>

<%          
if ("POST".equalsIgnoreCase(request.getMethod())) {
// ID de l'utilisateur connectÃ© rÃ©cupÃ©rÃ© via la session
//int UserIdi = (int) session.getAttribute("currentUserId");
int UserIdi = Integer.parseInt(request.getParameter("userId"));

String nom = request.getParameter("nom");
String prenom = request.getParameter("prenom");
String email = request.getParameter("email");
String password = request.getParameter("password");
String role = request.getParameter("role");
String status = request.getParameter("status");

// Appel Ã  la mÃ©thode du contrÃ´leur pour ajouter l'utilisateur
String message = Controleur.updateUser(UserIdi, nom, prenom, email, password, role, status);

// Stockage du message dans la session pour le rediriger avec
session.setAttribute("message", message);

// Redirection vers la page de confirmation ou la page appropriÃ©e
//response.sendRedirect("index_admin.jsp");
response.sendRedirect(request.getContextPath() + "/vue/user_connected/index_user.jsp?redirect=profil");

} %> 