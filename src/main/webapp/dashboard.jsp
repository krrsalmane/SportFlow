<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Dashboard - SportConnect</title>
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
      background-color: rgba(0, 0, 0, 0.6);
      min-height: 100vh;
    }

    .dashboard-card {
      max-width: 500px;
      margin: 0 auto;
      background-color: rgba(255, 255, 255, 0.2);
      backdrop-filter: blur(10px);
      border: 1px solid rgba(255, 255, 255, 0.3);
    }

    .card-header {
      background-color: rgba(13, 110, 253, 0.7);
    }

    .btn-logout {
      background-color: rgba(220, 53, 69, 0.8);
      border-color: rgba(220, 53, 69, 1);
    }

    .btn-logout:hover {
      background-color: rgba(200, 35, 51, 0.8);
      border-color: rgba(200, 35, 51, 1);
    }
  </style>
</head>
<body>
<div class="overlay d-flex align-items-center py-4">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <div class="card dashboard-card shadow">
          <div class="card-header text-white text-center py-3">
            <h4 class="mb-0"><i class="fas fa-tachometer-alt me-2"></i>Dashboard</h4>
          </div>
          <div class="card-body text-center p-4">
            <h5 class="text-white mb-3">Bienvenue, !</h5>

            <p class="text-white mb-4">
              Vous êtes connecté à SportConnect. Explorez votre tableau de bord ou déconnectez-vous.
            </p>

            <form action="logout" method="post">
              <button type="submit" class="btn btn-logout text-white">
                <i class="fas fa-sign-out-alt me-1"></i>Se déconnecter
              </button>
            </form>
          </div>
          <div class="card-footer text-center py-3">
            <a href="index.jsp" class="btn btn-sm btn-outline-light mx-2">
              <i class="fas fa-home me-1"></i>Home
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
