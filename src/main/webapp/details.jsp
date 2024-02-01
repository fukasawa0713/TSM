<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
    <meta http-equiv="Content-Type">
    <title>details</title>
</head>
<body>

<%
    request.setCharacterEncoding("Shift_JIS");
    String name = request.getParameter("sname");
    out.println("hello, " + name);
%>
</body>
</html>