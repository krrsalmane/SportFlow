<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Session - SportFlow</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #e9ecef;
            overflow-x: hidden;
        }
        .navbar {
            background: linear-gradient(to right, #2c3e50, #34495e);
            padding: 1rem 2rem;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
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
        .card {
            border: none;
            border-radius: 20px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
            background-color: white;
            margin-top: 3rem;
            transition: transform 0.3s;
        }
        .card-header {
            background: #e74c3c;
            color: white;
            border-radius: 20px 20px 0 0;
            padding: 1.5rem;
            font-weight: 700;
            text-align: center;
        }
        .form-label {
            font-weight: 500;
            color: #2c3e50;
        }
        .form-control {
            border-radius: 8px;
            border: 1px solid #34495e;
            transition: border-color 0.3s;
        }
        .form-control:focus {
            border-color: #e74c3c;
            box-shadow: 0 0 5px rgba(231, 76, 60, 0.5);
        }
        .btn-primary {
            background-color: #e74c3c;
            border: none;
            padding: 12px;
            font-weight: 600;
            border-radius: 10px;
            transition: background-color 0.3s, transform 0.3s;
        }
        .btn-primary:hover {
            background-color: #c0392b;
            transform: scale(1.05);
        }
        footer {
            background: linear-gradient(to right, #2c3e50, #34495e);
            color: white;
            padding: 2rem 0;
            text-align: center;
            font-weight: 500;
            margin-top: 3rem;
        }
        footer i { color: #e74c3c; margin-left: 0.5rem; }
    </style>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="index.jsp"><i class="fas fa-dumbbell"></i>SportFlow</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="createMember.jsp"><i class="fas fa-user-plus me-1"></i>Add Member</a></li>
                <li class="nav-item"><a class="nav-link" href="createEntraineur.jsp"><i class="fas fa-user-tie me-1"></i>Add Coach</a></li>
                <li class="nav-item"><a class="nav-link" href="createSeance.jsp"><i class="fas fa-calendar-check me-1"></i>Add Session</a></li>
                <li class="nav-item"><a class="nav-link" href="ListSeances"><i class="fas fa-list me-1"></i>Sessions</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Form -->
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">Schedule New Session</div>
                <div class="card-body">
                    <% if(request.getAttribute("error") != null) { %>
                    <div class="alert alert-danger">
                        <%= request.getAttribute("error") %>
                    </div>
                    <% } %>
                    <form action="createSeance" method="post">
                        <input type="hidden" name="action" value="create">
                        <div class="mb-3">
                            <label for="idMembre" class="form-label">Member ID</label>
                            <input type="number" class="form-control" id="idMembre" name="idMembre" required>
                        </div>
                        <div class="mb-3">
                            <label for="idEntraineur" class="form-label">Coach ID</label>
                            <input type="number" class="form-control" id="idEntraineur" name="idEntraineur" required>
                        </div>
                        <div class="mb-3">
                            <label for="dateHeure" class="form-label">Date and Time</label>
                            <input type="datetime-local" class="form-control" id="dateHeure" name="dateHeure" required>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Schedule Session</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer>
    <div class="container">
        <p>© 2025 SportFlow. Built for Champions.<i class="fas fa-trophy"></i></p>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>