/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.product.Product;
import sample.product.ProductError;
import sample.product.ProductList;

/**
 *
 * @author Admin
 */
public class CreateProductController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String ERROR = "admin.jsp";
    private static final String SUCCESS = "shopping.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        boolean checkValidation = true;
        ProductError productError = new ProductError();
        ProductList dao = new ProductList();
        try {
            String productID = request.getParameter("productID");
            String productName = request.getParameter("productName");
            int productPrice = Integer.parseInt(request.getParameter("productPrice"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            if (productID.length() < 2 || productID.length() > 10) {
                productError.setIdError("Product ID in rang [1,10] ");
                checkValidation = false;
            }

            boolean checkDulicate = dao.checkDulicate(productID);

            if (checkDulicate) {
                productError.setIdError("ProductID da ton tai");
                checkValidation = false;
            }

            if (productName.length() < 5 || productName.length() > 20) {
                productError.setNameError("Product name in rang [5,20] ");
                checkValidation = false;
            }

            if (checkValidation) {
                Product product = new Product(productID, productName, productPrice, quantity);
                boolean checkInsert = dao.insert(product);
                if (checkInsert) {
                    url = SUCCESS;
                } else {
                    productError.setError("UNKNOWN ERROR !!");
                    request.setAttribute("PRODUCT_ERROR", productError);
                }
            } else {
                request.setAttribute("PRODUCT_ERROR", productError);
            }

        } catch (ClassNotFoundException | NumberFormatException | SQLException e) {
            log("Error at CreateProductController: " + e.toString());
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CreateProductController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CreateProductController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CreateProductController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CreateProductController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
