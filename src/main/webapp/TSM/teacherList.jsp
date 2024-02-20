<%@ page language="java" contentType="text/html;charset=Shift_JIS" %>
<html>

<body>
<%
    request.setCharacterEncoding("Shift_JIS");
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

      <p><a href="<%=request.getContextPath()%>teacherList.jsp">ŒŸõ</a></p>
      <p><a href="<%=request.getContextPath()%>teacherNew.jsp">XV</a></p>
</body>
</html>
