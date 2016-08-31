/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Hibernate.Query;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author staling
 */
public class RegresarAuto extends HttpServlet {

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
        String cedula = request.getParameter("cedula").replace("<script>", " ").replace("</script>", "").replace("(", "").replace(")", "");
        String codigo = request.getParameter("codigo").replace("<script>", " ").replace("</script>", "").replace("(", "").replace(")", "");
        HttpSession s = request.getSession();
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Calendar cal = Calendar.getInstance();
        String fechaActual = dateFormat.format(cal.getTime());
        if (cedula.length() < 2 | codigo.length() < 2) {

            s.setAttribute("Mensaje", "Llene Todos los Campos");
            response.sendRedirect("RegresarAuto.jsp");
        } else {
            Query Q = new Query();
            if (Q.regresarAuto(cedula, codigo, fechaActual)) {
                if (Q.updateAuto(codigo, "Taller")) {
                    s.setAttribute("Mensaje", "Auto Regresado con exito");
                    response.sendRedirect("RegresarAuto.jsp");
                }
            } else {
                s.setAttribute("Mensaje", "Regreso Fallido");
                response.sendRedirect("RegresarAuto.jsp");

            }
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
