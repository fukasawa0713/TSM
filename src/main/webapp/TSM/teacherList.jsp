<%@ page language="java" contentType="text/html;charset=Shift_JIS" %>
<html>
<head>
<script src = "https://code.jquery.com/jquery-3.6.0.min.js"></script>
<h1>���t���</h1>
</head>
<body>
<%
    request.setCharacterEncoding("Shift_JIS");
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
        <form action�@="<%=request.getContextPath()%>servlet/TeacherSearch" method ="POST">
           ���t�ԍ�:<input type ="text" name ="id" size ="20">
           ���O�F<input type="text" name="name" size="20">
           �R�[�X�F<select name = "course">
                    <option value =""></option>
                    <option>�p��</option>
                    <option>���w</option>
                    <option>���{��</option>
                  </select>
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
            <tbody id = "resultTable">
                <td><span id="id"></span></td>
                <td><span id="name"></span></td>
                <td><span id="gender"></span></td>
                <td><span id="age"></span></td>
                <td><span id="course"></span></td>
                <td><button id = "updateBtn">�X�V</button></td>
             </tbody>
            </tr>
        </table>
<script type = "text/javascript">
    $(document).ready(function)){
        $ajax({
            type: 'POST',
            url:'TeacherSearch',
            data:
            success:function(response){
                console.log(response);
                if(response &&response.
        }

        function updateTable()




</body>
</html>
