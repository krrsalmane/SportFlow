<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SportFlow - Admin Dashboard</title>
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
        .hero-section {
            text-align: center;
            padding: 6rem 0 4rem;
            margin-top: 80px; /* Offset for fixed navbar */
        }
        .hero-text h1 {
            font-size: 4rem;
            font-weight: 800;
            color: #e74c3c;
            text-shadow: 3px 3px 15px rgba(0, 0, 0, 0.5);
            animation: fadeInDown 1s ease-in-out;
        }
        .hero-text p {
            font-size: 1.5rem;
            color: #ffffff;
            margin: 1.5rem 0;
            animation: fadeInUp 1.2s ease-in-out;
        }
        @keyframes fadeInDown {
            0% { opacity: 0; transform: translateY(-20px); }
            100% { opacity: 1; transform: translateY(0); }
        }
        @keyframes fadeInUp {
            0% { opacity: 0; transform: translateY(20px); }
            100% { opacity: 1; transform: translateY(0); }
        }
        .card {
            background: rgba(44, 62, 80, 0.9);
            border: 2px solid #e74c3c;
            border-radius: 20px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .card:hover {
            transform: scale(1.05) rotate(1deg);
            box-shadow: 0 10px 30px rgba(231, 76, 60, 0.5);
        }
        .card img {
            border-radius: 15px;
            height: 200px;
            object-fit: cover;
        }
        .card-title {
            font-size: 1.75rem;
            font-weight: 700;
            color: #e74c3c;
        }
        .card-text {
            color: #d1d4d7;
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
                <li class="nav-item"><a class="nav-link" href="ListMembers.jsp"> Members List</a></li>
                <li class="nav-item"><a class="nav-link" href="createSeance.jsp">Dashbord</a></li>
                <li class="nav-item"><a class="nav-link" href=""> Entraineurs List</a></li>
                <li class="nav-item"><a class="nav-link" href="ListSeances.jsp">Manage Séances</a></li>
                <li class="nav-item"><a class="nav-link" href="Logout">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Main Body -->
<main class="flex-grow">
    <!-- Hero Section -->
    <div class="hero-section">
        <div class="hero-text">
            <h1>Welcome, Admin!</h1>
            <p>Control and optimize your SportFlow system with ease.</p>
        </div>
    </div>

    <!-- Cards Section -->
    <div class="container mb-5">
        <div class="row justify-content-center g-4">
            <!-- Manage Members Card -->
            <div class="col-md-4">
                <a href="./MemberServlet" class="card text-decoration-none">
                    <img src="https://images.unsplash.com/photo-1517836357463-d25dfeac3438?q=80&w=2070&auto=format&fit=crop"
                         alt="Members" class="card-img-top">
                    <div class="card-body text-center">
                        <h3 class="card-title">Manage Members</h3>
                        <p class="card-text">Add, edit, or remove gym members.</p>
                    </div>
                </a>
            </div>
            <!-- Manage Entraineurs Card -->
            <div class="col-md-4">
                <a href="EntraineurServlet" class="card text-decoration-none">
                    <img src="https://images.unsplash.com/photo-1593079831268-3381b0db4a77?q=80&w=2069&auto=format&fit=crop"
                         alt="Entraineurs" class="card-img-top">
                    <div class="card-body text-center">
                        <h3 class="card-title">Manage Entraineurs</h3>
                        <p class="card-text">Oversee trainers and their schedules.</p>
                    </div>
                </a>
            </div>
            <!-- Manage Séances Card -->
            <div class="col-md-4">
                <a href="manageSeances.jsp" class="card text-decoration-none">
                    <img src="https://images.unsplash.com/photo-1607962837359-5e7e89f86776?q=80&w=2070&auto=format&fit=crop"
                         alt="Séances" class="card-img-top">
                    <div class="card-body text-center">
                        <h3 class="card-title">Manage Séances</h3>
                        <p class="card-text">Schedule and manage gym sessions.</p>
                    </div>
                </a>
            </div>
        </div>
    </div>
</main>

<!-- Footer -->
<footer>
    <div class="container">
        <p>© 2025 SportFlow. Created by <span class="font-weight-bold">Krr Salmane</span>.
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