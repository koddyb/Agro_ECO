<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//Destruction de la session en cours
		session.invalid();
		//Redirection vers l'index
		response.sendRedirect(request.getContextPath() + "/vue/auth/login.jsp");
	 %>
</body>
</html>