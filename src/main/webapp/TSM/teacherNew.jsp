<%@ page language="java" contentType="text/html;charset=Shift_JIS" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/TSM/style.css">
<h1>教師情報登録</h1>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<%
    request.setCharacterEncoding("Shift_JIS");
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

    <form name="newForm" id="teacherForm" action="<%=request.getContextPath()%>/TeacherInsertServlet" method="POST">
         教師番号:<input type="text" maxlength="5" pattern="^[0-9]*$" name="id" id="id" required title = "半角数字で入力してください"　size="20"><sub class ="sub">*</sub>
         <div id="errorMessage" class="error-message"></div> <!-- Message container next to the input -->
         <br>
         名前：<input type="text" name="name" id="name" required size="20"><sub class ="sub">*</sub><br>
         性別:<input type="radio" name="gender" id="gender" required value="男">男
             <input type="radio" name="gender" id="gender" required value="女">女<sub class ="sub">*</sub><br>
         年齢：<input type="text" pattern="^[0-9]*$"  name="age" id="age" required title = "半角数字で入力してください"　size="20"><sub class ="sub">*</sub><br>
         コース：<select name="course" id="course" required >
                 <option value=""></option>
                 <option>英語</option>
                 <option>数学</option>
                 <option>日本語</option>
                 <option>中文</option>
         </select><sub class ="sub">*</sub><br>
         *印がついている項目は必須項目です。<br>
         <button id="insertBtn">登録</button>
         <input type="reset" id="resetBtn" value="リセット">
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
                    $("#errorMessage").text("教師番号は既に存在します。"); // Display error message
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
<form action ="<%=request.getContextPath()%>/index.jsp" method ="POST" >
    <button type = "submit">トップページ</button>
</form>

</body>
</html>
llll
