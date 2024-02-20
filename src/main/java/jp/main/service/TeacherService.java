package jp.main.service;

import jp.main.dao.TeacherDAO;
import jp.main.model.Teacher;

import java.sql.SQLException;

public class TeacherService {
        TeacherDAO dao = new TeacherDAO();
        public Teacher getInfoById(String id)throws SQLException {
            return dao.getTeacher(id);
        }
}
