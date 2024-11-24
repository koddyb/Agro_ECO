<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion • Agro Eco</title>
    <link rel="shortcut icon" type="image/x-icon" href="../../assets/img/favicon.ico">
    <link rel="stylesheet" href="../../assets/css/login.css">
    <%@ include file="../../components/liens.jsp" %>
</head>
<body>
    <div class="login-container">
        <form class="login-form">
            <div class="login-header">
                <h1>Connexion</h1>
                <a href="../../index.jsp"> <img src="../../assets/img/logo/loder.png" width="40px" height="40px" alt="Login Icon" class="login-icon"> </a>
            </div>
            <label for="email">Identifiant</label>
            <input type="text" id="email" name="email" placeholder="Entrez votre email" required>
            
            <label for="password">Mot de passe</label>
            <input type="password" id="password" name="password" placeholder="Entrez votre mot de passe" required>
            
            <button type="submit">Se connecter</button>
        </form>
    </div>
</body>
</html>
