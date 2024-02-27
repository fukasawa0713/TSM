package jp.main.dao;

import jp.main.base.JdbcTest;
import jp.main.model.Teacher;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;


public class TeacherDAO {
    public Teacher getTeacher(int id) throws SQLException {
        // SQL文を修正し、? を使用してプレースホルダーを指定する
        String sql = "SELECT * FROM teacher where id =?";

        ResultSet res = JdbcTest.executeQuery(sql, id);
        Teacher tc = new Teacher();

        while (res.next()) {
            int tid = res.getInt("id");
            String name = res.getString("name");
            String gender = res.getString("gender");
            String age = res.getString("age");
            String course = res.getString("course");
            tc.setId(tid);
            tc.setName(name);
            tc.setGender(gender);
            tc.setAge(Integer.parseInt(age));
            tc.setCourse(course);
        }
        return tc;
    }


    public Map<String, Object> searchTeachers(String id, String name, String course) throws SQLException {
        String sql = "SELECT * FROM teacher WHERE (id = ? OR name = ? OR course = ?) ";

        try (ResultSet res = JdbcTest.executeQuery(sql, id, name, course)) {
            Map<String, Object> result = new HashMap<>();
            List<Map<String, Object>> teacherList = new ArrayList<>();
            while (res.next()) {
                Map<String, Object> teacherInfo = new HashMap<>();
                teacherInfo.put("id", res.getInt("id"));
                teacherInfo.put("name", res.getString("name"));
                teacherInfo.put("gender", res.getString("gender"));
                teacherInfo.put("age", res.getInt("age"));
                teacherInfo.put("course", res.getString("course"));
                teacherList.add(teacherInfo);
            }
            System.out.println(teacherList);
            result.put("teacherInfo", teacherList);
            return result;
        }
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


    public boolean InsertTeacher(int id, String name, int age, String gender, String course) throws SQLException {
        boolean success = false;
        String sql = "INSERT into teacher (id, name, age, gender, course) values (?, ?, ?, ?, ?)";
        int rowsInsert = JdbcTest.executeInsert(sql, id, name, gender, age, course);

        System.out.println(rowsInsert);

        if (rowsInsert > 0) {
            success = true;
        }
        return success;
    }

    public boolean UpdateTeacher(int id, String name, String gender, int age, String course) throws SQLException {
        boolean success = false;
        String sql = "update teacher set name =? ,gender =?, age = ?, course = ? where id = ?";

        int rowUpdate = JdbcTest.executeUpdate(sql, id, name, gender, age, course);
        if (rowUpdate > 0) {
            success = true;
        }
        return success;
    }

    public boolean countId(int id) throws SQLException {
        boolean exists = false;
        String sql = "SELECT COUNT(*) FROM teacher WHERE id = ?";

        try (ResultSet resultSet = JdbcTest.executeQuery(sql, id)) {
            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                exists = (count > 0);
            }
        }
        return exists;
    }



}





