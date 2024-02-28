<%@ page language="java" contentType="text/html;charset=Shift_JIS" %>
<%@ page import="jp.main.model.Teacher" %>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<h1>教師情報更新</h1>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/TSM/style.css">
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
            <th>教師番号:</th>
            <td><input type="text" id="teacherId" name="teacherId" value="<%= ((Teacher) request.getAttribute("teacherInfo")).getId() %>" readonly></td>
        </tr>
        <tr>
            <th>名前:</th>
            <td><input type="text" name ="teacherName" id="teacherName" value="<%= ((Teacher) request.getAttribute("teacherInfo")).getName() %>"></td>
        </tr>
        <td class ="gender">
            <input type="radio" name="gender" id="male"  value="男" <%= ((Teacher) request.getAttribute("teacherInfo")).getGender().equals("男") ? "checked" : "" %>>
            <label for="male">男</label>
            <input type="radio" name="gender" id="female"  value="女" <%= ((Teacher) request.getAttribute("teacherInfo")).getGender().equals("女") ? "checked" : "" %>>
            <label for="female">女</label>
        </td>
        <tr>
            <th>年齢:</th>
            <td><input type="text" pattern="^[0-9]*$" name = "age" id="teacherAge" value="<%= ((Teacher) request.getAttribute("teacherInfo")).getAge() %>" title = "半角数字で入力してください"></td>
        </tr>
        <tr>
        <th>コース:</th>
        <td>
            <select name="course" id="course" >
                <option value=""></option>
                <option <%= ((Teacher) request.getAttribute("teacherInfo")).getCourse().equals("英語") ? "selected" : "" %>>英語</option>
                <option <%= ((Teacher) request.getAttribute("teacherInfo")).getCourse().equals("数学") ? "selected" : "" %>>数学</option>
                <option <%= ((Teacher) request.getAttribute("teacherInfo")).getCourse().equals("日本語") ? "selected" : "" %>>日本語</option>
                <option <%= ((Teacher) request.getAttribute("teacherInfo")).getCourse().equals("中文") ? "selected" : "" %>>中文</option>
            </select>
         </td>
        </tr>

    </table>

        <button id="insertBtn">更新</button>
        <input type="reset" onclick="resetForm()" value ="リセット">
    </form>
    <form action ="<%=request.getContextPath()%>/index.jsp" method ="POST" >
        <button type = "submit">トップページ</button>
    </form>
</body>
</html>
