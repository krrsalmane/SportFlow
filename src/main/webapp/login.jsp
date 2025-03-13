<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login - SportConnect</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            background-image: url('/api/placeholder/1920/1080');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            background-color: #1a1a1a;
            height: 100vh;
        }

        .overlay {
            background-color: rgba(0, 0, 0, 0.5);
            min-height: 100vh;
        }

        .card {
            max-width: 400px;
            margin: 0 auto;
            background-color: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .card-header {
            background-color: rgba(13, 110, 253, 0.7);
            border-bottom: 1px solid rgba(255, 255, 255, 0.3);
        }

        .card-footer {
            background-color: rgba(0, 0, 0, 0.1);
            border-top: 1px solid rgba(255, 255, 255, 0.2);
        }

        .form-control {
            background-color: rgba(255, 255, 255, 0.7);
            border: 1px solid rgba(255, 255, 255, 0.5);
        }

        .form-control:focus {
            background-color: rgba(255, 255, 255, 0.9);
            box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
        }

        .form-floating label {
            color: #212529;
        }

        .text-white-important {
            color: white !important;
        }

        .logo-icon {
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
        }

        .error-message {
            background-color: rgba(220, 53, 69, 0.8);
            border-radius: 4px;
            padding: 10px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="overlay d-flex align-items-center py-4">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-5">
                <div class="card shadow">
                    <div class="card-header text-white text-center py-3">
                        <h4 class="mb-0"><i class="fas fa-running me-2"></i>SportConnect</h4>
                    </div>
                    <div class="card-body p-4">
                        <div class="text-center text-white mb-4">
                            <div class="logo-icon">
                                <i class="fas fa-sign-in-alt"></i>
                            </div>
                            <h5 class="card-title">Login to Your Account</h5>
                            <% if (request.getAttribute("errorMessage") != null) { %>
                            <p class="text-red-400 text-center mb-4 animate-pulse"><%= request.getAttribute("errorMessage") %></p>
                            <% } %>
                        </div>

                        <form action="login" method="post">
                            <div class="form-floating mb-3">
                                <input type="email" class="form-control" id="email" name="email" placeholder="Email Address" required>
                                <label for="email"><i class="fas fa-envelope me-1"></i>Email Address</label>
                            </div>

                            <div class="form-floating mb-4">
                                <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
                                <label for="password"><i class="fas fa-lock me-1"></i>Password</label>
                            </div>

                            <div class="form-check mb-3">
                                <input class="form-check-input" type="checkbox" value="true" id="rememberMe" name="rememberMe">
                                <label class="form-check-label text-white" for="rememberMe">
                                    Remember me
                                </label>
                            </div>

                            <div class="d-grid gap-2 mb-4">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-sign-in-alt me-1"></i>Login
                                </button>
                            </div>

                            <div class="d-flex justify-content-center">
                                <a href="index.jsp" class="btn btn-sm btn-outline-light mx-2">
                                    <i class="fas fa-home me-1"></i>Home
                                </a>
                                <a href="#" class="btn btn-sm btn-outline-light mx-2">
                                    <i class="fas fa-key me-1"></i>Forgot Password
                                </a>
                            </div>
                        </form>
                    </div>
                    <div class="card-footer text-center py-3">
                        <span class="text-white">Don't have an account? <a href="register.jsp" class="text-white-important text-decoration-none fw-bold">Register Now</a></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>