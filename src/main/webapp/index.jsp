<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SportFlow - Elevate Your Game</title>
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
            color: #e74c3c !important; /* Sporty red */
            display: flex;
            align-items: center;
        }
        .navbar-brand i {
            margin-right: 0.5rem;
            font-size: 1.8rem;
        }
        .nav-link {
            color: white !important;
            font-weight: 600;
            padding: 0.5rem 1rem;
            transition: color 0.3s;
        }
        .nav-link:hover {
            color: #e74c3c !important;
        }
        .hero-section {
            height: 85vh;
            background: url('https://source.unsplash.com/1600x900/?sports,athlete') no-repeat center center/cover;
            color: white;
            display: flex;
            align-items: center;
            text-align: center;
            position: relative;
        }
        .hero-overlay {
            background: rgba(0, 0, 0, 0.5);
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }
        .hero-content {
            position: relative;
            z-index: 1;
        }
        .hero-content h1 {
            font-size: 4rem;
            font-weight: 800;
            text-shadow: 3px 3px 15px rgba(0, 0, 0, 0.5);
            animation: fadeInDown 1s ease-in-out;
        }
        .hero-content p {
            font-size: 1.5rem;
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
        .btn-hero {
            background-color: #e74c3c;
            border: none;
            padding: 14px 35px;
            font-size: 1.2rem;
            font-weight: 700;
            border-radius: 25px;
            transition: transform 0.3s, background-color 0.3s;
        }
        .btn-hero:hover {
            background-color: #c0392b;
            transform: scale(1.1);
        }
        .features-section {
            padding: 5rem 0;
            background-color: #fff;
        }
        .feature-card {
            border: none;
            border-radius: 20px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
            padding: 2.5rem;
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .feature-card:hover {
            transform: translateY(-15px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        }
        .feature-card i {
            font-size: 3rem;
            color: #e74c3c; /* Sporty red */
            margin-bottom: 1.5rem;
            transition: transform 0.3s;
        }
        .feature-card:hover i {
            transform: scale(1.2);
        }
        footer {
            background: linear-gradient(to right, #2c3e50, #34495e);
            color: white;
            padding: 2rem 0;
            text-align: center;
            font-weight: 500;
        }
        footer i {
            color: #e74c3c;
            margin-left: 0.5rem;
        }
    </style>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="#"><i class="fas fa-dumbbell"></i>SportFlow</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="createMember.jsp"><i class="fas fa-user-plus me-1"></i>Add Member</a></li>
                <li class="nav-item"><a class="nav-link" href="createEntraineur.jsp"><i class="fas fa-user-tie me-1"></i>Add Coach</a></li>
                <li class="nav-item"><a class="nav-link" href="createSeance.jsp"><i class="fas fa-calendar-check me-1"></i>Add Session</a></li>
                <li class="nav-item"><a class="nav-link" href="login.jsp"><i class="fas fa-sign-in-alt me-1"></i>Login</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<section class="hero-section">
    <div class="hero-overlay"></div>
    <div class="container hero-content">
        <h1>Unleash Your Potential</h1>
        <p>Master your club with seamless management and peak performance tools.</p>
        <a href="#features" class="btn btn-hero">Get Started</a>
    </div>
</section>

<!-- Features Section -->
<section class="features-section" id="features">
    <div class="container">
        <h2 class="text-center mb-5">Why SportFlow Stands Out</h2>
        <div class="row">
            <div class="col-md-4">
                <div class="feature-card">
                    <i class="fas fa-users"></i>
                    <h4>Member Management</h4>
                    <p>Easily register and track members with a user-friendly interface.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature-card">
                    <i class="fas fa-chalkboard-teacher"></i>
                    <h4>Coach Organization</h4>
                    <p>Manage coaches and their specialties effortlessly.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature-card">
                    <i class="fas fa-calendar-alt"></i>
                    <h4>Session Scheduling</h4>
                    <p>Plan and monitor training sessions with precision.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<footer>
    <div class="container">
        <p>© 2025 SportFlow. Built for Champions.<i class="fas fa-trophy"></i></p>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>