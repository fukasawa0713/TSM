<%@ page language="java" contentType="text/html;charset=shift_jis" %>
<%@ page import="java.util.List" %>
<%@ page import="jp.main.model.Teacher" %>
<%@ page import="java.net.URLDecoder" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="/TSM/style.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .example li {display:inline;}
    </style>

    <script src="https://code.jquery.com/jquery-3.6.0.js"
            integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>
<%@ include file="head.jsp"%>
<%
    request.setCharacterEncoding("Shift_JIS");
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

    String teacherId = request.getParameter("id");
    String teacherName = request.getParameter("name");
    if (teacherName != null) {
        teacherName = URLDecoder.decode(teacherName, "UTF-8"); // 名前は日本語の可能性があるので、URLデコードが必要です
    }
    String course = request.getParameter("course");

    List<Teacher> teacherList = ((List<Teacher>) request.getAttribute("teacherList"));
    request.setAttribute("teacherList", teacherList);

    int totalPages = ((Integer) request.getAttribute("totalPages"));
    int currentPage = ((Integer) request.getAttribute("currentPage"));
    String paginationUrl = (String) request.getAttribute("paginationUrl");

    // 検索結果ページかどうかを判断する変数
    boolean isSearchPage = true; // この値を適切に設定する必要があります
    // 全表示用のページングに関する変数
    int totalAllPages = 10; // 仮の値、適切に設定してください
    int currentAllPage = 1; // 仮の値、適切に設定してください
    String allPaginationUrl = "/TeacherInfoServlet"; // 全表示用のページングURL、適切に設定してください
%>
<form id="searchForm" action="<%=request.getContextPath()%>/TeacherSearchServlet" method="POST">
    教師番号:<input type="text" maxlength="5" pattern="^[0-9]*$" id="id" name="id" size="20">
    名前：<input type="text" name="name" id="name" size="20">
    コース：<select name="course" id="course">
        <option value=""></option>
        <option>英語</option>
        <option>数学</option>
        <option>日本語</option>
        <option>中文</option>
    </select>
    <button type="submit" id="searchBtn">検索</button>
</form>


<table class="resultTable" id="resultTable">
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
                <form action="<%=request.getContextPath()%>/UpdateSearchServlet" method="POST">
                    <input type="hidden" id="teacherId" name="teacherId" value="<%= teacher.getId() %>">
                    <input type="submit" name="teacherId" value="更新">
                </form>
            </td>
        </tr>
    <% } %>
    </tbody>
</table>

<ul class="pagination" id="pagination">
    <% if (isSearchPage) { %>
        <%-- 検索結果表示ページ用のページングコード --%>
        <% for (int i = 1; i <= totalPages; i++) { %>
            <li class="page-item <%= (i == currentPage) ? "active" : "" %>">
                <a class="page-link" href="<%= request.getContextPath() + paginationUrl + "?page=" + i %>"><%= i %></a>
            </li>
        <% } %>
    <% } else { %>
        <%-- 全表示用のページングコード --%>
        <% for (int i = 1; i <= totalAllPages; i++) { %>
            <li class="page-item <%= (i == currentAllPage) ? "active" : "" %>">
                <a class="page-link" href="<%= request.getContextPath() + allPaginationUrl + "?page=" + i %>"><%= i %></a>
            </li>
        <% } %>
    <% } %>
</ul>



<script type="text/javascript">
   $(document).ready(function () {
       $('#searchForm').submit(function (event) {
           event.preventDefault();

           let id = $('#id').val();
           let name = $('#name').val();
           let course = $('#course').val();

           if (id === '' && name === '' && course === '') {
               alert("少なくとも1つの検索条件を入力してください。");
           } else {
               $.ajax({
                   url: $(this).attr('action'),
                   type: $(this).attr('method'),
                   data: $(this).serialize(),
                   dataType: 'json',
                   success: function (response) {
                       console.log(response);
                       searchTable(response.teacherInfo);
                       updatePaginationVisibility(response.totalPages, response.paginationUrl, response.currentPage);
                   },
                   error: function (xhr, status, error) {
                       console.error("Error:", status, error);
                   }
               });
           }
       });
   });

   $(document).ready(function () {
   $(document).ready(function() {
       // ページ番号のリンクをクリックしたときの処理
       $(document).on('click', '.page-link', function(event) {
           event.preventDefault(); // デフォルトのリンククリックイベントをキャンセル

           // クリックされたページ番号を取得
           let pageNumber = $(this).text();

           // ページ番号に対応するデータを取得して表示する処理を実行
           getDataForPage(pageNumber);
       });
   });

   // ページ番号に対応するデータを取得して表示する関数
   function getDataForPage(pageNumber) {
       let id = $('#id').val();
       let name = $('#name').val();
       let course = $('#course').val();

       // サーバーに対してAjaxリクエストを送信
       $.ajax({
           url: 'TeacherSearchServlet',
           type: 'POST',
           data: {
               id: id,
               name: name,
               course: course,
               page: pageNumber // クリックされたページ番号を送信
           },
           dataType: 'json',
           success: function(response) {
               console.log(response);
               // ページにデータを表示する処理
               searchTable(response.teacherInfo);
               updatePaginationVisibility(response.totalPages, response.paginationUrl, response.currentPage);
           },
           error: function(xhr, status, error) {
               console.error("Error:", status, error);
           }
       });
   }



          $('#searchForm').submit(function (event) {
              event.preventDefault();

              let id = $('#id').val();
              let name = $('#name').val();
              let course = $('#course').val();

              if (id === '' && name === '' && course === '') {
                  alert("少なくとも1つの検索条件を入力してください。");
              } else {
                  $.ajax({
                      url: $(this).attr('action'),
                      type: $(this).attr('method'),
                      data: $(this).serialize(),
                      dataType: 'json',
                      success: function (response) {
                          console.log(response);
                          searchTable(response.teacherInfo);
                          updatePaginationVisibility(response.totalPages, response.paginationUrl, response.currentPage);
                      },
                      error: function (xhr, status, error) {
                          console.error("Error:", status, error);
                      }
                  });
              }
          });
      });

   function updatePaginationVisibility(totalPages, paginationUrl, currentPage) {
       let pagination = $('#pagination');
       pagination.empty();
       for (let i = 1; i <= totalPages; i++) {
           pagination.append('<li class="page-item ' + (i === currentPage ? 'active' : '') + '"><a class="page-link" href="' + '<%= request.getContextPath() %>' + paginationUrl + '?page=' + i + '">' + i + '</a></li>');
       }
   }

   function searchTable(teacherInfo) {
       let tableBody = $('#resultTable tbody');
       tableBody.empty();

       if (teacherInfo === null || teacherInfo.length === 0) {
           let row = $('<tr>');
           let messageCell = $('<td colspan="6">').text("該当情報はありませんでした").appendTo(row);
           row.appendTo(tableBody);
       } else if ($.isArray(teacherInfo)) {
           $.each(teacherInfo, function (index, teacher) {
               let row = $('<tr>');
               $('<td>').text(teacher.id).appendTo(row);
               $('<td>').text(teacher.name).appendTo(row);
               $('<td>').text(teacher.gender).appendTo(row);
               $('<td>').text(teacher.age).appendTo(row);
               $('<td>').text(teacher.course).appendTo(row);
               let form = $('<form action="<%=request.getContextPath()%>/UpdateSearchServlet" method="POST">').appendTo($('<td>').appendTo(row));
               $('<input type="hidden" id="teacherId" name="teacherId" value="' + teacher.id + '">').appendTo(form);
               $('<button type="submit">更新</button>').appendTo(form);
               row.appendTo(tableBody);
           });
       } else {
           console.error("Invalid teacherInfo format: Not an array");
       }

       // テーブルの内容を更新するためにブラウザに再描画を促す
       tableBody.appendTo('#resultTable');
   }


   updatePaginationVisibility(<%= totalPages %>, "<%= paginationUrl %>", <%= currentPage %>);


</script>
<form action="<%=request.getContextPath()%>/TeacherInfoServlet" method="GET">
    <button type="submit">教師一覧</button>
</form>
<form action="<%=request.getContextPath()%>/index.jsp" method="POST">
    <button type="submit">トップページ</button>
</form>
</body>
</html>
