<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List" %>
<%@ page import="controleur.EmpreinteCarbone" %>
<%@ page import="controleur.Controleur" %>

<%

    int localCurrentUserId = (int) session.getAttribute("currentUserId");
    List<EmpreinteCarbone> empreintes = Controleur.getAllEmpreinteCarbone(localCurrentUserId);
    List<String[]> typesEmission = Controleur.getTypesEmission();
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
                    <h1>Statistiques sur les catégories</h1>
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
                    <i class='bx bx-water'></i>
                    <span class="text">
                        <h3>1020 kg</h3>
                        <p>emmision indirecte liées à l'energie</p>
                    </span>
                </li>
                <li>
                    <i class='bx bx-poll'></i>
                    <span class="text">
                        <h3>2834 kg</h3>
                        <p>Autres Emmisions indirecte</p>
                    </span>
                </li>
<!--                 <li>
                    <i class='bx bxs-dollar-circle' ></i>
                    <span class="text">
                        <h3>$2543</h3>
                        <p>Total Sales</p>
                    </span>
                </li> -->
            </ul>


            <div class="table-data">
                <div class="order">
                    <div class="head">
                        <h3>Differentes emissions</h3>
                        <i class='bx bx-search' ></i>
                        <i class='bx bx-filter' ></i>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>Utilisateur</th>
                                <th>Type d'émission</th>
                                <th><strong>Émission carbone en (kg)</th></strong>
                                <th>Date de mesure</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (EmpreinteCarbone empreinte : empreintes) {
                                    String typeEmissionName = "";
                                    for (String[] type : typesEmission) {
                                        if (Integer.parseInt(type[0]) == empreinte.getType_emission()) {
                                            typeEmissionName = type[1];
                                            break;
                                        }
                                    }
                            %>
                            <tr>
                                <td><%= empreinte.getUserId() %></td>
                                <td><%= typeEmissionName %></td>
                                <td><%= empreinte.getCarbon_emission() %></td>
                                <td><%= empreinte.getDate() %></td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>	
                </div>
            </div>
        </main>
</body>
</html>
