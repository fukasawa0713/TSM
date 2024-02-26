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

public class TeacherInsertServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("Shift_JIS");
        response.setCharacterEncoding("Shift_JIS");

        // フォームから送信されたデータを取得
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        int age = Integer.parseInt(request.getParameter("age"));
        String course = request.getParameter("course");

        TeacherService teacherService = new TeacherService();



        try {
            // 既存のIDが存在するか確認
            boolean idExists = teacherService.countId(id);

            if (!idExists) {
                // インサート処理を呼び出し、結果を受け取る
                boolean success = teacherService.InsertTeacher(id, name, age, gender, course);
                if (success) {
                    try {
                        Teacher tc = teacherService.getInfoById(id);
                        request.setAttribute("教師番号",tc.getId());
                        request.setAttribute("名前",tc.getName());
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                    request.getRequestDispatcher("/TSM/teacherNewSuccess.jsp").forward(request,response);

                } else {
                    try {
                        Teacher tc = teacherService.getInfoById(id);
                        request.setAttribute("教師番号",tc.getId());
                        request.setAttribute("名前",tc.getName());
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }

                    request.getRequestDispatcher("/TSM/teacherNewSuccess.jsp").forward(request,response);

                }
            } else {
                // 既存のIDが存在する場合は失敗ページにリダイレクト
                response.sendRedirect(request.getContextPath() + "/TSM/teacherNewFail.jsp");
            }
        } catch (SQLException e) {
            throw new ServletException("Error inserting teacher data", e);
        }
    }


}

