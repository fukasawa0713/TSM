package jp.main.dao;

import jp.main.base.JdbcTest;
import jp.main.model.Teacher;

import java.sql.ResultSet;
import java.sql.SQLException;


public class TeacherDAO {
    public Teacher getTeacher(String id) throws SQLException {
        // SQL文を修正し、? を使用してプレースホルダーを指定する
        String sql = "SELECT * FROM teacher";
        ResultSet res = JdbcTest.executeQuery(sql, id);
        Teacher tc = new Teacher();

        while (res.next()){
            int tid = res.getInt("id");
            String name = res.getString("name");
            String gender = res.getString("gender");
            int age = res.getInt("age");
            String course = res.getString("course");


        }
        return tc;
    }
}
