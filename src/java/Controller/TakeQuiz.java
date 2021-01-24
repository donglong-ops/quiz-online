/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vanlt.daos.QuestionDAO;
import vanlt.daos.QuizHistoryDAO;
import vanlt.dtos.QuestionDto;

/**
 *
 * @author minhndse04560
 */
public class TakeQuiz extends BaseServlet {

    String page = "takeQuiz/quizPrepare.jsp";
    QuestionDAO qm = null;

    @Override
    public String getFileName() {
        return "takeQuiz/quizPrepare.jsp";
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            qm = new QuestionDAO();
            request.setAttribute("numOfQuiz", qm.getQuestionSize());
        } catch (Exception ex) {
            Logger.getLogger(TakeQuiz.class.getName()).log(Level.SEVERE, null, ex);
            getServletContext().getRequestDispatcher("/errorPage/errorPage.jsp")
                    .forward(request, response);
        } finally {
            super.doGet(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String request = req.getParameter("req");
            qm = new QuestionDAO();
            if (request.equals("quizReq")) {
                System.out.println("ahihi");
                questionRequest(req, resp);
            } else if (request.equals("quizResult")) {
                questionResult(req, resp);
            }

            req.setAttribute("page", page);
            getServletContext().getRequestDispatcher("/index.jsp")
                    .forward(req, resp);
        } catch (Exception ex) {
            Logger.getLogger(TakeQuiz.class.getName()).log(Level.SEVERE, null, ex);
            getServletContext().getRequestDispatcher("/errorPage/errorPage.jsp")
                    .forward(req, resp);
        }
    }

    public void questionRequest(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        int numOfQuiz = Integer.parseInt(req.getParameter("numOfQuiz"));
        req.setAttribute("savedNumOfQuiz", numOfQuiz);
        if ((numOfQuiz <= 0)) {
            req.setAttribute("message", "Error! Quiz number must be larger than 0");
            page = "takeQuiz/quizPrepare.jsp";
        } else if (numOfQuiz > qm.getQuestions().size()) {
            req.setAttribute("message", "Error! There is not enough quiz to take");
            page = "takeQuiz/quizPrepare.jsp";
        } else {
            List<Integer> questionIndexs = new ArrayList<>();
            for (int i = 0; i < qm.getQuestions().size(); i++) {
                questionIndexs.add(i);
            }
            Collections.shuffle(questionIndexs);
            List<QuestionDto> returnQuestionDto = new ArrayList<>();
            for (int i = 0; i < numOfQuiz; i++) {
                returnQuestionDto.add(qm.getQuestions().get(questionIndexs.get(i)));
            }

            req.setAttribute("quizData", returnQuestionDto);
            req.setAttribute("quizData", returnQuestionDto);
            page = "takeQuiz/quizPage.jsp";
        }
    }

    public void questionResult(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        // Ftontend question orgnization:
        // Each question is display in a div, marked by order
        // In each div, there is a hidden input, mapping quetin order nd its id
        // Each question has 4 answer, each answer is a checkbox
        // Checkbox's name is: ans + {question order}-{answer order}
        int numOfQuiz = Integer.parseInt(req.getParameter("numOfQuiz"));
        double mark = 0;

        for (int i = 0; i < numOfQuiz; i++) {
            int id = Integer.parseInt(req.getParameter("q" + String.valueOf(i)));
            QuestionDto question = qm.findQuestionById(id);

            String answer = "";
            for (int j = 0; j < 4; j++) {
                String answerId = "ans" + String.valueOf(i) + "-" + String.valueOf(j);
                if (req.getParameter(answerId) != null) {
                    answer += String.valueOf(j + 1);
                }
            }
            System.out.println("answer: " + answer);
            if (question.getAnswer().equals(answer)) {
                mark++;
            }
        }

        QuizHistoryDAO qhm = new QuizHistoryDAO();
        int userId = Integer.parseInt(req.getSession().getAttribute("userId").toString());
        //qhm.addEntry(userId, numOfQuiz, (int) mark);

        NumberFormat formatter = new DecimalFormat("#0.00");
        mark = (mark / (double) numOfQuiz) * 10;
        double percent = mark * 10;
        String status = "Failed";
        if (mark > 4) {
            status = "Passed";
        }
        String className = (status.equals("Passed")) ? "success" : "failed";

        req.setAttribute("numOfQuiz", numOfQuiz);
        req.setAttribute("result", formatter.format(mark));
        req.setAttribute("percent", formatter.format(percent));
        req.setAttribute("status", status);
        req.setAttribute("className", className);
        page = "takeQuiz/quizResult.jsp";
    }
}
