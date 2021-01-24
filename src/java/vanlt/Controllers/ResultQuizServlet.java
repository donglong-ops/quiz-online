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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vanlt.daos.QuestionDAO;
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
        
        QuestionDAO dao = new QuestionDAO();
        HttpSession session = request.getSession();
        UserDto dto = (UserDto) session.getAttribute("USER");
        LocalDate date = java.time.LocalDate.now();
        Date dateQuiz = Date.valueOf(date);

        try {
            int numOfQuiz = Integer.parseInt(request.getParameter("numOfQuiz"));
            System.out.println(numOfQuiz);
            double mark = 0;
            for (int i = 0; i < numOfQuiz; i++) {
                int id = Integer.parseInt(request.getParameter("q" + String.valueOf(i)));
                QuestionDto question = dao.findQuestionById(id);

                String answer = "";
                for (int j = 0; j < 4; j++) {
                    String answerId = "ans" + String.valueOf(i) + "-" + String.valueOf(j);
                    if (request.getParameter(answerId) != null) {
                        answer += String.valueOf(j + 1);
                    }
                }
                System.out.println("answer: " + answer);
                if (question.getAnswer().equals(answer)) {
                    mark++;
                }
            }

            QuizHistoryDAO qhm = new QuizHistoryDAO();
            qhm.addEntry(dto.getId(), numOfQuiz, (int) mark, dateQuiz);

            NumberFormat formatter = new DecimalFormat("#0.00");
            mark = (mark / (double) numOfQuiz) * 10;
            double percent = mark * 10;
            String status = "Failed";
            if (mark > 4) {
                status = "Passed";
            }
            String className = (status.equals("Passed")) ? "success" : "failed";
            request.setAttribute("numOfQuiz", numOfQuiz);
            request.setAttribute("result", formatter.format(mark));
            request.setAttribute("percent", formatter.format(percent));
            request.setAttribute("status", status);
            request.setAttribute("className", className);

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
