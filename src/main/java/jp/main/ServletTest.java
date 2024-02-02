package jp.main;

import jp.main.model.Student;
import jp.main.service.StudentService;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class ServletTest extends HttpServlet {

    StudentService studentService = new StudentService();
    // 空のServlet
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            // 文字コードを設定する
            request.setCharacterEncoding("shift_jis");
            response.setCharacterEncoding("shift_jis");
            // 画面から入力パラメータを取得する
            String sid = request.getParameter("sid");
            // 学生情報を取得する
            Student st = studentService.getInfoById(sid);
            System.out.println("学生番号：" + sid);
            // 画面に表示する
            response.setContentType("text/html; charset=shift_jis");
            response.getWriter().println("学生情報>>>>>>><BR>" + st.toString());
        } catch (IOException | SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        // POSTメソッドの処理
        try {
            request.setCharacterEncoding("shift_jis");
            response.setCharacterEncoding("shift_jis");
            String name = request.getParameter("name");
            response.getWriter().println("POSTメソッドです。");// 画面から入力パラメータを取得する
            String sid = request.getParameter("sid");
            System.out.println("学生番号：" + sid);
            // 学生情報を取得する
            Student st = studentService.getInfoById(sid);
            // 画面に表示する
            response.setContentType("text/html; charset=shift_jis");
            response.getWriter().println("学生情報>>>>>>><BR>" + st.toString());
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
