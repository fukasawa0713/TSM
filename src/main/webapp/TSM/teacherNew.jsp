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

    <form>
         ���t�ԍ�:<input type ="text" name ="sid" size ="20"><sub>*</sub><br>
         ���O�F<input type="text" name="name" size="20"><sub>*</sub><br>
         ����:<input type="radio" name="gender" value="�j">�j
             <input type="radio" name="gender" value="��">��<sub>*</sub><br>
         �N��F<input type ="text" name ="age" size ="20"><sub>*</sub><br>
         �R�[�X:<input type = "text" name = "course" size="20"><sub>*</sub><br>
         *�󂪂��Ă��鍀�ڂ͕K�{���ڂł��B<br>
         <button id = "insertBtn">�o�^</button>
         <button id ="resetBtn">���Z�b�g</button>
    </form>

</body>
</html>
