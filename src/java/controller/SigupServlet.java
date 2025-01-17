/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAOAccount;
import entity.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Date;

/**
 *
 * @author HP
 */
public class SigupServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SigupServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SigupServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("SignUp.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response)
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAOAccount d = new DAOAccount();
        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address"); 
        String dateofbirth = request.getParameter("dateofbirth");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String gender = request.getParameter("gender");

        // Kiểm tra dữ liệu đầu vào
        if (first_name.isEmpty() || last_name.isEmpty() || email.isEmpty() || phone.isEmpty() || address.isEmpty() || dateofbirth.isEmpty() || password.isEmpty() || gender.isEmpty()) {
            String mess = "Please fill in all fields.";
            setCommonValues(request, response, mess, first_name, last_name, email, phone, address, dateofbirth, gender);
            return;
        }

        // Kiểm tra định dạng của tên
        if (!isValidName(first_name) || !isValidName(last_name)) {
            String mess = "Names cannot contain numbers or special characters.";
            setCommonValues(request, response, mess, first_name, last_name, email, phone, address, dateofbirth, gender);
            return;
        }

        // Kiểm tra định dạng email
        if (!isValidEmail(email)) {
            String mess = "Invalid email format.";
            setCommonValues(request, response, mess, first_name, last_name, "", phone, address, dateofbirth, gender);
            return;
        }

        // Kiểm tra định dạng mật khẩu
        if (!isValidPassword(password)) {
            String mess = "Password must be at least 8 characters long and contain a combination of letters and numbers.";
            setCommonValues(request, response, mess, first_name, last_name, email, phone, address, dateofbirth, gender);
            return;
        }

        // Kiểm tra xem mật khẩu có trùng khớp không
        if (!password.equals(confirmPassword)) {
            String mess = "Password and confirm password do not match.";
            setCommonValues(request, response, mess, first_name, last_name, email, phone, address, dateofbirth, gender);
            return;
        }

        // Kiểm tra email có trùng không
        Account haveExistEmail = d.getAccountByEmail(email);
        if (haveExistEmail != null) {
            String mess = "Email already exists.";
            setCommonValues(request, response, mess, first_name, last_name, "", phone, address, dateofbirth, gender);
            return;
        }

        int newId = d.getAllAccount().get(d.getAllAccount().size() - 1).getAccount_id() + 1;
        Account acc = new Account(newId, 7, 1, first_name, last_name, phone, email, password, last_name, address, dateofbirth, dateofbirth, gender); 
        boolean haveAdd = d.addAccount(acc);
        HttpSession session = request.getSession();
        if (haveAdd) {
            session.setAttribute("account", acc);
            response.sendRedirect("Login.jsp");
        } else {
            String mess = "An error occurred. Please try again.";
            request.setAttribute("message", mess);
            request.getRequestDispatcher("SignUp.jsp").forward(request, response);
        }
    }

    private void setCommonValues(HttpServletRequest request, HttpServletResponse response, String mess, String first_name,
            String last_name, String email, String phone, String address, String dateofbirth, String gender) throws ServletException, IOException {
        request.setAttribute("message", mess);
        request.setAttribute("first_name", first_name);
        request.setAttribute("last_name", last_name);
        request.setAttribute("email", email);
        request.setAttribute("phone", phone);
        request.setAttribute("address", address); // Thêm address vào đây
        request.setAttribute("dateofbirth", dateofbirth);
        request.setAttribute("gender", gender);
        request.getRequestDispatcher("SignUp.jsp").forward(request, response);
    }

    private boolean isValidName(String name) {
        return name.matches("[\\p{L} -']+");
    }

    private boolean isValidEmail(String email) {
        return email.matches("[A-Za-z][A-Za-z0-9._%+-]*@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}");
    }

    private boolean isValidPassword(String password) {
        return password.length() >= 8 && password.matches(".*[A-Za-z].*") && password.matches(".*\\d.*");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
