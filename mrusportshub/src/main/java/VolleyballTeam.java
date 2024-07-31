import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/submitPlayerDetails")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class VolleyballTeam extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String DB_URL = "jdbc:mysql://localhost:3306/login";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "mysql";
    private static final String DB_DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String UPLOAD_DIRECTORY = "uploads" + File.separator + "volleyball";

    static {
        try {
            Class.forName(DB_DRIVER);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String playerName = request.getParameter("playerName");
        String playerType = request.getParameter("playerType");
        int totalPoints = Integer.parseInt(request.getParameter("totalPoints"));

        int kills = 0;
        int blocks = 0;
        int digs = 0;

        if ("Setter".equals(playerType) || "Middle Blocker".equals(playerType) || "Outside Hitter".equals(playerType) || "Opposite Hitter".equals(playerType)) {
            kills = Integer.parseInt(request.getParameter("kills"));
            blocks = Integer.parseInt(request.getParameter("blocks"));
            digs = Integer.parseInt(request.getParameter("digs"));
        } else if ("Libero".equals(playerType) || "Rotation Player".equals(playerType)) {
            // Adjust additional parameters as needed for other player types
        }

        String photoPath = null;
        Part filePart = request.getPart("playerPhoto");

        if (filePart != null && filePart.getSize() > 0) {
            String fileName = extractFileName(filePart);
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }
            String filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);
            photoPath = UPLOAD_DIRECTORY + File.separator + fileName;
        } else {
            photoPath = "images/default.jpg"; // Assuming default image path is relative to the context
        }

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(
                     "INSERT INTO volleyballteam (playerName, playerType, totalPoints, kills, blocks, digs, image) VALUES (?, ?, ?, ?, ?, ?, ?)")) {

            stmt.setString(1, playerName);
            stmt.setString(2, playerType);
            stmt.setInt(3, totalPoints);
            stmt.setInt(4, kills);
            stmt.setInt(5, blocks);
            stmt.setInt(6, digs);
            stmt.setString(7, photoPath);

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                response.getWriter().println("Player details successfully added!");
            } else {
                response.getWriter().println("Error, try again!!!!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
        }
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
