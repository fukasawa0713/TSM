package jp.main.servlet;

import jp.main.GsonConverter;
import jp.main.base.JdbcTest;
import jp.main.model.Teacher;
import jp.main.service.TeacherService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;

public class UpdateSearchServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        TeacherService teacherService = new TeacherService();
        PrintWriter out = null;
        Connection conn = null;
        try {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            out = response.getWriter(); // PrintWriter を初期化

            String teacherId = request.getParameter("teacherId");
            response.setContentType("application/json;charset=UTF-8");
            System.out.println(teacherId);

            Teacher teacher = teacherService.getInfoById(Integer.parseInt(teacherId));
            request.setAttribute("teacherInfo", teacher);

            request.getRequestDispatcher("/TSM/teacherUpdate.jsp").forward(request, response);

        } catch (IOException e) {
            // 入出力例外の処理
            throw new RuntimeException("Error occurred while processing input/output", e);
        } catch (SQLException e) {
            // SQL例外の処理
            // エラーメッセージとともにリダイレクトする
            String errorMessage = "Error occurred while accessing database: " + e.getMessage();
            request.setAttribute("errorMessage", errorMessage);
            response.sendRedirect(request.getContextPath() + "/errorPage.jsp");
        } catch (ServletException e) {
            // サーブレット例外の処理
            throw new RuntimeException("Servlet exception occurred", e);
        } finally {
            // リソースのクローズ
            if (out != null) {
                out.close();
            }
            JdbcTest.closeConnection(conn);
        }
    }
}
