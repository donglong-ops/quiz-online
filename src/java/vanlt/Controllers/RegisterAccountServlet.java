/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vanlt.Controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vanlt.daos.UserDAO;
import vanlt.dtos.UserDto;

/**
 *
 * @author AVITA
 */
@WebServlet(name = "RegisterAccountServlet", urlPatterns = {"/RegisterAccountServlet"})
public class RegisterAccountServlet extends HttpServlet {

    private final String URL_LOGIN_PAGE = "try";

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
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String type = request.getParameter("roleType");
        String email = request.getParameter("email");
        String url = null;
        UserDAO dao = new UserDAO();
        try {
            int numberCheck = dao.validateNewUser(email);
            if (numberCheck == -1) {
                request.setAttribute("CREATEFAIL", "Email is Existed!!");
                request.getRequestDispatcher("registerAccount.jsp").forward(request, response);
            } else {
                String encryPassword = org.apache.commons.codec.digest.DigestUtils.sha256Hex(password);
                if (username.trim().length() > 0 && password.trim().length() > 0 && type.length() > 0 && email.length() > 0) {

                    UserDto dto = new UserDto(10, username, encryPassword, email, Integer.parseInt(type));
                    boolean result = dao.addUser(dto);
                    if (result) {
                        url = URL_LOGIN_PAGE;
                    }
                    response.sendRedirect(url);
                } else {
                    request.setAttribute("CREATEFAIL", "Can't Create Account !!");
                    request.getRequestDispatcher("registerAccount.jsp").forward(request, response);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            log("Error Register Account: " + ex.getMessage());
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
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
