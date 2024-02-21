package jp.main.service;

import jp.main.dao.TeacherDAO;
import jp.main.model.Teacher;

import java.sql.SQLException;
import java.util.List;

public class TeacherService {
    TeacherDAO dao = new TeacherDAO();

    public Teacher getInfoById(String sql) throws SQLException {
        return dao.getTeacher(sql);
    }

    public List<Teacher> getAllTeachers () throws SQLException {
            return dao.getAllTeachers();
    }

    public List<Teacher> searchTeachers(String id) throws SQLException {
        return dao.searchTeachers(id);
    }
}

