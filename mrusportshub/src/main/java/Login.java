import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

@WebServlet("/login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private String dburl = "jdbc:mysql://localhost:3306/login";
    private String dbuname = "root";
    private String dbpassword = "mysql";
    private String dbdriver = "com.mysql.cj.jdbc.Driver";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username_or_email");
        String password = request.getParameter("password");

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName(dbdriver);
            conn = DriverManager.getConnection(dburl, dbuname, dbpassword);
            
            // Check if the provided credentials match an admin record in the admin table
            String adminSql = "SELECT * FROM admin WHERE username = ? AND password = ?";
            stmt = conn.prepareStatement(adminSql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            rs = stmt.executeQuery();

            if (rs.next()) {
                // If the user is an admin, redirect to submitMatch.jsp
                response.sendRedirect("adminindex.jsp");
                return; // Exit the method to avoid checking user credentials
            }
            
            // If the user is not an admin, check if the provided credentials match a user record in the registration table
            String userSql = "SELECT * FROM registration WHERE username = ? AND password = ?";
            stmt = conn.prepareStatement(userSql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            rs = stmt.executeQuery();

            if (rs.next()) {
                // If the user is found in the registration table, redirect to matchRecords.jsp
                response.sendRedirect("index.jsp");
            } else {
                // If the user is not found in either admin or registration tables, display error message
                request.setAttribute("errorMessage", "Invalid username or password");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
