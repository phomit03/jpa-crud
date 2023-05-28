<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %></h1>

<br/>

<%--include--%>
<%--<%@include file="testInclude.jsp" %>

<jsp:text>using standard action include</jsp:text>

<%--include co param--%>
<%--<jsp:include page="testInclude.jsp">
    <jsp:param name="name" value="T2108E"/>
</jsp:include>--%>

<%
    session.setAttribute("session", "session implicit object");
    application.setAttribute("application", "application implicit object");
    pageContext.setAttribute("pageScope", "page scope object", PageContext.PAGE_SCOPE);
    pageContext.setAttribute("requestScope","request scope object", PageContext.REQUEST_SCOPE);
    pageContext.setAttribute("sessionScope","session scope object", PageContext.SESSION_SCOPE);
    pageContext.setAttribute("applicationScope","application scope object", PageContext.APPLICATION_SCOPE);

    /*dung dispatcher.forward() de chuyen thong tin bi null sang trang khac (page scope, request scope)*/
    /*pageScope chi dung duoc o chinh trang nay, khong the chuyen thong tin*/
    //request.getRequestDispatcher("demoJSP?name=T2108E&age=20").forward(request, response);    //redirect sang demoJSP?name=T2108E&age=20
%>

<%--tuong duong: UserEntity userBean = new UserEntity();--%>
<%--getProperty thi dung type, setProperty thi dung class--%>
<jsp:useBean id="userBean" class="com.example.jpademo.etity.UserEntity" scope="request"/>
    <jsp:setProperty name="userBean" property="id" value="1"/>
    <jsp:setProperty name="userBean" property="name" value="T2108E"/>
    <jsp:setProperty name="userBean" property="age" value="20"/>
    <jsp:setProperty name="userBean" property="address" value="Nghe An"/>

<%--redirect sang testInclude.jsp--%>
<jsp:forward page="testInclude.jsp">
    <jsp:param name="name" value="value from index"/>
</jsp:forward>

<%--convert chuoi sang so roi thuc hien tinh toan--%>
<h1>Tổng: ${"2" + 2}</h1>
<%--<h1>Tổng: ${"abc" + 2}</h1>--%>     <%--error--%>
<h1>${"Hello".concat(" T2108E")}</h1>   <%--cong chuoi--%>

<h1>param value: ${param.name}</h1>
<h1>check param value: ${empty param.name}</h1>

<br/>

<a href="hello-servlet">Hello Servlet</a>

<br/>

<a href="demoJSP.jsp?name=T2108E&age=20">Go Demo JSP</a>

</body>
</html>