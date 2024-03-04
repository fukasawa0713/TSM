package jp.main.dao;

import jp.main.base.JdbcTest;
import jp.main.model.Teacher;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
        StringBuilder sqlBuilder = new StringBuilder("SELECT * FROM teacher WHERE 1=1");
        List<Object> params = new ArrayList<>();

        if (id != null && !id.isEmpty()) {
            sqlBuilder.append(" AND id = ?");
            params.add(id);
        }
        if (name != null && !name.isEmpty()) {
            sqlBuilder.append(" AND name = ?");
            params.add(name);
        }
        if (course != null && !course.isEmpty()) {
            sqlBuilder.append(" AND course = ?");
            params.add(course);
        }

        try (ResultSet res = JdbcTest.executeQuery(sqlBuilder.toString(), params.toArray())) {
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
        String sql = "SELECT * FROM teacher limit 10";
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

    public Map<String, Object> getTeachersPerPage;
    public List<Teacher> getTeachersPerPage(int page, int pageSize) throws SQLException {
        List<Teacher> teacherList = new ArrayList<>();
        String sql = "SELECT * FROM teacher LIMIT ?, ?";
        int offset = (page - 1) * pageSize;

        try (PreparedStatement statement = JdbcTest.getConnection().prepareStatement(sql)) {
            statement.setInt(1, offset);
            statement.setInt(2, pageSize);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Teacher teacher = new Teacher();
                teacher.setId(resultSet.getInt("id"));
                teacher.setName(resultSet.getString("name"));
                teacher.setGender(resultSet.getString("gender"));
                teacher.setAge(resultSet.getInt("age"));
                teacher.setCourse(resultSet.getString("course"));

                teacherList.add(teacher);
            }
        }

        return teacherList;
    }



    public int getTotalTeacherCount() throws SQLException {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM teacher";
        try (ResultSet rs = JdbcTest.executeQuery(sql) ){
            if (rs.next()) {
                count = rs.getInt(1);
            }
        }
        return count;
    }
}