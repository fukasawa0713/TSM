package jp.main.servlet;

import jp.main.service.TeacherService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

public class TeacherInsertServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        TeacherService teacherService = new TeacherService();
        Connection conn = null;
        try {
            request.setCharacterEncoding("shift_jis");
            response.setCharacterEncoding("shift_jis");



        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
