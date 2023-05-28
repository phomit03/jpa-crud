<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 25/05/2023
  Time: 8:34 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Create User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</head>
<body>
    <h1>Create User: </h1>
    <br/>
    <form action="/userServlet" method="post" style="width: 50%; margin: 0 auto">
        <input type="hidden" name="action" value="createUser">

        <div class="mb-3">
            <input type="hidden" class="form-control" name="id" id="id">
        </div>
        <div class="mb-3">
            <label class="form-label">User Name</label>
            <input type="text" class="form-control" name="name" id="name">
        </div>
        <div class="mb-3">
            <label class="form-label">User Age</label>
            <input type="text" class="form-control" name="age" id="age">
        </div>
        <div class="mb-3">
            <label class="form-label">User Address</label>
            <input type="text" class="form-control" name="address" id="address">
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>

    </form>
</body>
</html>
