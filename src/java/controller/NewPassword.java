package controller;

import dal.DAOAccount;
import entity.Account;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class NewPassword
 */
@WebServlet("/newPassword")
public class NewPassword extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            String email = (String) session.getAttribute("email");
            String newPassword = request.getParameter("password");
            String confPassword = request.getParameter("confPassword");
            RequestDispatcher dispatcher = null;
            Account acc=new Account();
            DAOAccount dao = new DAOAccount();

            if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {
                acc = dao.getAccountByEmail(email);
                //Ma hoa pass
//                String newPassword = toSHA1(newPassword);
                dao.changePassword(newPassword, acc.getAccount_id());

                if (dao.getAccountByEmail(email).getPassword().equals(newPassword)) {
                    request.setAttribute("status", "resetSuccess");
                    dispatcher = request.getRequestDispatcher("Login.jsp");
                } else {
                    request.setAttribute("status", "resetFailed");
                    dispatcher = request.getRequestDispatcher("NewPassword.jsp");
                }
                dispatcher.forward(request, response);

            } else {
                request.setAttribute("status", "New password and confirm receive password are not the same");
                request.getRequestDispatcher("NewPassword.jsp").forward(request, response);
            }
        } catch (Exception e){
            
        }
    }
}
