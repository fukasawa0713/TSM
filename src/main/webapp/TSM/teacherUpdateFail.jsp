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
        Integer teacherIdObj = (Integer) request.getAttribute("教師番号");
                int teacherId = (teacherIdObj != null) ? teacherIdObj.intValue() : 0;
        String name = (String) request.getAttribute("名前");
        String errorMessage = (String) request.getAttribute("errorMessage");

%>
   教師番号：<%=%teacherId>の情報の更新に失敗した。<br>
   <% if (errorMessage != null && !errorMessage.isEmpty()) { %>
      エラーが発生しました: <%= errorMessage %><br>
   <% } else { %>

<form action = "<%=request.getContextPath()%>/TeacherInfoServlet" method = "POST">
    <button id ="topBtn">トップページへ</button>
</form>

</body>
</html>
