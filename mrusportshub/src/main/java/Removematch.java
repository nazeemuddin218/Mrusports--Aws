import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/removematch")
public class Removematch extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        Connection conn = null;
        PreparedStatement ps = null;

        String url = "jdbc:mysql://localhost:3306/login";
        String username = "root";
        String password = "mysql";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, password);

            String sql = "DELETE FROM matchentry WHERE match_id = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();

            // Redirect to the main page after removing match
            response.sendRedirect("remove-match.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            // Handle exception, maybe show an error page or message
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
