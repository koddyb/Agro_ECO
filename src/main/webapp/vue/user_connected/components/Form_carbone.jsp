<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="controleur.EmpreinteCarbone" %>
<%@ page import="controleur.User" %>
<%@ page import="controleur.Controleur" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.LocalDate" %>

<%
                    if ("POST".equalsIgnoreCase(request.getMethod())) {
                        // ID de l'utilisateur connecté récupéré via la session
                        int UserId = (int) session.getAttribute("currentUserId");

                        int typeEmission = Integer.parseInt(request.getParameter("type_emission"));
                        float carbonEmission = Float.parseFloat(request.getParameter("carbon_emission"));
                        LocalDate measurementDate = LocalDate.parse(request.getParameter("measurement_date"));

                        String result = Controleur.insertEmpreinteCarbone(UserId, typeEmission, carbonEmission, measurementDate);
                        session.setAttribute("result", result);
                        
                        response.sendRedirect(request.getContextPath() + "/vue/user_connected/index_user.jsp");

                    }
                %>
            

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter les parametres de l'empreinte carbone</title>
    <link rel="stylesheet" href="../../assets/css/form.css">
</head>
<body>
    <div class="table-data">
        <div class="order">

            <form action="./components/Form_carbone.jsp" method="POST" id="from">
                <h3>Parametres de l'empreinte carbone</h3>

                <label for="type_emission">Type d'émission</label>
                <select id="type_emission" name="type_emission" required>
                    <option value="">Choisir un type d'émission...</option>
                    <%
                        List<String[]> typesEmissions = Controleur.getTypesEmission();
                        for (String[] type : typesEmissions) {
                    %>
                        <option value="<%= type[0] %>"><%= type[1] %></option>
                    <%
                        }
                    %>
                </select>

                <label for="carbon_emission">Émission de carbone (en kg)</label>
                <input type="number" id="carbon_emission" name="carbon_emission" step="0.01" required>

                <label for="measurement_date">Date de mesure</label>
                <input type="date" id="measurement_date" name="measurement_date" required>

                <div class="buttons">
                    <button type="reset">Annuler</button>
                    <button type="submit">Ajouter</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
