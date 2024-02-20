<%@ page language="java" contentType="text/html;charset=Shift_JIS" %>
<html>
<head>
<h1>教師情報更新</h1>
</head>
<body>
<%
    request.setCharacterEncoding("Shift_JIS");
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
    <form>
        教師番号:<input type ="text" name ="sid" size ="20"><br>
        名前：<input type="text" name="name" size="20"><br>
        性別:<input type="radio" name="gender" value="男">男
            <input type="radio" name="gender" value="女">女<br>
        年齢：<input type ="text" name ="age" size ="20"><br>
        コース:<input type = "text" name = "course" size="20"><br>
        <button id = "insertBtn">更新</button>
        <button id ="resetBtn">リセット</button>
    </form>
</body>
</html>
