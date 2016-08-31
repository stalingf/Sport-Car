/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Hibernate.Query;
import Hibernate.Usuario;
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
public class EditarClientes extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Part foto = null;
    String destino = null, cedula = null, ruta1 = null, id = null, nombre = null, apellido = null, telefono;
    File salida = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        id = request.getParameter("K");
        nombre = request.getParameter("Nombre").replace("<script>", " ").replace("</script>", "").replace("(", "").replace(")", "").toUpperCase();
        apellido = request.getParameter("Apellido").replace("<script>", " ").replace("</script>", "").replace("(", "").replace(")", "").toUpperCase();
        cedula = request.getParameter("Cedula").replace("<script>", " ").replace("</script>", "").replace("(", "").replace(")", "").toLowerCase().toUpperCase();
        telefono = request.getParameter("Telefono").replace("<script>", " ").replace("</script>", "").replace("(", "").replace(")", "").toUpperCase();
        foto = request.getPart("foto");

        int peso = (int) foto.getSize();

        if (nombre.length() < 2 | apellido.length() < 2 | cedula.length() < 2 | telefono.length() < 2) {

            HttpSession s = request.getSession();
            s.setAttribute("Mensaje", "Llene Todos los Campos");
            response.sendRedirect("clienteEdit.jsp?K=" + id);

        } else {

            destino = request.getServletContext().getRealPath("images/CLIENTES/" + nombre);
            if (archivo()) {
                if (peso > 4) {

                    if (new Query().editarCliente(new Usuario(nombre, apellido, cedula, telefono, ruta1), id)) {

                        HttpSession s = request.getSession();
                        s.setAttribute("Mensaje", "Exito");
                        response.sendRedirect("clienteEdit.jsp?K=" + id);

                    } else {
                        HttpSession s = request.getSession();
                        s.setAttribute("Mensaje", "Cambios Fallido");
                        response.sendRedirect("clienteEdit.jsp?K=" + id);
                    }
                }
            } else {
                HttpSession s = request.getSession();
                s.setAttribute("Mensaje", "Cambios Fallido - Foto");
                response.sendRedirect("clienteEdit.jsp?K=" + id);

            }

        }

    } // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

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

        if (guardarimg(1)) {
            ruta1 = "images/CLIENTES/" + nombre + "/" + cedula;
        } else {
            return false;
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

            salida = new File(destino + "/" + cedula + ".jpg");
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

            salida = new File(destino + "/" + cedula + "250x360.jpg");
            ImageIO.write(imBuff, "jpg", salida);
            return true;
        } catch (Exception e) {
            return false;
        }

    }
}
