<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Register Member - SportConnect</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            background-image: url("");
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
            max-width: 450px;
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
    </style>
</head>
<body>
<div class="overlay d-flex align-items-center py-4">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-5">
                <div class="card shadow">
                    <div class="card-header text-white text-center py-2">
                        <h4 class="mb-0"><i class="fas fa-running me-2"></i>SportConnect</h4>
                    </div>
                    <div class="card-body p-3">
                        <h5 class="card-title text-white text-center mb-3">Member Registration</h5>

                        <form action="member" method="post">
                            <input type="hidden" name="action" value="create">

                            <div class="form-floating mb-2">
                                <input type="text" class="form-control" id="name" name="name" placeholder="Full Name" required>
                                <label for="name"><i class="fas fa-user me-1"></i>Full Name</label>
                            </div>

                            <div class="form-floating mb-2">
                                <input type="email" class="form-control" id="email" name="email" placeholder="Email Address" required>
                                <label for="email"><i class="fas fa-envelope me-1"></i>Email Address</label>
                            </div>

                            <div class="form-floating mb-2">
                                <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
                                <label for="password"><i class="fas fa-lock me-1"></i>Password</label>
                            </div>

                            <div class="form-floating mb-2">
                                <input type="date" class="form-control" id="dateOfBirth" name="dateOfBirth" required>
                                <label for="dateOfBirth"><i class="fas fa-calendar me-1"></i>Date of Birth</label>
                            </div>

                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="sportPracticed" name="sportPracticed" placeholder="Sport Practiced" required>
                                <label for="sportPracticed"><i class="fas fa-volleyball-ball me-1"></i>Sport Practiced</label>
                            </div>

                            <div class="d-grid gap-2 mb-2">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-user-plus me-1"></i>Register Now
                                </button>
                            </div>

                            <div class="d-flex justify-content-between">
                                <a href="index.jsp" class="btn btn-sm btn-outline-light">
                                    <i class="fas fa-arrow-left me-1"></i>Back
                                </a>
                                <a href="login.jsp" class="btn btn-sm btn-outline-light">
                                    <i class="fas fa-sign-in-alt me-1"></i>Login
                                </a>
                            </div>
                        </form>
                    </div>
                    <div class="card-footer text-center py-2">
                        <span class="text-white">Already have an account? <a href="href="loginMember.jsp" class="text-white-important text-decoration-none fw-bold">Sign in</a></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>