package servlet;

import JB.JdbcUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class LoginServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        Connection conn = null;
        Statement statement = null;
        ResultSet result = null;
        PrintWriter out = resp.getWriter();

        boolean isFind = false;
        String user = req.getParameter("username");
        String pwd = req.getParameter("password");
        System.out.println("请求：user:" + user);
        System.out.println("请求：pwd:" + pwd);

        try {
            conn = JdbcUtils.getConnection();
            statement = conn.createStatement();
            result = statement.executeQuery("SELECT * FROM user");
            //循环遍历数据库，比对数据
            while (result.next()) {
                String db_user = result.getString("username");
                String db_password = result.getString("password");
                System.out.println("数据库：user:" + db_user);
                System.out.println("数据库：pwd:" + db_password);
                if (user.equals(db_user) && pwd.equals(db_password)) {
                    isFind = true;
                    req.getRequestDispatcher("home.jsp").forward(req,resp);
                    break;
                } else {
                    isFind = false;
                }
            }

            if (isFind) {

                out.println("find,login succeed");
            } else {
                out.println("not find,login failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JdbcUtils.release(statement, conn, result);
        }

    }
}
