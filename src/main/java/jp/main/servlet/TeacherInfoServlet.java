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

            // ページング関連のパラメータを取得
            int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
            int pageSize = 10; // 1ページあたりのレコード数

            // ページングに応じた教師情報を取得
            List<Teacher> teacherList = teacherService.getTeachersPerPage(page, pageSize);

            // 全体のレコード数を取得
            int totalRecords = teacherService.getTotalTeachersCount();
            int totalPages = (int) Math.ceil((double) totalRecords / pageSize);

            request.setAttribute("teacherList", teacherList);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("currentPage", page);

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
