<%@ page language="java" contentType="text/html;charset=Shift_JIS" %>
<%@ page import="java.util.Date" %>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html;charset=Shift_JIS">
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("Shift_JIS");
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    out.println(basePath);
    out.println(request.getContextPath());
    out.println(request.getServletPath());
    out.println(request.getRequestURI());
    out.println(request.getRequestURL());
    out.println(request.getQueryString());
    out.println(request.getMethod());
    out.println(request.getProtocol());
    out.println(request.getRemoteAddr());
    out.println(request.getRemoteHost());
    out.println(request.getRemotePort());
    out.println(request.getLocalAddr());
    out.println(request.getLocalName());
    out.println(request.getLocalPort());
    out.println(request.getServerName());
    out.println(request.getServerPort());
    out.println(request.getServletContext().getRealPath("/"));
    out.println(request.getServletContext().getRealPath("/index.jsp"));
    out.println(request.getServletContext().getRealPath("/WEB-INF/classes/"));
    out.println(request.getServletContext().getRealPath("/WEB-INF/classes/index.jsp"));
    out.println(request.getServletContext().getRealPath("/WEB-INF/classes/com/"));
    out.println(request.getServletContext().getRealPath("/WEB-INF/classes/com/it/"));
    out.println("頑張ります");

    Date date = new Date();
    out.println(date);
%>
<table>
<tr>
<td>属性</td>
<td>値</td>
</tr>
<%
    for(int i=0; i<10; i ++) {
%>
<tr>
<td><% out.print("a");%></td>
<td><% out.print("b");%></td>
</tr>
<%
    }
%>

</table>
<p> ここからフォームです</p>
<form name="details" method="post" action="<% out.print(basePath);%>details.jsp">
    <input type="text" name="sname">
    <input type="submit" name="submit">
</form>

<script type="text/javascript">
function dosend() {
    var h = '<% out.print(basePath);%>details.jsp?sname=';
    var name = document.details.sname.value;
    h = h + name;
    document.location.href = h;
    return false;
}

</script>
<a href="#" onclick="javascript:dosend();">baidu</a>

<%-- コメント
<jsp:forward page="details.jsp">
<jsp:param name="sname" value="hoge"/>
</jsp:forward>
--%>

</body>
</html>