<%@ page language="java" contentType="text/html;charset=Shift_JIS" %>
<html>
<head>
<h1>���t���X�V</h1>
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
        String errorMessage = (String) request.getAttribute("errorMessage");

%>
   ���t�ԍ��F<%=%teacherId>�̏��̍X�V�Ɏ��s�����B<br>
   <% if (errorMessage != null && !errorMessage.isEmpty()) { %>
      �G���[���������܂���: <%= errorMessage %><br>
   <% } else { %>

<form action = "<%=request.getContextPath()%>/TeacherInfoServlet" method = "POST">
    <button id ="topBtn">�g�b�v�y�[�W��</button>
</form>

</body>
</html>
