package jp.main.dao;

import jp.main.base.JdbcTest;
import jp.main.model.Student;

import java.sql.ResultSet;
import java.sql.SQLException;

public class StudentDAO {

    // 学生データの操作を記述する
    // 学生情報を取得する
    public Student getStudent(String id) throws SQLException {
        String sql = "SELECT * FROM student WHERE sid = ?";
        ResultSet res = JdbcTest.executeQuery(sql, id);
        while (res.next()) {
            int sid = res.getInt("sid");
            String sname = res.getString("name");
            String sex =  res.getString("sex");
            String clazz = res.getString("class");
            int age = res.getInt("age");
            Student st = new Student();
            st.setId(sid);
            st.setName(sname);
            st.setAge(age);
            st.setSex(sex);
            st.setClazz(clazz);

            return st;
        }
        return null;
    }

    // 学生情報を更新する

    // 学生情報を削除する

    // 学生情報を登録する
}
