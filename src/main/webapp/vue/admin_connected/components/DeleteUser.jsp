<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="controleur.Controleur" %>

<%  
   
    int userId = Integer.parseInt(request.getParameter("userId"));
    boolean isDeleted = Controleur.deleteUser(userId);

    if (isDeleted) {
        // Redirection vers la page des utilisateurs après suppression
    	response.sendRedirect(request.getContextPath() + "/vue/admin_connected/index_admin.jsp?redirect=store");
    } else {
        out.println("<script>alert('Erreur lors de la suppression de l\\'utilisateur.'); window.location = 'ReadUser.jsp';</script>");
    }
%>
