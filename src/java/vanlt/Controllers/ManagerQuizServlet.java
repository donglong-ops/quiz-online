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
import vanlt.daos.QuestionDAO;
import vanlt.dtos.QuestionDto;

/**
 *
 * @author AVITA
 */
@WebServlet(name = "ManagerQuizServlet", urlPatterns = {"/ManagerQuizServlet"})
public class ManagerQuizServlet extends HttpServlet {

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

        QuestionDAO dao = new QuestionDAO();
        String idQuestion = (String) request.getParameter("id");
        String questionName = request.getParameter("txtSearch");
        String subId = request.getParameter("subId");
        if (subId == null) {
            subId = "0";
        }
        String pageNum = request.getParameter("pageNum");
        if (idQuestion != null && !idQuestion.equals("")) {
            try {
                dao.deleteQueston(Integer.parseInt(idQuestion));
            } catch (Exception ex) {
                log("Delete Question Failed !! : " + ex.getMessage());
            }
        }

        try {
            //int sizeQuestion = dao.getQuestionSize();
            int sizeQuestion = dao.countTotalQuestion(Integer.parseInt(subId), questionName);
            int page = (int) (Math.ceil((double) sizeQuestion / 6));
            request.setAttribute("numOfQuiz", sizeQuestion);
            request.setAttribute("numOfPage", page);
            int pageIndex = 1;
            if (pageNum != null && !pageNum.equals("")) {
                pageIndex = Integer.parseInt(pageNum);
            }
            List<QuestionDto> listQues = dao.getQuestionsInRange(pageIndex, Integer.parseInt(subId), questionName);
            request.setAttribute("quizData", listQues);
        } catch (Exception ex) {
            log("Error ManageQuiz : " + ex.getMessage());
        } finally {
            request.getRequestDispatcher("manageQuiz.jsp").forward(request, response);
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
