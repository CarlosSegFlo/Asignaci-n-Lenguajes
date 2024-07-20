<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Detalles</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
</head>
<body>
    <div class="container mt-4">
        <header class="header">
            <form action="/languages" method="get">
                <button type="submit" class="btn btn-secondary">Back to List</button>
            </form>
        </header>
        
        <article class="details">
            <h3>Name: ${lenguaje.name}</h3>
            <h3>Creator: ${lenguaje.creator}</h3>
            <h3>Version: ${lenguaje.currentVersion}</h3>
        </article>
        
        <footer class="footer">
            <form:form action="/languages/${lenguaje.id}" method="post" class="d-inline">
                <input type="hidden" name="_method" value="delete" />
                <button type="submit" class="btn btn-danger btn-sm btn-custom">Delete</button>
            </form:form>
            <form action="/languages/${lenguaje.id}/edit" method="get" class="d-inline">
                <button type="submit" class="btn btn-primary btn-sm btn-custom">Edit</button>
            </form>
        </footer>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
