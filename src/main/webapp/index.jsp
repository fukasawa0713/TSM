<%@ page language="java" contentType="text/html;charset=Shift_JIS" %>
<html>

<body>
<%
    request.setCharacterEncoding("Shift_JIS");
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
    <p><a href="<%=request.getContextPath()%>/TeacherInfoServlet" method ="GET">���t���</a></p>
    <p><a href="<%=request.getContextPath()%>/TSM/teacherNew.jsp">���t�o�^</a></p>
</body>
</html>
