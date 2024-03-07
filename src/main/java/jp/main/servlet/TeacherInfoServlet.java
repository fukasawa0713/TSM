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
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");

            int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
            int pageSize = 10;

            List<Teacher> teacherList = teacherService.getTeachersPerPage(page, pageSize);
            int totalRecords = teacherService.getTotalTeachersCount();
            int totalPages = (int) Math.ceil((double) totalRecords / pageSize);

            request.setAttribute("paginationUrl", "TeacherInfoServlet");
            request.setAttribute("teacherList", teacherList);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("currentPage", page);


            RequestDispatcher dispatcher = request.getRequestDispatcher("/TSM/teacherList.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            throw new ServletException("Error fetching teacher information", e);
        } finally {
            JdbcTest.closeConnection(conn);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        TeacherService teacherService = new TeacherService();
        Connection conn = null;

        try {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");

            int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
            int pageSize = 10;

            List<Teacher> teacherList = teacherService.getTeachersPerPage(page, pageSize);
            int totalRecords = teacherService.getTotalTeachersCount();
            int totalPages = (int) Math.ceil((double) totalRecords / pageSize);

            request.setAttribute("paginationUrl", "TeacherInfoServlet");
            request.setAttribute("teacherList", teacherList);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("currentPage", page);


            RequestDispatcher dispatcher = request.getRequestDispatcher("/TSM/teacherList.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            throw new ServletException("Error fetching teacher information", e);
        } finally {
            JdbcTest.closeConnection(conn);
        }
    }

}
