package jp.main.servlet;

import jp.main.GsonConverter;
import jp.main.base.JdbcTest;
import jp.main.model.Teacher;
import jp.main.service.TeacherService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class TeacherSearchServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        TeacherService teacherService = new TeacherService();
        Connection conn = null;
        PrintWriter out = null;

        try {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            out = response.getWriter();

            String teacherId = request.getParameter("id");
            String teacherName = request.getParameter("name");
            String course = request.getParameter("course");

            response.setContentType("application/json;charset=UTF-8");

            int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
            int pageSize = 10;

            // 検索結果の総数を取得
            int totalRecords = teacherService.getTotalMatchingTeachersCount(teacherId, teacherName, course);

            // 検索結果を取得し、ページング情報を追加
            Map<String, Object> teacherList = teacherService.searchTeachers(teacherId, teacherName, course, page, pageSize);
            int totalPages = (int) Math.ceil((double) totalRecords / pageSize);
            teacherList.put("totalPages", totalPages);
            teacherList.put("currentPage", page);
            teacherList.put("paginationUrl", "TeacherSearchServlet");
            request.setAttribute("teacherInfo", teacherList);




            // JSONレスポンスを送信
            String jsonResponse = GsonConverter.toJson(teacherList);
            out.print(jsonResponse);
            out.flush();

        } catch (IOException | SQLException e) {
            throw new ServletException("Error occurred while processing request", e);
        } finally {
            if (out != null) {
                out.close();
            }
            JdbcTest.closeConnection(conn);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        TeacherService teacherService = new TeacherService();
        Connection conn = null;
        PrintWriter out = null;

        try {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            out = response.getWriter();

            String teacherId = request.getParameter("id");
            String teacherName = request.getParameter("name");
            String course = request.getParameter("course");

            response.setContentType("application/json;charset=UTF-8");

            int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
            int pageSize = 10;

            // 検索結果の総数を取得
            int totalRecords = teacherService.getTotalMatchingTeachersCount(teacherId, teacherName, course);

            // 検索結果を取得し、ページング情報を追加
            Map<String, Object> teacherList = teacherService.searchTeachers(teacherId, teacherName, course, page, pageSize);
            int totalPages = (int) Math.ceil((double) totalRecords / pageSize);
            teacherList.put("totalPages", totalPages);
            teacherList.put("currentPage", page);
            teacherList.put("paginationUrl", "TeacherSearchServlet");

            // JSONレスポンスを送信
            String jsonResponse = GsonConverter.toJson(teacherList);
            out.print(jsonResponse);
            out.flush();

        } catch (IOException | SQLException e) {
            throw new ServletException("Error occurred while processing request", e);
        } finally {
            if (out != null) {
                out.close();
            }
            JdbcTest.closeConnection(conn);
        }
    }

}
