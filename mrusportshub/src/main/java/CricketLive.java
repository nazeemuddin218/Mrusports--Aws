import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/cricketlive")
public class CricketLive extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // JDBC URL, username, and password
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/login";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "mysql";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Retrieve form data
        String matchId = request.getParameter("match_id");
        int over = Integer.parseInt(request.getParameter("over"));
        int ballNumber = Integer.parseInt(request.getParameter("ball_number"));
        String batsman = request.getParameter("batsman");
        String bowler = request.getParameter("bowler");
        int runs = Integer.parseInt(request.getParameter("runs"));
        String extras = request.getParameter("extras");

        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            // Open a connection
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);

            // Prepare SQL statement
            String sql = "INSERT INTO cricketlive (match_id, over, ball_number, batsman, bowler, runs, extras) VALUES (?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, matchId);
            pstmt.setInt(2, over);
            pstmt.setInt(3, ballNumber);
            pstmt.setString(4, batsman);
            pstmt.setString(5, bowler);
            pstmt.setInt(6, runs);
            pstmt.setString(7, extras);

            // Execute the query
            int rowsAffected = pstmt.executeUpdate();

            // Send response to client
            PrintWriter out = response.getWriter();
            if (rowsAffected > 0) {
                out.println("Data inserted successfully!");
            } else {
                out.println("Failed to insert data.");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            response.getWriter().println("SQL Exception: " + ex.getMessage());
        } finally {
            // Close JDBC objects
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    // Method to query ball-to-ball records
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Open a connection
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);

            // Prepare SQL statement
            String sql = "SELECT * FROM cricketlive";
            pstmt = conn.prepareStatement(sql);

            // Execute the query
            rs = pstmt.executeQuery();

            // Process the result set (you can format this as per your requirement)
            PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<h2>Ball-to-Ball Records</h2>");
            out.println("<table border='1'>");
            out.println("<tr><th>Match ID</th><th>Over</th><th>Ball Number</th><th>Batsman</th><th>Bowler</th><th>Runs</th><th>Extras</th></tr>");
            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getString("match_id") + "</td>");
                out.println("<td>" + rs.getInt("over") + "</td>");
                out.println("<td>" + rs.getInt("ball_number") + "</td>");
                out.println("<td>" + rs.getString("batsman") + "</td>");
                out.println("<td>" + rs.getString("bowler") + "</td>");
                out.println("<td>" + rs.getInt("runs") + "</td>");
                out.println("<td>" + rs.getString("extras") + "</td>");
                out.println("</tr>");
            }
            out.println("</table>");
            out.println("</body></html>");
        } catch (SQLException ex) {
            ex.printStackTrace();
            response.getWriter().println("SQL Exception: " + ex.getMessage());
        } finally {
            // Close JDBC objects
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
