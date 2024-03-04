package jp.main.service;

import jp.main.dao.TeacherDAO;
import jp.main.model.Teacher;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class TeacherService {
    TeacherDAO dao = new TeacherDAO();

    public Teacher getInfoById(int id) throws SQLException {
        return dao.getTeacher(id);
    }

    public List<Teacher> getAllTeachers() throws SQLException {
        return dao.getAllTeachers();
    }

    public Map<String, Object> searchTeachers(String id, String name, String course) throws SQLException {
        return dao.searchTeachers(id, name, course);
    }

    public boolean InsertTeacher(int id, String name, int age, String gender, String course) throws SQLException {
        return dao.InsertTeacher(id, name, age, gender, course);
    }

    public boolean countId(int id) throws SQLException {
        return dao.countId(id);
    }

    public boolean UpdateTeacher(int id, String name, String gender, int age, String course) throws SQLException {
        return dao.UpdateTeacher(id, name, gender, age, course);
    }

    public List<Teacher> getTeachersPerPage(int page, int pageSize) throws SQLException {
        return dao.getTeachersPerPage(page, pageSize);
    }

    public int getTotalTeachersCount() throws SQLException {
        return dao.getTotalTeacherCount();
    }
}
