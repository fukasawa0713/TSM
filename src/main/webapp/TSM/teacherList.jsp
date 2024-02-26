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
    ���t�ԍ�:<input type="text" maxlength ="5" pattern ="^[0-9]*$" id="id" name="id" size="20">
    ���O�F<input type="text" name="name" id= "name" size="20">
    �R�[�X�F<select name="course" id = "course">
        <option value=""></option>
        <option>�p��</option>
        <option>���w</option>
        <option>���{��</option>
        <option>����</option>
    </select>
    <button type="submit">����</button>

</form>


<table id="resultTable">
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
            <form action = "<%=request.getContextPath()%>/UpdateSearchServlet" method ="GET">
                <input type="hidden" id="teacherId" name="teacherId" value="<%= teacher.getId() %>">
                <input type="submit"  name="teacherId" value="�X�V">
            </form>
            </td>
        </tr>
    <% } %>
    </tbody>
</table>

<script type="text/javascript">
    $(document).ready(function() {
        // �t�H�[�����M���̏���
        $('#searchForm').submit(function(event) {
            event.preventDefault(); // �f�t�H���g�̓�����L�����Z��

            let formData = $(this).serialize(); // �t�H�[���f�[�^���擾

            $.ajax({
                url: $(this).attr('action'), // �A�N�V���������̒l���擾
                type: $(this).attr('method'), // ���\�b�h�����̒l���擾
                data: formData, // �V���A���C�Y�����t�H�[���f�[�^���g�p
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
        // �X�V�{�^���N���b�N���̏���
        $(document).on('click', '.updateBtn', function() {
            // �X�V�{�^�����N���b�N���ꂽ�s�̃f�[�^���擾
            let row = $(this).closest('tr');
            let teacherId = row.find('td:eq(0)').text(); // ���t�ԍ����擾
            // �����ōX�V���������s����Ȃǂ̒ǉ��̏������s��

            console.log("Update teacher with ID: " + teacherId);
        });
    });

    // �������ʂ�\������֐�
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
                $('<td>').html('<button class="updateBtn">�X�V</button>').appendTo(row);
                row.appendTo(tableBody);
            });
        } else {
            console.error("Invalid teacherInfo format: Not an array");
        }
    }
</script>

</body>
</html>
