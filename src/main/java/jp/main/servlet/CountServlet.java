package jp.main.servlet;

import jp.main.service.TeacherService;


import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.SQLException;

public class CountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Connection conn = null;
        PrintWriter out = null;
        TeacherService teacherService = new TeacherService();

        try {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");

            String teacherId = request.getParameter("id");
            response.setContentType("application/json:charset=UTF-8");

            boolean teacherExists = teacherService.countId(Integer.parseInt(teacherId));
            String jsonResponse = "{\"exists\": " + teacherExists + "}";

            out = response.getWriter();
            out.print(jsonResponse);
        } catch (UnsupportedEncodingException | SQLException e) {
            throw new RuntimeException(e);
        } finally {
            if (out != null) {
                out.close();
            }
        }
    }
}
