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
        teacherName = URLDecoder.decode(teacherName, "UTF-8"); // ���O�͓��{��̉\��������̂ŁAURL�f�R�[�h���K�v�ł�
    }
    String course = request.getParameter("course");

    List<Teacher> teacherList = ((List<Teacher>) request.getAttribute("teacherList"));
    request.setAttribute("teacherList", teacherList);

    int totalPages = ((Integer) request.getAttribute("totalPages"));
    int currentPage = ((Integer) request.getAttribute("currentPage"));
    String paginationUrl = (String) request.getAttribute("paginationUrl");

    // �������ʃy�[�W���ǂ����𔻒f����ϐ�
    boolean isSearchPage = true; // ���̒l��K�؂ɐݒ肷��K�v������܂�
    // �S�\���p�̃y�[�W���O�Ɋւ���ϐ�
    int totalAllPages = 10; // ���̒l�A�K�؂ɐݒ肵�Ă�������
    int currentAllPage = 1; // ���̒l�A�K�؂ɐݒ肵�Ă�������
    String allPaginationUrl = "/TeacherInfoServlet"; // �S�\���p�̃y�[�W���OURL�A�K�؂ɐݒ肵�Ă�������
%>
<form id="searchForm" action="<%=request.getContextPath()%>/TeacherSearchServlet" method="POST">
    ���t�ԍ�:<input type="text" maxlength="5" pattern="^[0-9]*$" id="id" name="id" size="20">
    ���O�F<input type="text" name="name" id="name" size="20">
    �R�[�X�F<select name="course" id="course">
        <option value=""></option>
        <option>�p��</option>
        <option>���w</option>
        <option>���{��</option>
        <option>����</option>
    </select>
    <button type="submit" id="searchBtn">����</button>
</form>


<table class="resultTable" id="resultTable">
    <thead>
    <tr>
        <th>���t�ԍ�</th>
        <th>���O</th>
        <th>����</th>
        <th>�N��</th>
        <th>�R�[�X</th>
        <th>����</th>
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
                    <input type="submit" name="teacherId" value="�X�V">
                </form>
            </td>
        </tr>
    <% } %>
    </tbody>
</table>

<ul class="pagination" id="pagination">
    <% if (isSearchPage) { %>
        <%-- �������ʕ\���y�[�W�p�̃y�[�W���O�R�[�h --%>
        <% for (int i = 1; i <= totalPages; i++) { %>
            <li class="page-item <%= (i == currentPage) ? "active" : "" %>">
                <a class="page-link" href="<%= request.getContextPath() + paginationUrl + "?page=" + i %>"><%= i %></a>
            </li>
        <% } %>
    <% } else { %>
        <%-- �S�\���p�̃y�[�W���O�R�[�h --%>
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
               alert("���Ȃ��Ƃ�1�̌�����������͂��Ă��������B");
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
       // �y�[�W�ԍ��̃����N���N���b�N�����Ƃ��̏���
       $(document).on('click', '.page-link', function(event) {
           event.preventDefault(); // �f�t�H���g�̃����N�N���b�N�C�x���g���L�����Z��

           // �N���b�N���ꂽ�y�[�W�ԍ����擾
           let pageNumber = $(this).text();

           // �y�[�W�ԍ��ɑΉ�����f�[�^���擾���ĕ\�����鏈�������s
           getDataForPage(pageNumber);
       });
   });

   // �y�[�W�ԍ��ɑΉ�����f�[�^���擾���ĕ\������֐�
   function getDataForPage(pageNumber) {
       let id = $('#id').val();
       let name = $('#name').val();
       let course = $('#course').val();

       // �T�[�o�[�ɑ΂���Ajax���N�G�X�g�𑗐M
       $.ajax({
           url: 'TeacherSearchServlet',
           type: 'POST',
           data: {
               id: id,
               name: name,
               course: course,
               page: pageNumber // �N���b�N���ꂽ�y�[�W�ԍ��𑗐M
           },
           dataType: 'json',
           success: function(response) {
               console.log(response);
               // �y�[�W�Ƀf�[�^��\�����鏈��
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
                  alert("���Ȃ��Ƃ�1�̌�����������͂��Ă��������B");
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
           let messageCell = $('<td colspan="6">').text("�Y�����͂���܂���ł���").appendTo(row);
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
               $('<button type="submit">�X�V</button>').appendTo(form);
               row.appendTo(tableBody);
           });
       } else {
           console.error("Invalid teacherInfo format: Not an array");
       }

       // �e�[�u���̓��e���X�V���邽�߂Ƀu���E�U�ɍĕ`��𑣂�
       tableBody.appendTo('#resultTable');
   }


   updatePaginationVisibility(<%= totalPages %>, "<%= paginationUrl %>", <%= currentPage %>);


</script>
<form action="<%=request.getContextPath()%>/TeacherInfoServlet" method="GET">
    <button type="submit">���t�ꗗ</button>
</form>
<form action="<%=request.getContextPath()%>/index.jsp" method="POST">
    <button type="submit">�g�b�v�y�[�W</button>
</form>
</body>
</html>
