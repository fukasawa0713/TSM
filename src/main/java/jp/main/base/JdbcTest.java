package jp.main.base;

import java.sql.*;

public class JdbcTest {

    private static final String URL = "jdbc:mysql://localhost:3306/TEST";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "Fukasawa0713";

    // DB接続、コレクションを取得
    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            // データベースに対する処理
//            System.out.println("データベースに接続に成功");
            return DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException e) {
//            System.out.println("データベースに接続に失敗");
            throw new SQLException("Database driver not found", e);
        }
    }

    //  SQL実行
    public static ResultSet executeQuery(String sql, String id,String name,String course) throws SQLException {
        Connection connection = null;
        try {
            connection = JdbcTest.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, id);
            preparedStatement.setString(2, name);
            preparedStatement.setString(3,course);
            return preparedStatement.executeQuery();
        } catch (SQLException we) {
            throw we;
        }
    }
    public static ResultSet executeQuery(String sql, String id,String name,String gender, int age ,String course) throws SQLException {
        Connection connection = null;
        try {
            connection = JdbcTest.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, id);
            preparedStatement.setString(2, name);
            preparedStatement.setString(3,gender);
            preparedStatement.setInt(4,age);
            preparedStatement.setString(5,course);
            return preparedStatement.executeQuery();
        } catch (SQLException we) {
            throw we;
        }
    }

    public static ResultSet executeQuery(String sql) throws SQLException {
        Connection connection = null;
        try {
            connection = JdbcTest.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            return preparedStatement.executeQuery();
        } catch (SQLException we) {
            throw we;
        }
    }

    public static ResultSet executeQuery(String sql ,int id) throws SQLException {
        Connection connection = null;
        try {
            connection = JdbcTest.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            return preparedStatement.executeQuery();
        } catch (SQLException we) {
            throw we;
        }
    }



    //   SQL実行（更新系）
    public static int executeUpdate(String sql, int id, String name, String gender, int age, String course) throws SQLException {
        Connection connection = null;
        try {
            connection = JdbcTest.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, gender);
            preparedStatement.setInt(3,age);
            preparedStatement.setString(4, course);
            preparedStatement.setInt(5, id);
            preparedStatement.executeUpdate();
        } catch (SQLException we) {
            throw we;
        }
        return id;
    }
    public static int executeInsert(String sql, int id, String name, String gender, int age, String course) throws SQLException {
        Connection connection = null;
        try {
            connection = JdbcTest.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            preparedStatement.setString(2, name);
            preparedStatement.setInt(3, age);
            preparedStatement.setString(4, gender);
            preparedStatement.setString(5, course);
            preparedStatement.executeUpdate();
        } catch (SQLException we) {
            throw we;
        }
        return id;
    }

    //   Connectionクローズ
    public static void closeConnection(Connection connection) {
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public static ResultSet executeQuery(String sql, Object[] array) throws SQLException {
        Connection connection = null;
        try {
            connection = JdbcTest.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            // array の要素を順番にプリペアドステートメントにセットする
            for (int i = 0; i < array.length; i++) {
                preparedStatement.setObject(i + 1, array[i]);
            }

            return preparedStatement.executeQuery();
        } catch (SQLException ex) {
            throw ex;
        }
    }



}
