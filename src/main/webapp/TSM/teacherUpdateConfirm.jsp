<%@ page language="java" contentType="text/html;charset=Shift_JIS" %>
<html>
<head>
<h1>���t���X�V</h1>
</head>
<body>
<%
    request.setCharacterEncoding("Shift_JIS");
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<%
    String name = (String) request.getAttribute("���O");
    String gender = (String) request.getAttribute("����");
    String age = (String) request.getAttribute("�N��");
    String course = (String) request.getAttribute("�R�[�X");

%>

<form action= "<%=request.getContextPath()%>/TeacherUpdateServlet" method="post">
    <% if (request.getAttribute("���O") != null) { %>
        ���O: <%= name %><br>
    <% } %>
    <% if (request.getAttribute("����") != null) { %>
        ����: <%= gender %><br>
    <% } %>
    <% if (request.getAttribute("�N��") != null) { %>
        �N��: <%= age %><br>
    <% } %>
    <% if (request.getAttribute("�R�[�X") != null) { %>
        �R�[�X: <%= course %><br>
    <% } %>

    <input type="submit" name = "update"�@value="�X�V">
</form>
<body>
<html>