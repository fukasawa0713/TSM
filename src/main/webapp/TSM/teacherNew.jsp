<%@ page language="java" contentType="text/html;charset=Shift_JIS" %>
<html>
<head>
<h1>���t���o�^</h1>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
    .error-message {
        color: red;
        display: inline-block;
        margin-left: 10px; /* Adjust the margin as needed */
    }
</style>
</head>
<body>
<%
    request.setCharacterEncoding("Shift_JIS");
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

    <form name="newForm" id="teacherForm" action="<%=request.getContextPath()%>/TeacherInsertServlet" method="POST">
         ���t�ԍ�:<input type="text" maxlength="5" pattern="^[0-9]*$" name="id" id="id" required title = "���p�����œ��͂��Ă�������"�@size="20"><sub>*</sub>
         <div id="errorMessage" class="error-message"></div> <!-- Message container next to the input -->
         <br>
         ���O�F<input type="text" name="name" id="name" required size="20"><sub>*</sub><br>
         ����:<input type="radio" name="gender" id="gender" required value="�j">�j
             <input type="radio" name="gender" id="gender" required value="��">��<sub>*</sub><br>
         �N��F<input type="text" pattern="^[0-9]*$"  name="age" id="age" required title = "���p�����œ��͂��Ă�������"�@size="20"><sub>*</sub><br>
         �R�[�X�F<select name="course" id="course" required >
                 <option value=""></option>
                 <option>�p��</option>
                 <option>���w</option>
                 <option>���{��</option>
                 <option>����</option>
         </select>
         *�󂪂��Ă��鍀�ڂ͕K�{���ڂł��B<br>
         <button id="insertBtn">�o�^</button>
         <input type="reset" id="resetBtn" value="���Z�b�g">
    </form>

<script>
$(document).ready(function() {
    $("#id").blur(function() {
        var teacherId = $(this).val();
        if (teacherId === "") {
            // If ID is empty, enable the registration button and clear error message
            $("#errorMessage").text("");
            $("#insertBtn").prop("disabled", false);
            return;
        }
        $.ajax({
            url: "<%=request.getContextPath()%>/CountServlet", // Correct servlet URL
            type: "GET",
            data: { id: teacherId },
            success: function(response) {
                // Handle the response from the server
                if (response === "true") {
                    $("#errorMessage").text("���t�ԍ��͊��ɑ��݂��܂��B"); // Display error message
                    $("#insertBtn").prop("disabled", true); // Disable the registration button
                } else {
                    $("#errorMessage").text(""); // Clear error message if teacher ID is unique
                    $("#insertBtn").prop("disabled", false); // Enable the registration button
                }
            },
            error: function(xhr, status, error) {
                console.error(status, error);
            }
        });
    });

    $("#resetBtn").click(function() {
        // When the reset button is clicked, clear all form fields and error message
        $("#teacherForm")[0].reset();
        $("#errorMessage").text("");
        $("#insertBtn").prop("disabled", false);
    });
});
</script>

</body>
</html>
