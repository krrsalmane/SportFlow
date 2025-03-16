<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Connexion Entraîneur</title>
</head>
<body>
<h2>Connexion Entraîneur</h2>
<form method="post" action="entraineurLogin">
    Email: <input type="email" name="email" required><br>
    Mot de passe: <input type="password" name="password" required><br>
    <input type="submit" value="Se connecter">
</form>

<% String error = (String) request.getAttribute("errorMessage");
    if (error != null) { %>
<p style="color:red;"><%= error %></p>
<% } %>
</body>
</html>
