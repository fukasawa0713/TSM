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
%>

<%
        Integer teacherIdObj = (Integer) request.getAttribute("���t�ԍ�");
                int teacherId = (teacherIdObj != null) ? teacherIdObj.intValue() : 0;
        String name = (String) request.getAttribute("���O");

%>
   �X�V�Ɏ��s�����B<br>

<form action = "<%=request.getContextPath()%>/TeacherInfoServlet" method = "POST">
    <button id ="topBtn">�g�b�v�y�[�W��</button>
</form>

</body>
</html>
