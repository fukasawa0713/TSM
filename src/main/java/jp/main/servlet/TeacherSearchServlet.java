package jp.main.servlet;

import jp.main.GsonConverter;
import jp.main.base.JdbcTest;
import jp.main.service.TeacherService;
import jp.main.model.Teacher;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class TeacherSearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        TeacherService teacherService = new TeacherService();
        PrintWriter out = null;
        Connection conn = null;
        try {
            request.setCharacterEncoding("shift_jis"); // 文字コードをUTF-8に設定
            response.setCharacterEncoding("shift_jis");
            out = response.getWriter(); // PrintWriter を初期化

            String teacherId = request.getParameter("id");
            response.setContentType("application/json;charset=UTF-8");

            List<Teacher> teacherList = teacherService.searchTeachers(teacherId);


            String jsonResponse = GsonConverter.toJson(teacherList);
            // JSON形式のレスポンスを出力
            out.print(jsonResponse);
            out.flush();
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            if (out != null) {
                out.close();
            }
            JdbcTest.closeConnection(conn);
        }
    }
}
