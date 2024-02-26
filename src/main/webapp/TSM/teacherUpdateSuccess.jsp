<%@ page language="java" contentType="text/html;charset=Shift_JIS" %>
<html>
<head>
<h1>教師情報登録</h1>
</head>
<body>
<%
    request.setCharacterEncoding("Shift_JIS");
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

更新成功<br>
<form action = "<%=request.getContextPath()%>/index.jsp">
<button id ="topBtn">トップページへ</button>
</form>
</body>
</html>
