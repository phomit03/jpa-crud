<%@ page import="java.io.Writer" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 23/05/2023
  Time: 7:00 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="errorPage.jsp" %>

<html>
<head>
    <title>Test JSP</title>
</head>
<body>
    <%-- <%! khai bao bien--%>
    <%! int d = 100; %>

    <%-- <% viet ma trong jsp--%>
    <%
        int a = 10;
        int b = 20;
        int c = a * b;
        request.setAttribute("c", c);

        /*truyen parameter*/
        String name = request.getParameter("name");
        String age = request.getParameter("age");
        /*in ra parameter vao html*/
        Writer writer = response.getWriter();
        out.write("<h1>Name: " + name + "</h1>");
        out.write("<h1>Age: " + age + "</h1>");

        /*HUNG thong tin session*/
        String sessionName = (String) session.getAttribute("session");
        String applicationName = (String) application.getAttribute("application");

        String pageScope = (String) pageContext.getAttribute("pageScope", PageContext.PAGE_SCOPE);
        String requestScope = (String) pageContext.getAttribute("requestScope", PageContext.REQUEST_SCOPE);
        String sessionScope = (String) pageContext.getAttribute("sessionScope", PageContext.SESSION_SCOPE);
        String applicationScope = (String) pageContext.getAttribute("applicationScope", PageContext.APPLICATION_SCOPE);
    %>

    <br/>

    <%--IN RA thong tin session--%>
    <h1>session: <%= sessionName%></h1>
    <h1>application: <%= applicationName%></h1>

    <br/>

    <%--IN RA thong tin scope--%>
    <h1>pageScope: <%= pageScope%></h1>
    <h1>requestScope: <%= requestScope%></h1>
    <h1>sessionScope: <%= sessionScope%></h1>
    <h1>applicationScope: <%= applicationScope%></h1>

    <%--IN RA thong tin param config web.xml--%>
    <h1>initPram: <%= config.getInitParameter("testInit")%></h1>

    <br/>

    <%--phep tinh sai -> hien thi error page--%>
    <%--<%= 10 / 0 %> --%>

    <%--hien thi ket qua 1 phep tinh--%>
    <h1><%= 10 + 30 + 50 %></h1>

    <%--sout 2 bien d & c--%>
    <h1>d: <%= d %></h1>
    <h1>c: <%= c %></h1>
</body>
</html>
