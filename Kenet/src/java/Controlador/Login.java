/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Hibernate.Admin;
import Hibernate.Query;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author staling
 */
public class Login extends HttpServlet {

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

        String email = request.getParameter("Email").replace("<script>", "").replace("</script>", "").replace("(", "").replace(")", "");
        String clave = request.getParameter("Clave").replace("<script>", "").replace("</script>", "").replace("(", "").replace(")", "");
        HttpSession s = request.getSession();
        if (email.length() < 2 | clave.length() < 2) {

            s.setAttribute("Mensaje", "Llene todos los Campos");
            response.sendRedirect("Login.jsp");
        } else if (s.getAttribute("nombre") == null) {

            Admin admin = new Query().Login(email, clave);
            if (admin != null) {

                s.setAttribute("nombre", admin.getNombre());
                s.setAttribute("rango", admin.getRango());
                s.setAttribute("clave", admin.getClave());
                admin = null;
                response.sendRedirect("/SportCar");

            } else {
                admin = null;

                s.setAttribute("Mensaje", "Nombre o Contraseña incorrecta");
                response.sendRedirect("Login.jsp");
            }
        } else {
            s.setAttribute("Mensaje", "Cerrar antes de iniciar");
            response.sendRedirect("Login.jsp");
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
