import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;

@WebServlet("/forgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        
        // Generate a unique token (you can use UUID.randomUUID() for example)
        String resetToken = UUID.randomUUID().toString();

        // Send email with reset link containing the unique token
        // Code to send email goes here
        // Example:
        /*
        EmailService.sendPasswordResetEmail(email, resetToken);
        */

        // Redirect the user to a page indicating that an email has been sent
        response.sendRedirect("passwordResetEmailSent.jsp");
    }
}
