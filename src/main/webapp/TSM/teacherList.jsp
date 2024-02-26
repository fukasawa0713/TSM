<%@ page language="java" contentType="text/html;charset=shift_jis" %>
<%@ page import="java.util.List" %>
<%@ page import="jp.main.model.Teacher" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/TSM/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<%@ include file = "head.jsp"%>
<%
    request.setCharacterEncoding("Shift_JIS");
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

    List<Teacher> teacherList = ((List<Teacher>) request.getAttribute("teacherList"));
    request.setAttribute("teacherList",teacherList);
%>
<form id="searchForm" action="<%=request.getContextPath()%>/TeacherSearchServlet" method="GET" >
    教師番号:<input type="text" maxlength ="5" pattern ="^[0-9]*$" id="id" name="id" size="20">
    名前：<input type="text" name="name" id= "name" size="20">
    コース：<select name="course" id = "course">
        <option value=""></option>
        <option>英語</option>
        <option>数学</option>
        <option>日本語</option>
        <option>中文</option>
    </select>
    <button type="submit">検索</button>

</form>


<table id="resultTable">
    <thead>
    <tr>
        <th>教師番号</th>
        <th>名前</th>
        <th>性別</th>
        <th>年齢</th>
        <th>コース</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <% for (Teacher teacher : teacherList) { %>
        <tr>
            <td><%= teacher.getId() %></td>
            <td><%= teacher.getName() %></td>
            <td><%= teacher.getGender() %></td>
            <td><%= teacher.getAge() %></td>
            <td><%= teacher.getCourse() %></td>
            <td>
            <form action = "<%=request.getContextPath()%>/UpdateSearchServlet" method ="GET">
                <input type="hidden" id="teacherId" name="teacherId" value="<%= teacher.getId() %>">
                <input type="submit"  name="teacherId" value="更新">
            </form>
            </td>
        </tr>
    <% } %>
    </tbody>
</table>

<script type="text/javascript">
    $(document).ready(function() {
        // フォーム送信時の処理
        $('#searchForm').submit(function(event) {
            event.preventDefault(); // デフォルトの動作をキャンセル

            let formData = $(this).serialize(); // フォームデータを取得

            $.ajax({
                url: $(this).attr('action'), // アクション属性の値を取得
                type: $(this).attr('method'), // メソッド属性の値を取得
                data: formData, // シリアライズしたフォームデータを使用
                dataType: 'json',
                success: function(response) {
                    console.log(response);
                    searchTable(response.teacherInfo);
                },
                error: function(xhr, status, error) {
                    console.error("Error:", status, error);
                }
            });
        });
        // 更新ボタンクリック時の処理
        $(document).on('click', '.updateBtn', function() {
            // 更新ボタンがクリックされた行のデータを取得
            let row = $(this).closest('tr');
            let teacherId = row.find('td:eq(0)').text(); // 教師番号を取得
            // ここで更新処理を実行するなどの追加の処理を行う

            console.log("Update teacher with ID: " + teacherId);
        });
    });

    // 検索結果を表示する関数
    function searchTable(teacherInfo) {
        let tableBody = $('#resultTable tbody');
        tableBody.empty();

        if ($.isArray(teacherInfo)) {
            $.each(teacherInfo, function(index, teacher) {
                let row = $('<tr>');
                $('<td>').text(teacher.id).appendTo(row);
                $('<td>').text(teacher.name).appendTo(row);
                $('<td>').text(teacher.gender).appendTo(row);
                $('<td>').text(teacher.age).appendTo(row);
                $('<td>').text(teacher.course).appendTo(row);
                $('<td>').html('<button class="updateBtn">更新</button>').appendTo(row);
                row.appendTo(tableBody);
            });
        } else {
            console.error("Invalid teacherInfo format: Not an array");
        }
    }
</script>

</body>
</html>
