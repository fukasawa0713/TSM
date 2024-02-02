package jp.main.service;

import jp.main.dao.StudentDAO;
import jp.main.model.Student;

import java.sql.SQLException;

public class StudentService {
    StudentDAO dao = new StudentDAO();

    public Student getInfoById(String sid) throws SQLException {
        return dao.getStudent(sid);
    }

    // Add other methods as needed

}
