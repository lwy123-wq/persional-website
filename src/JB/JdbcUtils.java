package JB;

import user.MessBor;

import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.Properties;

public class JdbcUtils {
    public static Connection getConnection() throws Exception {
        /**
         * 步骤：
         *  1. 声明  driver、jdbcUrl、user、password 四个变量
         *  2. 新建 jdbc.properties 配置文件，使其在不改源码情况下，变更数据库
         *  3. 获取 jdbc.properties 文件参数，利用Java反射和输入流方式获取
         *  4. Class.forName(driver);加载驱动
         *  5. 获取连接实例
         */
        String driver =null;
        String jdbcUrl =null;
        String user =null;
        String password =null;

        InputStream inputStream = JdbcUtils.class.getClassLoader().getResourceAsStream("jdbc.properties");
        Properties properties = new Properties();
        properties.load(inputStream);
        driver = properties.getProperty("driver");
        jdbcUrl = properties.getProperty("jdbcUrl");
        user = properties.getProperty("user");
        password = properties.getProperty("password");
        Class.forName(driver);
        Connection conn = (Connection) DriverManager.getConnection(jdbcUrl, user, password);
        return conn;
    }

    public static void release(Statement statement, Connection conn, ResultSet result) {
        try {
            if (statement != null) {
                statement.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            if (result != null) {
                result.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public ArrayList<MessBor> findMbInfo() {
        PreparedStatement pstmt;
        try {
            ArrayList<MessBor> al = new ArrayList<MessBor>();
            Connection conn = null;
            pstmt = conn.prepareStatement("select *from messages");
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                MessBor mb = new MessBor();
                mb.setId(rs.getInt(1));
                mb.setName(rs.getString(2));
                mb.setTime(rs.getDate(3));
                mb.setTitle(rs.getString(4));
                mb.setMessage(rs.getString(5));
                al.add(mb);
            }
            return al;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
