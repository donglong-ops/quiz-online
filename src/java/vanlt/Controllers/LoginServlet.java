/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vanlt.Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vanlt.daos.QuizHistoryDAO;
import vanlt.daos.UserDAO;
import vanlt.dtos.QuizHistoryDto;
import vanlt.dtos.UserDto;

/**
 *
 * @author AVITA
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    private final String URL_STUDENT_PAGE = "userIf";

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
        PrintWriter out = response.getWriter();
        String email = request.getParameter("username");
        String password = request.getParameter("password");
        try {
            String encryPassword = org.apache.commons.codec.digest.DigestUtils.sha256Hex(password);
            if (email.trim().length() > 0 && password.trim().length() > 0) {
                UserDAO dao = new UserDAO();
                UserDto result = dao.checkLogin(email, encryPassword);
                if (result != null) {
                    HttpSession session = request.getSession();
                    session.setAttribute("USER", result);
                    List<QuizHistoryDto> listQ = new QuizHistoryDAO().getAllEntry();
                    session.setAttribute("quizHistory", listQ);
                    response.sendRedirect(URL_STUDENT_PAGE);
                } else {
                    request.setAttribute("ERRORLOGIN", "Email Or Password Wrong!!");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            out.close();
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
