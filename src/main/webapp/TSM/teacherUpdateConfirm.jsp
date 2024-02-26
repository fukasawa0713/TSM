<%@ page language="java" contentType="text/html;charset=Shift_JIS" %>
<html>
<head>
<h1>教師情報更新</h1>
</head>
<body>
<%
    request.setCharacterEncoding("Shift_JIS");
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<%
    String name = (String) request.getAttribute("名前");
    String gender = (String) request.getAttribute("性別");
    String age = (String) request.getAttribute("年齢");
    String course = (String) request.getAttribute("コース");

%>

<form action= "<%=request.getContextPath()%>/TeacherUpdateServlet" method="post">
    <% if (request.getAttribute("名前") != null) { %>
        名前: <%= name %><br>
    <% } %>
    <% if (request.getAttribute("性別") != null) { %>
        性別: <%= gender %><br>
    <% } %>
    <% if (request.getAttribute("年齢") != null) { %>
        年齢: <%= age %><br>
    <% } %>
    <% if (request.getAttribute("コース") != null) { %>
        コース: <%= course %><br>
    <% } %>

    <input type="submit" name = "update"　value="更新">
</form>
<body>
<html>