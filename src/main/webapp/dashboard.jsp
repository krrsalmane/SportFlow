<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="sportflow.Entraineur.Model.Entraineur,java.util.List,java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>SportFlow - Manage Entraineurs</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(135deg, rgba(0, 0, 0, 0.7), rgba(52, 73, 94, 0.7)),
      url('https://source.unsplash.com/1600x900/?gym,sports') no-repeat center center fixed;
      background-size: cover;
      color: #ffffff;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
    }
    .navbar {
      background: linear-gradient(to right, #2c3e50, #34495e);
      padding: 1rem 2rem;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
      position: fixed;
      top: 0;
      width: 100%;
      z-index: 10;
    }
    .navbar-brand {
      font-size: 2rem;
      font-weight: 800;
      color: #e74c3c !important;
      display: flex;
      align-items: center;
    }
    .navbar-brand i { margin-right: 0.5rem; font-size: 1.8rem; }
    .nav-link {
      color: white !important;
      font-weight: 600;
      padding: 0.5rem 1rem;
      transition: color 0.3s;
    }
    .nav-link:hover { color: #e74c3c !important; }
    .content-section {
      margin-top: 100px; /* Offset for fixed navbar */
      padding: 4rem 0;
    }
    .coach-list {
      background: rgba(44, 62, 80, 0.9);
      border: 2px solid #e74c3c;
      border-radius: 20px;
      padding: 2rem;
      box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
    }
    .coach-item {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 1rem;
      border-bottom: 1px solid #e74c3c;
      transition: background-color 0.3s;
    }
    .coach-item:hover { background-color: rgba(231, 76, 60, 0.1); }
    .coach-item:last-child { border-bottom: none; }
    .btn-book {
      background-color: #e74c3c;
      border: none;
      padding: 8px 20px;
      font-weight: 600;
      border-radius: 10px;
      transition: background-color 0.3s, transform 0.3s;
    }
    .btn-book:hover {
      background-color: #c0392b;
      transform: scale(1.05);
    }
    footer {
      background: linear-gradient(to right, #2c3e50, #34495e);
      color: white;
      padding: 2rem 0;
      text-align: center;
      font-weight: 500;
      margin-top: auto;
    }
    footer i { color: #e74c3c; margin-left: 0.5rem; }
    footer a { color: #e74c3c; text-decoration: none; }
    footer a:hover { color: #c0392b; }
  </style>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
  <div class="container">
    <a class="navbar-brand" href="index.jsp"><i class="fas fa-dumbbell"></i>SportFlow Admin</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link" href="MemberServlet">Manage Members</a></li>
        <li class="nav-item"><a class="nav-link" href="manageEntraineurs.jsp">Manage Entraineurs</a></li>
        <li class="nav-item"><a class="nav-link" href="manageSeances.jsp">Manage Séances</a></li>
        <li class="nav-item"><a class="nav-link" href="Logout">Logout</a></li>
      </ul>
    </div>
  </div>
</nav>

<!-- Main Content -->
<div class="content-section">
  <div class="container">
    <h1 class="text-center mb-5" style="color: #e74c3c; font-weight: 800;">Manage Entraineurs</h1>
    <div class="coach-list">
      <h2 class="text-center mb-4" style="color: #e74c3c; font-weight: 700;">Recently Added Coaches</h2>
      <%
        List<Entraineur> entraineurs = (List<Entraineur>) session.getAttribute("entraineurs");
        if (entraineurs == null) {
          entraineurs = new ArrayList<>();
          session.setAttribute("entraineurs", entraineurs);
        }
        if (!entraineurs.isEmpty()) {
          for (Entraineur entraineur : entraineurs) {
      %>
      <div class="coach-item">
        <div>
          <span style="font-weight: 600; color: #e74c3c;"><%= entraineur.getName() %></span>
          - <span style="color: #d1d4d7;"><%= entraineur.getSpecialty() %></span>
        </div>
        <form action="<%=request.getContextPath()%>/createSeance.jsp" method="get">
          <input type="hidden" name="idEntraineur" value="<%= entraineur.getId() %>">
          <button type="submit" class="btn btn-book">Book</button>
        </form>
      </div>
      <%
        }
      } else {
      %>
      <p class="text-center" style="color: #d1d4d7;">No coaches added yet.</p>
      <%
        }
      %>
    </div>
  </div>
</div>

<!-- Footer -->
<footer>
  <div class="container">
    <p>© 2025 SportFlow. Created by <span class="font-weight-bold">Lahcen Ait Maskour</span>.
      Images by <a href="https://unsplash.com">Unsplash</a>.<i class="fas fa-trophy"></i></p>
  </div>
</footer>

<!-- Security Check -->
<%
  HttpSession sessionCheck = request.getSession(false);
  if (sessionCheck == null || sessionCheck.getAttribute("user") == null || !"admin".equals(sessionCheck.getAttribute("user"))) {
    response.sendRedirect("login.jsp");
  }
%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>