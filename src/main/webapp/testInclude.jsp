<%@ page import="java.awt.*" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 23/05/2023
  Time: 7:14 CH
  To change this template use File | Settings | File Templates.
--%>

<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--trung contentType voi noi can include--%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Include JSP</h1>

<br/>

<%
    String name = request.getParameter("name");
%>
<h1>Name in testInclude.jsp: <%= name%></h1>

<br/>

<h1>Start get useBean: </h1>
<%--getProperty thi dung type, setProperty thi dung class--%>
<jsp:useBean id="userBean" type="com.example.jpademo.etity.UserEntity" scope="request"/>
<%--lay ra name va age--%>
<h1>Name: <jsp:getProperty name="userBean" property="name"/></h1>
<h1>Age: <jsp:getProperty name="userBean" property="age"/></h1>

<%--lay ra cac value cua scope tu index.jsp--%>
<h1>requestScope: ${requestScope.requestScope}</h1>
<h1>sessionScope: ${sessionScope.sessionScope}</h1>
<h1>applicationScope: ${applicationScope.applicationScope}</h1>
<h1>applicationScope: ${applicationScope.application}</h1>

<%--return true, false--%>
<h1>compare: ${4 > "3"}</h1>
<h1>compare: ${4 > "3" && 3 < "1"}</h1>

</body>
</html>
