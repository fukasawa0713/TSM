package jp.main.servlet;

import jp.main.service.TeacherService;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

public class CountServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        Connection conn = null;
        PrintWriter out = null;
        TeacherService teacherService = new TeacherService();

        try {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            out = response.getWriter();

            String teacherId = request.getParameter("id");
            System.out.println(teacherId);

            boolean teacherExists = teacherService.countId(Integer.parseInt(teacherId));
            out.print(teacherExists); // Send the response back to the client

        } catch (IOException | SQLException e) {
            throw new RuntimeException(e);
        } finally {
            if (out != null) {
                out.close();
            }
        }
    }
}
