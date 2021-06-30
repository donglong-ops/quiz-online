/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vanlt.Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vanlt.daos.QuestionDAO;
import vanlt.dtos.QuestionDto;
import vanlt.dtos.UserDto;

/**
 *
 * @author AVITA
 */
@WebServlet(name = "TakeQuizServlet", urlPatterns = {"/TakeQuizServlet"})
public class TakeQuizServlet extends HttpServlet {

    private final int min = 5;

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
        String subId = request.getParameter("subId");
        HttpSession session = request.getSession();
        int subjectId = Integer.parseInt(subId);
        try {
            List<QuestionDto> questions = dao.getQuestions(subjectId);
            if (questions != null) {
                Random generator = new Random();
                int numOfQuiz = generator.nextInt(questions.size() - min) + min + 1;
                while (numOfQuiz > questions.size()) {
                    numOfQuiz = (numOfQuiz + questions.size()) / 2;
                }
                Collections.shuffle(questions);
                List<QuestionDto> listQuest = new ArrayList<>();
                for (int i = 0; i < numOfQuiz; i++) {
                    listQuest.add(questions.get(i));
                }
                session.setAttribute("quizData", listQuest);
                session.setAttribute("subjectID", subjectId);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            request.getRequestDispatcher("quizPage_test.jsp").forward(request, response);
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
