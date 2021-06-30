/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vanlt.Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.time.LocalDate;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vanlt.daos.QuizHistoryDAO;
import vanlt.dtos.QuestionDto;
import vanlt.dtos.UserDto;

/**
 *
 * @author AVITA
 */
@WebServlet(name = "ResultQuizServlet", urlPatterns = {"/ResultQuizServlet"})
public class ResultQuizServlet extends HttpServlet {

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

        QuizHistoryDAO history = new QuizHistoryDAO();
        HttpSession session = request.getSession();
        UserDto dto = (UserDto) session.getAttribute("USER");
        int subjectID =  (int)session.getAttribute("subjectID");
        LocalDate date = java.time.LocalDate.now();
        Date dateQuiz = Date.valueOf(date);
        List<QuestionDto> listQ = (List<QuestionDto>) session.getAttribute("quizData");
        try {
            double correctAns = 0;
            for (int i = 0; i < listQ.size(); i++) {
               if (listQ.get(i).getAnswer().equals(request.getParameter("ans" + String.valueOf(i)))) {
                    correctAns += 1;                   
                }
            }
            double mark = (correctAns / listQ.size()) *10;
            NumberFormat formatter = new DecimalFormat("#0.00");
            if(dto.getUserName() != null){
                history.addEntry(dto.getId(), listQ.size(), (int)correctAns, dateQuiz, subjectID);
            }
            request.setAttribute("result", formatter.format(mark));
            request.setAttribute("correctAnswer", (int)correctAns);
            request.setAttribute("numOfQuiz", listQ.size());

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            request.getRequestDispatcher("quizResult.jsp").forward(request, response);
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
