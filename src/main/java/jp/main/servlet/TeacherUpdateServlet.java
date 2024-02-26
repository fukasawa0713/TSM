package jp.main.servlet;


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


public class TeacherUpdateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        TeacherService teacherService = new TeacherService();
        Connection conn = null;
        try {
            request.setCharacterEncoding("shift_jis");
            response.setCharacterEncoding("shift_jis");


            int teacherId = Integer.parseInt(request.getParameter("teacherId"));
            String teacherName = request.getParameter("teacherName");
            String gender = request.getParameter("gender");
            int age = Integer.parseInt(request.getParameter("age"));
            String course = request.getParameter("course");

            TeacherService teacher =new TeacherService();

            boolean success = teacher.UpdateTeacher(teacherId,teacherName, gender, age, course);
            if(success){
                request.getRequestDispatcher("/TSM/teacherUpdateConfirm.jsp").forward(request,response);
            }


        } catch (IOException | SQLException | ServletException e) {
            throw new RuntimeException(e);
        }
    }
}
