<%@ page language="java" contentType="text/html;charset=Shift_JIS" %>
<html>
<head>
<h1>���t���o�^</h1>
</head>
<body>
<%
    request.setCharacterEncoding("Shift_JIS");
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

    Integer tid = (Integer)request.getAttribute("�ԍ�");

%>
���t�ԍ�:<%=tid%>�̏����X�V���܂����B<br>
<form action = "<%=request.getContextPath()%>/TeacherInfoServlet">
<button id ="topBtn">�g�b�v�y�[�W��</button>
</form>
</body>
</html>
