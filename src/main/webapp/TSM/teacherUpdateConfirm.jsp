<%@ page language="java" contentType="text/html;charset=Shift_JIS" %>
<html>
<head>
<h1>���t���X�V</h1>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/TSM/style.css">
</head>
<body>
<%
    request.setCharacterEncoding("Shift_JIS");
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<%


    Integer id = (Integer)request.getAttribute("�ԍ�");
    String name = (String) request.getAttribute("���O");
    String gender = (String) request.getAttribute("����");
    String age = (String) request.getAttribute("�N��");
    String course = (String) request.getAttribute("�R�[�X");


    Integer tid = (Integer)request.getAttribute("���t");
    String tName =(String)request.getAttribute("���t��");
    String tGender = (String) request.getAttribute("���t����");
    Integer tage = (Integer) request.getAttribute("�N");
    String subject = (String)request.getAttribute("����");
%>

<form action="<%=request.getContextPath()%>/TeacherUpdateServlet" method="post">
    �ȉ��͍X�V������e�ł��B

    <!-- ID (��\��) -->
    <input type="hidden" id="id" name="id" value="<%= id %>" readonly>

    <!-- ���O -->
    <input type="hidden" id="name" name="name" value="<%= name %>"><br>
    <% if (!name.equals(tName)) { %>
        ���O:<%=tName%> �����O:<%=name%><br>
    <% } %>

    <!-- ���� -->
    <input type="hidden" id="gender" name="gender" value="<%= gender %>"><br>
    <% if (!gender.equals(tGender)) { %>
        ����:<%=tGender%>������:<%=gender%><br>
    <% } %>

    <!-- �N�� (��\��) -->
    <input type="hidden" id="age" name="age" value="<%= age %>"><br>
    <% if (!age.equals(tage.toString())) { %>
        �N��:<%=tage%>���N��:<%=age%><br>
    <% } %>

    <!-- �R�[�X -->
    <input type="hidden" id="course" name="course" value="<%= course %>"><br>
    <% if (!course.equals(subject)) { %>
        �R�[�X:<%=subject%>���R�[�X:<%=course%><br>
    <% } %>

    <!-- �X�V�{�^�� -->
    <input type="submit" name="update" value="�X�V�m�F">
</form>

</body>
<html>
