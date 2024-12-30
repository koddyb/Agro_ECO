<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="controleur.Blog" %>
<%@ page import="controleur.Controleur" %>
<%@ page import="javax.servlet.http.Part" %>
<%@ page import="java.io.File" %>
<%@ page import="java.nio.file.Paths" %>
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
            <% 
                // Récupérer les données du formulaire si la requête est en POST
                String titre = request.getParameter("titre");
                String contenu = request.getParameter("contenu");
                String imageUrl = null;

                // Vérifier si le formulaire a été soumis
                if ("POST".equalsIgnoreCase(request.getMethod())) {
                    try {
                        // Récupérer le fichier image
                        Part imagePart = request.getPart("image"); // Récupérer le fichier image
                        if (imagePart != null) {
                            String fileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString(); // Nom du fichier
                            String uploadDir = getServletContext().getRealPath("blog/uploads"); // Dossier où enregistrer l'image
                            File uploadFile = new File(uploadDir, fileName);

                            // Si le dossier n'existe pas, on le crée
                            if (!uploadFile.exists()) {
                                uploadFile.getParentFile().mkdirs();
                            }

                            // Sauvegarder l'image sur le serveur
                            imagePart.write(uploadFile.getAbsolutePath());

                            // URL relative à la base de données (chemin vers le fichier)
                            imageUrl = "blog/uploads/" + fileName;
                        }

                        // Créer l'objet Blog avec les données du formulaire
                        Blog blog = new Blog(titre, imageUrl, contenu, LocalDate.now());

                        // Appeler le contrôleur pour ajouter le blog
                        boolean success = Controleur.ajouterBlog(titre, imageUrl, contenu, 1); // Utilise l'ID utilisateur ici (1 par exemple)

                        if (success) {
                            out.println("<h3>Publication ajoutée avec succès !</h3>");
                        } else {
                            out.println("<h3>Erreur lors de l'ajout de la publication.</h3>");
                        }
                    } catch (Exception e) {
                        out.println("<h3>Erreur : " + e.getMessage() + "</h3>");
                    }
                }
            %>

            <!-- Formulaire d'ajout de publication -->
            <form action="Add_publication.jsp" method="POST" enctype="multipart/form-data" id="form">
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
