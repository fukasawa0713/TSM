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
import java.util.Objects;

public class TeacherCountServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("Shift_JIS");
        response.setCharacterEncoding("Shift_JIS");
        Connection conn = null;

        // フォームから送信されたデータを取得
        int teacherId = Integer.parseInt(request.getParameter("teacherId"));
        String name = request.getParameter("teacherName");
        String gender = request.getParameter("gender");
        String age = request.getParameter("age");
        String course = request.getParameter("course");

        TeacherService teacherService = new TeacherService();
        try {
            // 既存のIDが存在するか確認
            boolean idExists = teacherService.countId(teacherId);

            if(idExists) {
                Teacher success = teacherService.getInfoById(teacherId);
                if (!Objects.equals(success.getName(), name)){
                    request.setAttribute("名前",name);
                }else {

                }
                if(!Objects.equals(success.getGender(), gender)){
                    request.setAttribute("性別",gender);
                }else {

                }
                if(!Objects.equals(success.getAge(), age)){
                    request.setAttribute("年齢",age);
                }else {

                }
                if(!Objects.equals(success.getCourse(), course)){
                    request.setAttribute("コース",course);
                }
                RequestDispatcher dispatcher = request.getRequestDispatcher("/TSM/teacherUpdateConfirm.jsp");
                dispatcher.forward(request, response);

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcTest.closeConnection(conn);
        }
    }
}
