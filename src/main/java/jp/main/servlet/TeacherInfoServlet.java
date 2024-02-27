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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        TeacherService teacherService = new TeacherService();
        Connection conn = null;

        try {
            request.setCharacterEncoding("shift_jis");
            response.setCharacterEncoding("shift_jis");

            List<Teacher> teacherList = teacherService.getAllTeachers();

            request.setAttribute("teacherList", teacherList);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/TSM/teacherList.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            // SQL に関するエラーの処理
            throw new ServletException("Error fetching teacher information", e);
        } catch (IOException e) {
            // 入出力に関するエラーの処理
            throw new IOException("Error in input/output", e);
        } catch (ServletException e) {
            // サーブレットに関するエラーの処理
            throw new ServletException("Servlet exception occurred", e);
        } finally {
            // finally ブロックでコネクションをクローズ
            JdbcTest.closeConnection(conn);
        }
    }
}
