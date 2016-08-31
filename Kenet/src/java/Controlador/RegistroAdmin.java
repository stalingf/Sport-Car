/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Hibernate.Admin;
import Hibernate.Query;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author staling
 */
@MultipartConfig
public class RegistroAdmin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    String destino = null, email = null, nombre = null, Apellido = null, Cedula = null, Telefono = null, clave = null, ruta1 = null;
    ;

    File salida = null;
    Part foto = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        nombre = request.getParameter("Nombre").replace("<script>", "").replace("</script>", "").replace("(", "").replace(")", "").toUpperCase();
        Apellido = request.getParameter("Apellido").replace("<script>", " ").replace("</script>", "").replace("(", "").replace(")", "").toUpperCase();
        Cedula = request.getParameter("Cedula").replace("<script>", " ").replace("</script>", "").replace("(", "").replace(")", "").toUpperCase();
        Telefono = request.getParameter("Telefono").replace("<script>", " ").replace("</script>", "").replace("(", "").replace(")", "").toUpperCase();
        clave = request.getParameter("clave");
        foto = request.getPart("foto");
        email = request.getParameter("Email").replace("<script>", " ").replace("</script>", "").replace("(", "").replace(")", "").toUpperCase();
        String rango = request.getParameter("rango").replace("<script>", " ").replace("</script>", "").replace("(", "").replace(")", "").toUpperCase();

        int peso = (int) foto.getSize();
        Query Q = new Query();

        if (nombre.length() < 2 | Apellido.length() < 2 | Cedula.length() < 2 | Telefono.length() < 2 | clave.length() < 2 | email.length() < 2 | peso < 4 | rango.length() <= 0) {

            HttpSession s = request.getSession();
            s.setAttribute("Mensaje", "Llene Todos los Campos");
            response.sendRedirect("RegistarAdmin.jsp");
        } else if (Q.usoEmail(email)) {

            HttpSession s = request.getSession();
            s.setAttribute("Mensaje", "Este email esta en uso");
            response.sendRedirect("RegistarAdmin.jsp");
        } else {

            destino = request.getServletContext().getRealPath("images/ADMIN/" + nombre);
            if (archivo()) {
                Admin A = new Admin(nombre, Apellido, Cedula, Telefono, ruta1, rango, clave, email);

                if (Q.nuevoAdmin(A)) {
                    HttpSession s = request.getSession();
                    s.setAttribute("Mensaje", "Registro con exito");
                    response.sendRedirect("RegistarAdmin.jsp");

                } else {
                    HttpSession s = request.getSession();
                    s.setAttribute("Mensaje", "Registro Fallido");
                    response.sendRedirect("RegistarAdmin.jsp");
                }
            } else {
                HttpSession s = request.getSession();
                s.setAttribute("Mensaje", "Registro Fallido - Foto");
                response.sendRedirect("RegistarAdmin.jsp");
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

    private boolean archivo() throws IOException {
        if ((int) foto.getSize() > 50) {
            if (guardarimg(1)) {

                ruta1 = "images/ADMIN/" + nombre + "/" + email;
            } else {
                return false;
            }
        }
        return true;
    }

    public boolean guardarimg(int A) throws IOException {
        BufferedImage imagen = null;
        try {
            imagen = ImageIO.read(foto.getInputStream());

            salida = new File(destino);
            if (!salida.exists()) {
                salida.mkdirs();
            }
            int ancho = imagen.getWidth();
            int alto = imagen.getHeight();
            int escalaAncho = 700;///(int) (porcentaje * ancho);
            int escalaAlto = 500;///(int) (porcentaje * alto);
            BufferedImage bufim = new BufferedImage(escalaAncho, escalaAlto, imagen.getType());
            Graphics2D g = bufim.createGraphics();
            g.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);
            g.drawImage(imagen, 0, 0, escalaAncho, escalaAlto, 0, 0, ancho, alto, null);
            g.dispose();
            BufferedImage imagen2 = bufim;

            salida = new File(destino + "/" + email + ".jpg");
            ImageIO.write(imagen2, "jpg", salida);
        } catch (Exception e) {
            return false;
        }

        try {
            int ancho = imagen.getWidth();
            int alto = imagen.getHeight();
            int escalaAncho = 360;///(int) (porcentaje * ancho);
            int escalaAlto = 250;///(int) (porcentaje * alto);
            BufferedImage bufim = new BufferedImage(escalaAncho, escalaAlto, imagen.getType());
            Graphics2D g = bufim.createGraphics();
            g.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);
            g.drawImage(imagen, 0, 0, escalaAncho, escalaAlto, 0, 0, ancho, alto, null);
            g.dispose();
            BufferedImage imBuff = bufim;

            salida = new File(destino + "/" + email + "250x360.jpg");
            ImageIO.write(imBuff, "jpg", salida);
            return true;
        } catch (Exception e) {
            return false;
        }

    }

}
