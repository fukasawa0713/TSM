package jp.main.servlet;


import jp.main.base.JdbcTest;

import jp.main.service.TeacherService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;


public class TeacherUpdateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        TeacherService teacherService = new TeacherService();
        Connection conn = null;
        try {
            request.setCharacterEncoding("shift_jis");
            response.setCharacterEncoding("shift_jis");


            int teacherId = Integer.parseInt(request.getParameter("id"));
            String teacherName = request.getParameter("name");
            String gender = request.getParameter("gender");
            int age = Integer.parseInt(request.getParameter("age"));
            String course = request.getParameter("course");

            boolean success = teacherService.UpdateTeacher(teacherId, teacherName, gender, age, course);
            if (success) {
                request.setAttribute("番号",teacherId);
                request.getRequestDispatcher("/TSM/teacherUpdateSuccess.jsp").forward(request,response);

            } else {
                request.setAttribute("errorMessage", "年齢は数値で入力してください。");
                request.getRequestDispatcher("/TSM/teacherUpdateFail.jsp").forward(request,response);
            }

        } catch (IOException | ServletException | SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcTest.closeConnection(conn);
        }
    }
}
