<%@ page language="java" contentType="text/html;charset=Shift_JIS" %>
<html>
<head>
<h1>���t���</h1>
</head>
<body>
<%
    request.setCharacterEncoding("Shift_JIS");
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
        <form action>
           ���t�ԍ�:<input type ="text" name ="id" size ="20">
           ���O�F<input type="text" name="name" size="20">
           �R�[�X�F<input type ="text" name ="course" size ="20">
           <button id = "searchBtn">����</button>
        </form>
        <table>
            <tr>
                <th>���t�ԍ�</th>
                <th>���O</th>
                <th>����</th>
                <th>�N��</th>
                <th>�R�[�X</th>
                <th>����</th>
            </tr>
            <tr>
                <td><span id="id"></span></td>
                <td><span id="name"></span></td>
                <td><span id="gender"></span></td>
                <td><span id="age"></span></td>
                <td><span id="course"></span></td>
                <td><button id = "updateBtn">�X�V</button></td>
            </tr>


        </table>




</body>
</html>
