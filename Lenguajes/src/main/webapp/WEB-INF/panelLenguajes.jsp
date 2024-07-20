<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lenguajes de Programación</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h1 class="mb-4">Lenguajes de Programación</h1>
        <article class="tabla">
            <table class="table table-striped table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>Name</th>
                        <th>Creator</th>
                        <th>Version</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="lenguaje" items="${lenguajes}">
                        <tr>
                            <td><a href="/languages/${lenguaje.id}">${lenguaje.name}</a></td>
                            <td>${lenguaje.creator}</td>
                            <td>${lenguaje.currentVersion}</td>
                            <td>
                                <form:form action="/languages/${lenguaje.id}" method="post" class="d-inline">
                                    <input type="hidden" name="_method" value="DELETE" />
                                    <button type="submit" class="btn btn-danger btn-sm">Eliminar</button>
                                </form:form>
                                <form action="/languages/${lenguaje.id}/edit" method="get" class="d-inline">
                                    <button type="submit" class="btn btn-primary btn-sm">Editar</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </article>
        
        <form:form action="/languages" method="post" modelAttribute="lenguaje" class="formulario">
            <div class="form-group">
                <form:label path="name" class="detalle">Name:</form:label>
                <form:input path="name" type="text" class="form-control" />
                <form:errors path="name" class="alerta" />
            </div>
            <div class="form-group">
                <form:label path="creator" class="detalle">Creator:</form:label>
                <form:input path="creator" type="text" class="form-control" />
                <form:errors path="creator" class="alerta" />
            </div>
            <div class="form-group">
                <form:label path="currentVersion" class="detalle">Version:</form:label>
                <form:input path="currentVersion" type="number" class="form-control" />
                <form:errors path="currentVersion" class="alerta" />
            </div>
            <button type="submit" class="btn btn-success">Enviar</button>
        </form:form>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
