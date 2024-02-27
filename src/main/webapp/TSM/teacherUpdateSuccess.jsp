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

    Integer tid = (Integer)request.getAttribute("番号");

%>
教師番号:<%=tid%>の情報を更新しました。<br>
<form action = "<%=request.getContextPath()%>/TeacherInfoServlet">
<button id ="topBtn">教師一覧</button>
</form>
</body>
</html>
