/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Account.AccountDAO;
import Account.AccountDTO;
import Appointment.AppointmentDAO;
import Appointment.AppointmentDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class MainController extends HttpServlet {

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
        String url = "index.jsp";


        try {
            
            String action = request.getParameter("action");
            
            AccountDAO dao = new AccountDAO();
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("usersession") == null) {
                url = "index.jsp";
            }
            
            AppointmentDAO daoApp = new AppointmentDAO();
            List<AppointmentDTO> listAP = daoApp.list();
            request.setAttribute("LISTAPP", listAP);

            if (action.equals("login")) {
                String account = request.getParameter("account");
                String pass = request.getParameter("pass");

                AccountDTO user = dao.login(account, pass);
                if (user != null) {
                    session = request.getSession(true);
                    session.setAttribute("usersession", user);
                    url = "appoinment.jsp";
                } else {
                    request.setAttribute("ERROR", "Incorrect");
                }

            } else if (action.equals("logout")) {
                if (session != null) {
                    session.invalidate();;
                    request.setAttribute("ERROR", "Logout successfully");
                }
            } else if (action.equals("create")) {
                String account = request.getParameter("account");              
                String partnerPhone = request.getParameter("partnerPhone");
                String partnerName = request.getParameter("partnerName");
//                Timestamp timeToMeet = Timestamp.valueOf(request.getParameter("timeToMeet"));
                Timestamp timeToMeet = new Timestamp(5);
                String place = request.getParameter("place");
                Double expense = Double.parseDouble(request.getParameter("expense"));
                String note = request.getParameter("note");
                        
                AppointmentDTO app = new AppointmentDTO(0, account, partnerPhone, partnerName, timeToMeet, place, expense, note);
                
                daoApp.insert(app);
                url = "appoinment.jsp";

            }
            
            
        } catch (NumberFormatException e) {
            log("error at MainController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
