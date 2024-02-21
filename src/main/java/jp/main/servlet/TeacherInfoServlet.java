package jp.main.servlet;


import jp.main.base.JdbcTest;
import jp.main.model.Teacher;
import jp.main.service.TeacherService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class TeacherInfoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        TeacherService teacherService = new TeacherService();
        Connection conn = null;

        try {
            request.setCharacterEncoding("shift_jis");
            response.setCharacterEncoding("shift_jis");

            List<Teacher> teacherList = teacherService.getAllTeachers();

            request.setAttribute("teacherList", teacherList);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/TSM/teacherList.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException | IOException | ServletException e) {
            throw new RuntimeException(e);
        }finally {
            JdbcTest.closeConnection(conn);
        }
    }
}
