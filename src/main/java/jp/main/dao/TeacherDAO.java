package jp.main.dao;

import jp.main.base.JdbcTest;
import jp.main.model.Teacher;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;


public class TeacherDAO {
    public Teacher getTeacher(String sql) throws SQLException {
        // SQL文を修正し、? を使用してプレースホルダーを指定する
        sql = "SELECT * FROM teacher";
        ResultSet res = JdbcTest.executeQuery(sql);
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


    public List<Teacher> searchTeachers(String id) throws SQLException {
        List<Teacher> teacherList = new ArrayList<>();
        String sql = "SELECT * FROM teacher where id = ?";
        try (ResultSet res = JdbcTest.executeQuery(sql, id)) {
            while (res.next()) {
                int tid = res.getInt("id");
                String name = res.getString("name");
                String gender = res.getString("gender");
                int age = res.getInt("age");
                String course = res.getString("course");

                Teacher teacher = new Teacher();
                teacher.setId(tid);
                teacher.setName(name);
                teacher.setGender(gender);
                teacher.setAge(age);
                teacher.setCourse(course);

                teacherList.add(teacher);
            }
        }
        return teacherList;
    }


    public List<Teacher> getAllTeachers() throws SQLException {
        List<Teacher> teacherList = new ArrayList<>();
        String sql = "SELECT * FROM teacher";
        ResultSet res = JdbcTest.executeQuery(sql);
        while (res.next()) {
            int id = res.getInt("id");
            String name = res.getString("name");
            String gender = res.getString("gender");
            int age = res.getInt("age");
            String course = res.getString("course");

            Teacher teacher = new Teacher();
            teacher.setId(id);
            teacher.setName(name);
            teacher.setGender(gender);
            teacher.setAge(age);
            teacher.setCourse(course);

            teacherList.add(teacher);
        }
        return teacherList;
    }


}




