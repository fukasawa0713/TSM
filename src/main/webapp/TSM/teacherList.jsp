<%@ page language="java" contentType="text/html;charset=Shift_JIS" %>
<html>
<head>
<h1>教師情報</h1>
</head>
<body>
<%
    request.setCharacterEncoding("Shift_JIS");
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
        <form action>
           教師番号:<input type ="text" name ="id" size ="20">
           名前：<input type="text" name="name" size="20">
           コース：<input type ="text" name ="course" size ="20">
           <button id = "searchBtn">検索</button>
        </form>
        <table>
            <tr>
                <th>教師番号</th>
                <th>名前</th>
                <th>性別</th>
                <th>年齢</th>
                <th>コース</th>
                <th>操作</th>
            </tr>
            <tr>
                <td><span id="id"></span></td>
                <td><span id="name"></span></td>
                <td><span id="gender"></span></td>
                <td><span id="age"></span></td>
                <td><span id="course"></span></td>
                <td><button id = "updateBtn">更新</button></td>
            </tr>


        </table>




</body>
</html>
