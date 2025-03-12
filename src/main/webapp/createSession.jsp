<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Session - SportConnect</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">

    <form action="session" method="post">
        <input type="hidden" name="action" value="create">

        <div class="mb-3">
            <label for="memberId" class="form-label">Member</label>
            <!-- In a real application, this would be a dropdown populated from the database -->
            <input type="number" class="form-control" id="memberId" name="memberId" required>
        </div>

        <div class="mb-3">
            <label for="coachId" class="form-label">Coach</label>
            <!-- In a real application, this would be a dropdown populated from the database -->
            <input type="text"class="form-control"  id="coachId" name="coachId" required>
        </div>

        <div class="mb-3">
            <label for="dateTime" class="form-label">Date and Time</label>
            <input type="datetime-local" class="form-control" id="dateTime" name="dateTime" required>
        </div>

        <div class="mb-3">
            <label for="description" class="form-label">Description</label>
            <textarea class="form-control" id="description" name="description" rows="3"></textarea>
        </div>

        <button type="submit" class="btn btn-primary">Create Session</button>
        <a href="index.jsp" class="btn btn-secondary">Cancel</a>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>