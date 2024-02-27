package jp.main.servlet;

import jp.main.base.JdbcTest;
import jp.main.model.Teacher;
import jp.main.service.TeacherService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

public class TeacherCountServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        Connection conn = null;
        TeacherService teacherService = new TeacherService();

        try {
            // フォームから送信されたデータを取得
            int teacherId = Integer.parseInt(request.getParameter("teacherId"));
            String name = request.getParameter("teacherName");
            String gender = request.getParameter("gender");
            String age = request.getParameter("age");
            String course = request.getParameter("course");
            request.setAttribute("番号", teacherId);
            request.setAttribute("名前", name);
            request.setAttribute("性別", gender);
            request.setAttribute("年齢", age);
            request.setAttribute("コース", course);

            Teacher tc = teacherService.getInfoById(teacherId);
            if (tc == null) {
                // 指定された教師番号に対応する教師が見つからない場合の処理
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Teacher not found for ID: " + teacherId);
                return;
            }

            request.setAttribute("教師", tc.getId());
            request.setAttribute("教師名", tc.getName());
            request.setAttribute("教師性別", tc.getGender());
            request.setAttribute("年", tc.getAge());
            request.setAttribute("教科", tc.getCourse());

            request.getRequestDispatcher("/TSM/teacherUpdateConfirm.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            // 教師番号が数値ではない場合の処理
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid teacher ID format");
        } catch (SQLException e) {
            throw new ServletException("Error retrieving teacher information", e);
        } finally {
            JdbcTest.closeConnection(conn);
        }
    }
}
