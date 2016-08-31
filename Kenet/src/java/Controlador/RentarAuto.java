/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Hibernate.Alquilado;
import Hibernate.Autos;
import Hibernate.Query;
import Hibernate.Usuario;
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
public class RentarAuto extends HttpServlet {

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
        String cedula = request.getParameter("Cedula").replace("<script>", "").replace("</script>", "").replace("(", "").replace(")", "");
        String codigo = request.getParameter("Codigo").replace("<script>", "").replace("</script>", "").replace("(", "").replace(")", "");
        String regresar = request.getParameter("Regresar").replace("<script>", "").replace("</script>", "").replace("(", "").replace(")", "");
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Calendar cal = Calendar.getInstance();

        String fechaActual = dateFormat.format(cal.getTime());
        if (cedula.length() < 2 | codigo.length() < 2 | regresar.length() < 2) {
            HttpSession s = request.getSession();
            s.setAttribute("Mensaje", "Llene Todos los Campos");
            response.sendRedirect("RentarAuto.jsp");
        } else {
            HttpSession s = request.getSession();
            DateFormat fecha1 = new SimpleDateFormat("yyyy/MM/dd");
            Calendar fecha2 = Calendar.getInstance();
            String fecha = fecha1.format(fecha2.getTime()).replace("/", "").replace("-", "");

            String regresar2 = regresar.replace("-", "");
            int uno = Integer.parseInt(fecha);
            int dos = Integer.parseInt(regresar2);
            uno = dos - uno;
            System.out.println("1s " + uno);
            ///System.out.println("2h "+dos);

            if (uno >= 0 && uno < 32) {

                Query Q = new Query();
                Usuario u = null;
                Autos auto = Q.diponibleAuto(codigo);
                if (auto != null) {
                    u = Q.usuarioAlquila(cedula);
                    if (u != null) {
                        Alquilado alqular = new Alquilado(u.getNombre(), u.getApellido(), u.getCedula(), u.getFoto(), auto.getMarca(), auto.getModelo(), auto.getCodigo(), auto.getFoto1(), fechaActual, regresar, null, "Alquilado");
                        if (Q.alquilar(alqular)) {
                            if (!Q.updateAuto(auto.getCodigo(), "Alquilado")) {

                                s.setAttribute("Mensaje", "Fallo el update");
                                response.sendRedirect("RentarAuto.jsp");
                            } else {
                                s.setAttribute("Mensaje", "Auto alquilado con exito");
                                response.sendRedirect("RentarAuto.jsp");
                            }

                        } else {

                            s.setAttribute("Mensaje", "Registro Fallido");
                            response.sendRedirect("RentarAuto.jsp");

                        }
                    } else {

                        s.setAttribute("Mensaje", "El cliente no existe");
                        response.sendRedirect("RentarAuto.jsp");

                    }

                } else {

                    s.setAttribute("Mensaje", "Auto no Disponible");
                    response.sendRedirect("RentarAuto.jsp");

                }
            } else {
                s.setAttribute("Mensaje", "Error de Fecha");
                response.sendRedirect("RentarAuto.jsp");
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
