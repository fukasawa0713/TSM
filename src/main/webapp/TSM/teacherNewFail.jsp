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

<%
        Integer teacherIdObj = (Integer) request.getAttribute("教師番号");
                int teacherId = (teacherIdObj != null) ? teacherIdObj.intValue() : 0;
        String name = (String) request.getAttribute("名前");

%>
    教師番号：<%= teacherId%>名前：<%= name%><br>
    登録に失敗した。<br>

<form action = "<%=request.getContextPath()%>/index.jsp" method = "POST">
    <button id ="topBtn">トップページへ</button>
</form>

</body>
</html>
0123