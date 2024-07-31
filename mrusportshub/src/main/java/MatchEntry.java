import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/matchentry")
@MultipartConfig
public class MatchEntry extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sportstype = request.getParameter("sportstype");
        String team1 = request.getParameter("team1");
        String team2 = request.getParameter("team2");
        Part team1LogoPart = request.getPart("team1_logo");
        Part team2LogoPart = request.getPart("team2_logo");

        byte[] team1LogoBytes = null;
        byte[] team2LogoBytes = null;

        if (team1LogoPart != null && team1LogoPart.getSize() > 0) {
            InputStream team1LogoStream = team1LogoPart.getInputStream();
            team1LogoBytes = team1LogoStream.readAllBytes();
            team1LogoStream.close();
        }

        if (team2LogoPart != null && team2LogoPart.getSize() > 0) {
            InputStream team2LogoStream = team2LogoPart.getInputStream();
            team2LogoBytes = team2LogoStream.readAllBytes();
            team2LogoStream.close();
        }

        String url = "jdbc:mysql://localhost:3306/login";
        String username = "root";
        String password = "mysql";

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, password);
            String sql = "INSERT INTO matchentry (sportstype, team1, team1_logo, team2, team2_logo, created_at) VALUES (?, ?, ?, ?, ?, CURRENT_TIMESTAMP)";
            ps = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setString(1, sportstype);
            ps.setString(2, team1);
            ps.setBytes(3, team1LogoBytes);
            ps.setString(4, team2);
            ps.setBytes(5, team2LogoBytes);
            ps.executeUpdate();

            // Retrieve the generated match ID
            int matchId = 0;
            ResultSet generatedKeys = ps.getGeneratedKeys();
            if (generatedKeys.next()) {
                matchId = generatedKeys.getInt(1);
            }

            // Redirect to the appropriate page based on the sportstype and match ID
            if (sportstype != null) {
                switch (sportstype) {
                    case "Cricket":
                        response.sendRedirect("Match-entry.jsp?match_id=" + matchId);
                        break;
                    case "Volleyball":
                    	response.sendRedirect("Match-entry.jsp?match_id=" + matchId);                        
                    	break;
                    case "Football":
                    	response.sendRedirect("Match-entry.jsp?match_id=" + matchId);                         
                    	break;
                    case "Hockey":
                    	response.sendRedirect("Match-entry.jsp?match_id=" + matchId);                          
                    	break;
                    default:
                        // Handle unknown sport type
                        break;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        } finally {
            if (ps != null) try { ps.close(); } catch (SQLException e) { }
            if (conn != null) try { conn.close(); } catch (SQLException e) { }
        }
    }
}
