<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.jpademo.etity.UserEntity" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 25/05/2023
  Time: 8:49 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--<jsp:useBean id="listUser" scope="request" type="java.util.List"/>  &lt;%&ndash;config listUser khong bi canh bao&ndash;%&gt;--%>

<html>
<head>
    <title>List User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</head>
<body>
<a href="user/createUser.jsp" class="btn btn-primary" style="float: right">+Create User</a>

<%--message--%>
<p style="color: green">${message}</p>

<h1>LIST USER: </h1>
<table class="table" style="width: 80%; margin: 0 auto">
    <thead>
    <tr>
        <th scope="col">#</th>
        <th scope="col">Name</th>
        <th scope="col">Age</th>
        <th scope="col">Address</th>
        <th scope="col">Action</th>
    </tr>
    </thead>
    <tbody>
    <%--c:choose: check theo dieu kien--%>
    <c:choose>
        <%--if--%>
        <c:when test="${listUser.size() > 0}">      <%--test: dieu kien--%> 
            <c:forEach items="${listUser}" var="user" varStatus="loop">
                <tr>
                    <th scope="row">${loop.index + 1}</th>  <%--vong lap + 1 = stt, khong lay theo id--%>
                    <td>${user.name}</td>
                    <td><c:out value="${user.age}"/></td>
                    <td>${user.address}</td>
                    <td>
                        <a href="/userServlet?action=editUser&id=${user.id}">edit</a>
                    </td>
                    <td>
                        <a href="/userServlet?action=deleteUser&id=${user.id}" style="color: red"
                           onclick="return confirm('are you sure delete user id = ${user.id} ?')">delete</a>
                    </td>
                </tr>
            </c:forEach>
        </c:when>
        <%--else--%>
        <c:otherwise>
            <td colspan="4">No data</td>
        </c:otherwise>
    </c:choose>
    
    </tbody>
</table>
</body>
</html>
