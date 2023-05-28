<%@ page import="com.example.jpademo.etity.UserEntity" %>
<%@ page import="com.example.jpademo.dao.UserDAO" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 26/05/2023
  Time: 11:47 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit User</title>
</head>
<body>
    <%
        UserDAO userDAO = new UserDAO();
        String userId = request.getParameter("id");
        UserEntity user = userDAO.getUserById(userId);
    %>
    <h1>Edit User:</h1>
    <br/>
    <form action="userServlet" method="post">
        Id: <input type="text" name="id" value="<%=user.getId()%>" disabled>
        <br/>
        Name: <input type="text" name="name" value="<%=user.getName()%>">
        <br/>
        Age: <input type="text" name="age" value="<%=user.getAge()%>">
        <br/>
        Address: <input type="text" name="address" value="<%=user.getAddress()%>">
        <br/>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
