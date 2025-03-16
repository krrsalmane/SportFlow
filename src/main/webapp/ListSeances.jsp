<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="sportflow.Seance.Model.Seance" %>
<%@ page import="sportflow.Seance.DAO.SeanceDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sessions - SportFlow</title>
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
        .btn-primary {
            background-color: #e74c3c;
            border: none;
            padding: 8px 16px;
            font-weight: 600;
            border-radius: 10px;
            transition: background-color 0.3s, transform 0.3s;
        }
        .btn-primary:hover {
            background-color: #c0392b;
            transform: scale(1.05);
        }
        .btn-warning {
            background-color: #f39c12;
            border: none;
            padding: 8px 16px;
            font-weight: 600;
            border-radius: 10px;
            transition: background-color 0.3s, transform 0.3s;
        }
        .btn-warning:hover {
            background-color: #d35400;
            transform: scale(1.05);
        }
        .btn-danger {
            background-color: #c0392b;
            border: none;
            padding: 8px 16px;
            font-weight: 600;
            border-radius: 10px;
            transition: background-color 0.3s, transform 0.3s;
        }
        .btn-danger:hover {
            background-color: #922b21;
            transform: scale(1.05);
        }
        .session-card {
            border: none;
            border-radius: 15px;
            margin-bottom: 20px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
        }
        .session-card:hover {
            transform: translateY(-5px);
        }
        .session-header {
            background: linear-gradient(to right, #3498db, #2980b9);
            color: white;
            border-radius: 15px 15px 0 0;
            padding: 15px;
        }
        .session-body {
            padding: 20px;
        }
        .session-info {
            margin-bottom: 15px;
        }
        .session-info i {
            color: #e74c3c;
            margin-right: 10px;
            width: 20px;
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
        .alert {
            border-radius: 10px;
            margin-top: 20px;
        }
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
                <li class="nav-item"><a class="nav-link" href="ListSeances.jsp"><i class="fas fa-list me-1"></i>Sessions</a></li>
                <li class="nav-item"><a class="nav-link" href="login.jsp"><i class="fas fa-sign-in-alt me-1"></i>Login</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Content -->
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">Training Sessions</div>
                <div class="card-body">
                    <% if (request.getAttribute("error") != null) { %>
                    <div class="alert alert-danger">
                        <i class="fas fa-exclamation-circle"></i> <%= request.getAttribute("error") %>
                    </div>
                    <% } %>

                    <% if (request.getAttribute("message") != null) { %>
                    <div class="alert alert-success">
                        <i class="fas fa-check-circle"></i> <%= request.getAttribute("message") %>
                    </div>
                    <% } %>

                    <div class="row">
                        <%
                            List<Seance> seances = (List<Seance>) request.getAttribute("seances");
                            SeanceDAO seanceDAO = (SeanceDAO) request.getAttribute("seanceDAO");
                            SimpleDateFormat dateFormat = new SimpleDateFormat("EEEE, MMMM d, yyyy 'at' h:mm a");

                            if (seances != null && !seances.isEmpty()) {
                                for (Seance seance : seances) {
                                    String coachName = seanceDAO.getEntraineurName(seance.getEntraineurId());
                                    String formattedDate = dateFormat.format(seance.getDateTime());
                        %>
                        <div class="col-md-6">
                            <div class="session-card">
                                <div class="session-header">
                                    <h5><i class="fas fa-calendar-check"></i> Session #<%= seance.getId() %></h5>
                                </div>
                                <div class="session-body">
                                    <div class="session-info">
                                        <p><i class="fas fa-user-tie"></i> <strong>Coach:</strong> <%= coachName %></p>
                                        <p><i class="fas fa-clock"></i> <strong>Date & Time:</strong> <%= formattedDate %></p>
                                        <p><i class="fas fa-user"></i> <strong>Member ID:</strong> <%= seance.getMemberId() %></p>
                                    </div>
                                    <div class="d-flex justify-content-between mt-3">
                                        <a href="joinSeance?id=<%= seance.getId() %>" class="btn btn-primary">
                                            <i class="fas fa-user-plus"></i> Join
                                        </a>
                                        <a href="editSeance?id=<%= seance.getId() %>" class="btn btn-warning">
                                            <i class="fas fa-edit"></i> Edit
                                        </a>
                                        <a href="listSeances?action=delete&id=<%= seance.getId() %>"
                                           class="btn btn-danger"
                                           onclick="return confirm('Are you sure you want to delete this session?')">
                                            <i class="fas fa-trash"></i> Delete
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        } else {
                        %>
                        <div class="col-12 text-center py-5">
                            <i class="fas fa-calendar-times fa-4x text-muted mb-3"></i>
                            <h3 class="text-muted">No sessions found</h3>
                            <p>There are currently no training sessions scheduled.</p>
                            <a href="createSeance.jsp" class="btn btn-primary mt-3">
                                <i class="fas fa-plus"></i> Schedule New Session
                            </a>
                        </div>
                        <% } %>
                    </div>
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