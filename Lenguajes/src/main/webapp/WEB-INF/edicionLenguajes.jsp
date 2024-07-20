<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .header, .footer {
            margin-bottom: 20px;
        }
        .form-container {
            margin-top: 20px;
        }
        .form-section {
            margin-bottom: 15px;
        }
        .form-label {
            font-weight: bold;
        }
        .form-errors {
            color: #dc3545;
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <header class="header">
            <form action="/languages/${lenguaje.id}" method="post" class="d-inline">
                <input type="hidden" name="_method" value="delete" />
                <button type="submit" class="btn btn-danger">Delete</button>
            </form>
            <form action="/languages" method="get" class="d-inline">
                <button type="submit" class="btn btn-secondary">Dashboard</button>
            </form>
        </header>

        <article class="form-container">
            <h2>Edit Language</h2>
            <form:form action="/languages/${lenguaje.id}" method="post" modelAttribute="lenguaje" class="form">
                <input type="hidden" name="_method" value="put" />
                
                <div class="form-section">
                    <form:label path="name" cssClass="form-label">Name:</form:label>
                    <form:input path="name" type="text" class="form-control" />
                    <form:errors path="name" cssClass="form-errors" />
                </div>

                <div class="form-section">
                    <form:label path="creator" cssClass="form-label">Creator:</form:label>
                    <form:input path="creator" type="text" class="form-control" />
                    <form:errors path="creator" cssClass="form-errors" />
                </div>

                <div class="form-section">
                    <form:label path="currentVersion" cssClass="form-label">Version:</form:label>
                    <form:input path="currentVersion" type="number" class="form-control" />
                    <form:errors path="currentVersion" cssClass="form-errors" />
                </div>

                <div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </form:form>
        </article>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
