<%@ page language="java" contentType="text/html;charset=Shift_JIS" %>
<html>
<head>
<h1>���t���o�^</h1>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/jquery.validate.min.js"></script>
</head>
<body>
<%
    request.setCharacterEncoding("Shift_JIS");
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

    <form name ="newForm" action = "<%=request.getContextPath()%>/TeacherInsertServlet" method = "POST">
         ���t�ԍ�:<input type ="text" maxlength="5" pattern = "^[0-9]*$" name ="id" id ="id" required size ="20"><sub>*</sub><br>
         ���O�F<input type="text" name="name" id ="name" required size="20"><sub>*</sub><br>
         ����:<input type="radio" name="gender" id ="gender" required value="�j">�j
             <input type="radio" name="gender" id ="gender" required value="��">��<sub>*</sub><br>
         �N��F<input type ="text" name ="age" id ="age" required size ="20"><sub>*</sub><br>
         �R�[�X�F<select name="course" id = "course" required >
                 <option value=""></option>
                 <option>�p��</option>
                 <option>���w</option>
                 <option>���{��</option>
                 <option>����</option>
         </select>
         *�󂪂��Ă��鍀�ڂ͕K�{���ڂł��B<br>
         <button id = "insertBtn">�o�^</button>
         <input type ="reset" value = "���Z�b�g">
    </form>
</body>
</html>
