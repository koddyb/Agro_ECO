<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="controleur.Blog" %>
<%@ page import="controleur.User" %>
<%@ page import="controleur.Controleur" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.nio.file.Paths" %>


<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        // ID de l'utilisateur connecté récupéré via la session
        int userId = (int) session.getAttribute("currentUserId");

        String titre = request.getParameter("titre");
        String contenu = request.getParameter("contenu");
        LocalDate date = LocalDate.now();

        // Gestion de l'upload de l'image
        String imageUrl = null;
        if (request.getPart("image") != null) {
            Part filePart = request.getPart("image");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String uploadPath = getServletContext().getRealPath("") + "/blog/images_b/" + fileName;
            filePart.write(uploadPath);
            imageUrl = "/blog/images_b/" + fileName;
        }
  
        String result = Controleur.addBlog(userId, titre, imageUrl, contenu, date);
        session.setAttribute("result", result);

        response.sendRedirect(request.getContextPath() + "/vue/user_connected/index_user.jsp?redirect=Add_publication");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter une publication</title>
    <link rel="stylesheet" href="../../assets/css/form.css">
</head>
<body>
    <div class="table-data">
        <div class="order">

            <form action="./components/Add_publication.jsp" method="POST" id="form">
                <h3>Ajouter une publication</h3>

                <label for="titre">Titre</label>
                <input type="text" id="titre" name="titre" required>

                <label for="image">Image</label>
                <input type="file" id="image" name="image" accept="image/*" required>

                <label for="contenu">Contenu</label>
                <textarea id="contenu" name="contenu" rows="8" required></textarea>

                <div class="buttons">
                    <button type="reset">Annuler</button>
                    <button type="submit">Ajouter</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
