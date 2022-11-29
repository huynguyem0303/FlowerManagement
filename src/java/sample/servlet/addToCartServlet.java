/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.dao.PlantDAO;
import sample.dto.CartItems;
import sample.dto.Plant;
import sample.utils.util;

/**
 *
 * @author Fang Long
 */
@WebServlet(name = "addToCartServlet", urlPatterns = {"/addToCartServlet"})
public class addToCartServlet extends HttpServlet {

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
        try {
            HttpSession session = request.getSession();

            String pid = request.getParameter("pid");

            if (session != null) {
                HashMap<String, CartItems> cart = (HashMap<String, CartItems>) session.getAttribute("cart");
                if (cart == null) {
                    cart = new HashMap<>();
                    //Get plant
                    Plant plant = PlantDAO.getPlant(Integer.parseInt(pid));
                    //Put Plant to cartItems
                    CartItems cartItems = new CartItems(plant.getId(), plant.getName(), plant.getPrice(), plant.getImgpath(), plant.getDescription(), plant.getStatus(), plant.getCateid(), plant.getCatename(), 1);
                    cart.put(pid, cartItems);

                } else {

                    //get item from cart;
                    CartItems cartItems = cart.get(pid);
                    if (cartItems == null) {
                        Plant plant = PlantDAO.getPlant(Integer.parseInt(pid));
                        cartItems = new CartItems(plant.getId(), plant.getName(), plant.getPrice(), plant.getImgpath(), plant.getDescription(), plant.getStatus(), plant.getCateid(), plant.getCatename(), 1);
                        cart.put(pid, cartItems);
                    } else {
                        int newQuantity = cartItems.getQuantity() + 1;
                        cartItems.setQuantity(newQuantity);
                        cart.put(pid, cartItems);
                    }
                }
                int total = util.getTotal(cart);
                session.setAttribute("TOTAL", total);

                session.setAttribute("cart", cart);
//                response.sendRedirect("mainController?action=search&keyword=");
                request.getRequestDispatcher("mainController?action=search&txtsearch=&searchBy=byname").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
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
