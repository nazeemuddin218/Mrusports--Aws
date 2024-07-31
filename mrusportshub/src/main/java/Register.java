import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

@WebServlet("/register")
public class Register extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private String dburl = "jdbc:mysql://localhost:3306/login";
    private String dbuname = "root";
    private String dbpassword = "mysql";
    private String dbdriver = "com.mysql.cj.jdbc.Driver";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String Email = request.getParameter("Email");
        String password = request.getParameter("password");
        String confirm_password = request.getParameter("confirm_password");

        // Load the JDBC driver
        try {
            Class.forName(dbdriver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        // Establish the database connection
        try (Connection conn = DriverManager.getConnection(dburl, dbuname, dbpassword)) {
            // Prepare the SQL statement
            String sql = "INSERT INTO registration (username, Email, password, confirm_password) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);

            // Set parameters for the SQL statement
            ps.setString(1, username);
            ps.setString(2, Email);
            ps.setString(3, password);
            ps.setString(4, confirm_password);

            // Execute the SQL statement
            int rowsInserted = ps.executeUpdate();

            // Check if the registration was successful
            if (rowsInserted > 0) {
                // Redirect to the index page if registration is successful
                response.sendRedirect("index.jsp");
            } else {
                // If registration fails, display an error message
                response.getWriter().println("Registration failed. Please try again.");
            }
        } catch (SQLException e) {
            // Handle any database errors
            e.printStackTrace();
        }
    }
}
