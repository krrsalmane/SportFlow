<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SportConnect - Sports Club Management</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <div class="row">
        <div class="col">
            <h1 class="text-center mb-4">Welcome to SportConnect</h1>
            <p class="lead text-center">Manage memberships and training sessions efficiently</p>
        </div>
    </div>

    <div class="row mt-4">
        <div class="col-md-4">
            <div class="card mb-4">
                <div class="card-header">Member Management</div>
                <div class="card-body">
                    <p>Register and manage club members</p>
                    <a href="registerMember.jsp" class="btn btn-primary">Register Member</a>
                    <a href="memberList.jsp" class="btn btn-outline-primary">View Members</a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card mb-4">
                <div class="card-header">Coach Management</div>
                <div class="card-body">
                    <p>Register and manage coaches</p>
                    <a href="registerCoach.jsp" class="btn btn-primary">Register Coach</a>
                    <a href="coachList.jsp" class="btn btn-outline-primary">View Coaches</a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card mb-4">
                <div class="card-header">Session Management</div>
                <div class="card-body">
                    <p>Schedule and manage training sessions</p>
                    <a href="createSession.jsp" class="btn btn-primary">Create Session</a>
                    <a href="sessionList.jsp" class="btn btn-outline-primary">View Sessions</a>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>