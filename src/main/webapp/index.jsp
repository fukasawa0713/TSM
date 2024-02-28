<%@ page language="java" contentType="text/html;charset=Shift_JIS" %>
<html>
<head>
<style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            margin-top: 20px;
            color: #007bff; /* Blue color for the heading */
        }

        p {
            text-align: center;
            margin-top: 10px;
        }

        a {
            display: inline-block;
            text-decoration: none;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border-radius: 5px;
            margin-bottom: 10px;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }
    </style>

  <h1> ã≥étèÓïÒä«óù</h1>
</head>
<body>
<%
    request.setCharacterEncoding("Shift_JIS");
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
    <p><a href="<%=request.getContextPath()%>/TeacherInfoServlet" method ="GET">ã≥étèÓïÒ</a></p>
    <p><a href="<%=request.getContextPath()%>/TSM/teacherNew.jsp">ã≥étìoò^</a></p>
</body>
</html>
