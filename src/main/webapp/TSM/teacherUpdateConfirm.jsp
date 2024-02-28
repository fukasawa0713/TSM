<%@ page language="java" contentType="text/html;charset=Shift_JIS" %>
<html>
<head>
<h1>教師情報更新</h1>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/TSM/style.css">
</head>
<body>
<%
    request.setCharacterEncoding("Shift_JIS");
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<%


    Integer id = (Integer)request.getAttribute("番号");
    String name = (String) request.getAttribute("名前");
    String gender = (String) request.getAttribute("性別");
    String age = (String) request.getAttribute("年齢");
    String course = (String) request.getAttribute("コース");


    Integer tid = (Integer)request.getAttribute("教師");
    String tName =(String)request.getAttribute("教師名");
    String tGender = (String) request.getAttribute("教師性別");
    Integer tage = (Integer) request.getAttribute("年");
    String subject = (String)request.getAttribute("教科");
%>

<form action="<%=request.getContextPath()%>/TeacherUpdateServlet" method="post">
    以下は更新する内容です。

    <!-- ID (非表示) -->
    <input type="hidden" id="id" name="id" value="<%= id %>" readonly>

    <!-- 名前 -->
    <input type="hidden" id="name" name="name" value="<%= name %>"><br>
    <% if (!name.equals(tName)) { %>
        名前:<%=tName%> →名前:<%=name%><br>
    <% } %>

    <!-- 性別 -->
    <input type="hidden" id="gender" name="gender" value="<%= gender %>"><br>
    <% if (!gender.equals(tGender)) { %>
        性別:<%=tGender%>→性別:<%=gender%><br>
    <% } %>

    <!-- 年齢 (非表示) -->
    <input type="hidden" id="age" name="age" value="<%= age %>"><br>
    <% if (!age.equals(tage.toString())) { %>
        年齢:<%=tage%>→年齢:<%=age%><br>
    <% } %>

    <!-- コース -->
    <input type="hidden" id="course" name="course" value="<%= course %>"><br>
    <% if (!course.equals(subject)) { %>
        コース:<%=subject%>→コース:<%=course%><br>
    <% } %>

    <!-- 更新ボタン -->
    <input type="submit" name="update" value="更新確認">
</form>

</body>
<html>
