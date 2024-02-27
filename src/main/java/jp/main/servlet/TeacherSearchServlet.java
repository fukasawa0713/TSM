package jp.main.servlet;

import jp.main.GsonConverter;
import jp.main.base.JdbcTest;
import jp.main.service.TeacherService;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;

public class TeacherSearchServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        TeacherService teacherService = new TeacherService();
        PrintWriter out = null;
        Connection conn = null;
        try {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            out = response.getWriter(); // PrintWriter を初期化

            String teacherId = request.getParameter("id");
            String teacherName = request.getParameter("name");
            String course = request.getParameter("course");
            response.setContentType("application/json;charset=UTF-8");
            System.out.println(teacherId + "\t" + teacherName + "\t" + course);

            Map<String, Object> teacherList = teacherService.searchTeachers(teacherId, teacherName, course);

            String jsonResponse = GsonConverter.toJson(teacherList);
            // JSON形式のレスポンスを出力
            out.print(jsonResponse);
            out.flush();
        } catch (IOException e) {
            // 入出力例外の処理
            throw new RuntimeException("Error occurred while processing input/output", e);
        } catch (SQLException e) {
            // SQL例外の処理
            throw new RuntimeException("Error occurred while accessing database", e);
        } finally {
            // リソースのクローズ
            if (out != null) {
                out.close();
            }
            JdbcTest.closeConnection(conn);
        }
    }
}
