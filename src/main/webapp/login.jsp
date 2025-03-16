<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SportFlow - Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #e9ecef;
            overflow-x: hidden;
            height: 100vh;
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
        .login-section {
            min-height: calc(100vh - 176px); /* Account for navbar and footer */
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 3rem 0;
        }
        .login-container {
            background-color: #fff;
            border-radius: 20px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
            padding: 2.5rem;
            width: 100%;
            max-width: 500px;
            transform: translateY(0);
            transition: transform 0.3s, box-shadow 0.3s;
            animation: slideUp 0.8s ease-in-out;
        }
        .login-container:hover {
            transform: translateY(-10px);
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.2);
        }
        @keyframes slideUp {
            0% { opacity: 0; transform: translateY(30px); }
            100% { opacity: 1; transform: translateY(0); }
        }
        .login-header {
            text-align: center;
            margin-bottom: 2rem;
        }
        .login-header h1 {
            color: #e74c3c;
            font-weight: 800;
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
        }
        .login-header p {
            color: #7f8c8d;
            font-size: 1.1rem;
        }
        .role-selector {
            display: flex;
            justify-content: space-between;
            margin-bottom: 2rem;
        }
        .role-option {
            flex: 1;
            text-align: center;
            padding: 1rem 0.5rem;
            border: 2px solid #e5e5e5;
            border-radius: 12px;
            cursor: pointer;
            transition: all 0.3s;
            margin: 0 5px;
        }
        .role-option.active {
            background-color: #e74c3c;
            color: white;
            border-color: #e74c3c;
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(231, 76, 60, 0.3);
        }
        .role-option:hover:not(.active) {
            border-color: #e74c3c;
            color: #e74c3c;
        }
        .role-option i {
            display: block;
            font-size: 2rem;
            margin-bottom: 0.5rem;
        }
        .form-group {
            margin-bottom: 1.5rem;
        }
        .form-group label {
            color: #2c3e50;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }
        .form-control {
            padding: 0.8rem 1rem;
            border-radius: 10px;
            border: 2px solid #e5e5e5;
            transition: border-color 0.3s, box-shadow 0.3s;
        }
        .form-control:focus {
            border-color: #e74c3c;
            box-shadow: 0 0 0 0.25rem rgba(231, 76, 60, 0.25);
        }
        .remember-forgot {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
        }
        .remember-forgot a {
            color: #e74c3c;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s;
        }
        .remember-forgot a:hover {
            color: #c0392b;
            text-decoration: underline;
        }
        .btn-login {
            background-color: #e74c3c;
            border: none;
            padding: 0.8rem 0;
            font-size: 1.1rem;
            font-weight: 700;
            border-radius: 10px;
            width: 100%;
            transition: transform 0.3s, background-color 0.3s, box-shadow 0.3s;
        }
        .btn-login:hover {
            background-color: #c0392b;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(231, 76, 60, 0.4);
        }
        .register-link {
            text-align: center;
            margin-top: 1.5rem;
            color: #7f8c8d;
        }
        .register-link a {
            color: #e74c3c;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s;
        }
        .register-link a:hover {
            color: #c0392b;
            text-decoration: underline;
        }
        .error-message {
            background-color: #fdeded;
            color: #ef5350;
            padding: 1rem;
            border-radius: 10px;
            margin-bottom: 1.5rem;
            border-left: 4px solid #ef5350;
            font-weight: 500;
        }
        .success-message {
            background-color: #e8f5e9;
            color: #4caf50;
            padding: 1rem;
            border-radius: 10px;
            margin-bottom: 1.5rem;
            border-left: 4px solid #4caf50;
            font-weight: 500;
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
                <li class="nav-item"><a class="nav-link active" href="login.jsp"><i class="fas fa-sign-in-alt me-1"></i>Login</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Login Section -->
<section class="login-section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <div class="login-container">
                    <div class="login-header">
                        <h1>Welcome Back</h1>
                        <p>Login to your SportFlow account</p>
                    </div>
                    <% if (request.getAttribute("errorMessage") != null) { %>
                    <div class="error-message">
                        <i class="fas fa-exclamation-circle me-2"></i>
                        <%= request.getAttribute("errorMessage") %>
                    </div>
                    <% } %>

                    <% if (session.getAttribute("successMessage") != null) { %>
                    <div class="success-message">
                        <i class="fas fa-check-circle me-2"></i>
                        <%= session.getAttribute("successMessage") %>
                        <% session.removeAttribute("successMessage"); %>
                    </div>
                    <% } %>

                    <form action="login" method="post">
                        <div class="role-selector">
                            <div class="role-option active" data-role="member">
                                <i class="fas fa-user"></i>
                                <span>Member</span>
                            </div>
                            <div class="role-option" data-role="entraineur">
                                <i class="fas fa-dumbbell"></i>
                                <span>Coach</span>
                            </div>
                            <div class="role-option" data-role="admin">
                                <i class="fas fa-user-shield"></i>
                                <span>Admin</span>
                            </div>
                        </div>

                        <input type="hidden" name="role" id="selectedRole" value="member">

                        <div class="form-group">
                            <label for="email">Email Address</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>

                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>

                        <div class="remember-forgot">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="rememberMe" name="rememberMe">
                                <label class="form-check-label" for="rememberMe">Remember me</label>
                            </div>
                            <a href="forgot-password.jsp">Forgot password?</a>
                        </div>

                        <button type="submit" class="btn btn-login btn-primary">Login</button>

                        <div class="register-link">
                            Don't have an account? <a href="register.jsp">Register now</a>
                        </div>
                    </form>
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
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const roleOptions = document.querySelectorAll('.role-option');
        const selectedRoleInput = document.getElementById('selectedRole');

        roleOptions.forEach(option => {
            option.addEventListener('click', function() {
                // Remove active class from all options
                roleOptions.forEach(opt => opt.classList.remove('active'));

                // Add active class to clicked option
                this.classList.add('active');

                // Update hidden input value
                selectedRoleInput.value = this.getAttribute('data-role');
            });
        });
    });
</script>
</body>
</html>