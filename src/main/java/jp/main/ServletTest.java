package jp.main;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ServletTest extends HttpServlet {
    // 空のServlet
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding("shift_jis");
            response.setCharacterEncoding("shift_jis");
            String name = request.getParameter("name");
            response.getWriter().println("Hello, Servlet!！！！！！>>>>>>>" + name);
        } catch (IOException e) {
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
            response.getWriter().println("POSTメソッドです。");
            response.getWriter().println("Hello, Servlet!！！！！！>>>>>>>" + name);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

}
