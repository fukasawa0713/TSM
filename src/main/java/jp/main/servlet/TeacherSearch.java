package jp.main.servlet;


import jp.main.model.Teacher;
import jp.main.service.TeacherService;


import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

public class TeacherSearch extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        TeacherService teacherService = new TeacherService();
        Connection conn = null;
        try {
            request.setCharacterEncoding("shift_jis");
            response.setCharacterEncoding("shift_jis");

            String id = request.getParameter("id");
            Teacher tc = teacherService.getInfoById(id);

            request.setAttribute("teacher",tc);



        } catch (SQLException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}
