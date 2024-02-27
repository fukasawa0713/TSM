<%@ page language="java" contentType="text/html;charset=Shift_JIS" %>
<html>
<head>
<h1>教師情報登録</h1>
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
         教師番号:<input type ="text" maxlength="5" pattern = "^[0-9]*$" name ="id" id ="id" required size ="20"><sub>*</sub><br>
         名前：<input type="text" name="name" id ="name" required size="20"><sub>*</sub><br>
         性別:<input type="radio" name="gender" id ="gender" required value="男">男
             <input type="radio" name="gender" id ="gender" required value="女">女<sub>*</sub><br>
         年齢：<input type ="text" name ="age" id ="age" required size ="20"><sub>*</sub><br>
         コース：<select name="course" id = "course" required >
                 <option value=""></option>
                 <option>英語</option>
                 <option>数学</option>
                 <option>日本語</option>
                 <option>中文</option>
         </select>
         *印がついている項目は必須項目です。<br>
         <button id = "insertBtn">登録</button>
         <input type ="reset" value = "リセット">
    </form>
</body>
</html>
