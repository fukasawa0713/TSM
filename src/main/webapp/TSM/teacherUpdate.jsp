<%@ page language="java" contentType="text/html;charset=Shift_JIS" %>
<%@ page import="jp.main.model.Teacher" %>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<h1>���t���X�V</h1>
</head>
<body>
<%
    request.setCharacterEncoding("Shift_JIS");
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<form action ="<%=request.getContextPath()%>/TeacherCountServlet" method = "POST">
    <table id="updateTable">
        <tr>
            <th>���t�ԍ�:</th>
            <td><input type="text" id="teacherId" name="teacherId" value="<%= ((Teacher) request.getAttribute("teacherInfo")).getId() %>" readonly></td>
        </tr>
        <tr>
            <th>���O:</th>
            <td><input type="text" id="teacherName" value="<%= ((Teacher) request.getAttribute("teacherInfo")).getName() %>"></td>
        </tr>
        <td>
            <input type="radio" name="gender" id="male"  value="�j" <%= ((Teacher) request.getAttribute("teacherInfo")).getGender().equals("�j") ? "checked" : "" %>>
            <label for="male">�j</label>
            <input type="radio" name="gender" id="female"  value="��" <%= ((Teacher) request.getAttribute("teacherInfo")).getGender().equals("��") ? "checked" : "" %>>
            <label for="female">��</label>
        </td>
        <tr>
            <th>�N��:</th>
            <td><input type="text" id="teacherAge" value="<%= ((Teacher) request.getAttribute("teacherInfo")).getAge() %>"></td>
        </tr>
        <tr>
        <th>�R�[�X:</th>
        <td>
            <select name="course" id="course" >
                <option value=""></option>
                <option <%= ((Teacher) request.getAttribute("teacherInfo")).getCourse().equals("�p��") ? "selected" : "" %>>�p��</option>
                <option <%= ((Teacher) request.getAttribute("teacherInfo")).getCourse().equals("���w") ? "selected" : "" %>>���w</option>
                <option <%= ((Teacher) request.getAttribute("teacherInfo")).getCourse().equals("���{��") ? "selected" : "" %>>���{��</option>
                <option <%= ((Teacher) request.getAttribute("teacherInfo")).getCourse().equals("����") ? "selected" : "" %>>����</option>
            </select>
         </td>
        </tr>

    </table>

        <button id="insertBtn">�X�V</button>
        <input type="reset" onclick="resetForm()" value ="���Z�b�g">
    </form>
</body>
</html>
