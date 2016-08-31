/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Hibernate.Autos;
import Hibernate.Query;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
public class RegistrarAutos extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    String destino = null, codigo = null, ruta1 = null, ruta2 = null, ruta3 = null, ruta4 = null, ruta5 = null, marca = null, modelo = null, ano = null, color = null, taza = null;
    Part foto1 = null, foto2 = null, foto3 = null, foto4 = null, foto5 = null;
    File salida = null;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        marca = request.getParameter("Marca").replace("<script>", "").replace("</script>", "").replace("(", "").replace(")", "").toUpperCase();
        modelo = request.getParameter("Modelo").replace("<script>", "").replace("</script>", "").replace("(", "").replace(")", "").toUpperCase();
        ano = request.getParameter("Ano").replace("<script>", "").replace("</script>", "").replace("(", "").replace(")", "").toUpperCase();
        color = request.getParameter("Color").replace("<script>", "").replace("</script>", "").replace("(", "").replace(")", "").toUpperCase();
        taza = request.getParameter("Taza").replace("<script>", "").replace("</script>", "").replace("(", "").replace(")", "").toUpperCase();
        foto1 = request.getPart("foto1");
        foto2 = request.getPart("foto2");
        foto3 = request.getPart("foto3");
        foto4 = request.getPart("foto4");
        foto5 = request.getPart("foto5");
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Calendar cal = Calendar.getInstance();
        String fecha = dateFormat.format(cal.getTime());
        HttpSession s = request.getSession();
        int peso = (int) foto1.getSize();
        if (marca.length() < 2 | modelo.length() < 2 | ano.length() < 2 | color.length() < 2 | taza.length() < 2 | peso < 4) {
            s.setAttribute("Mensaje", "Llene Todos los Campos");
            response.sendRedirect("RegistrarAutos.jsp");
            System.out.println("");
        } else {
            destino = request.getServletContext().getRealPath("images/AUTOS/" + marca + "/" + modelo + "/" + ano + "/" + codigo);
             ///destino = "C:\\Users\\STALING\\Documents\\NetBeansProjects\\Tienda\\target\\Tienda-1.0-SNAPSHOT\\resources\\images" ;
            if (archivo()) {
                int i = fecha.length();
                String A = fecha.substring(2, 4);
                String B = fecha.substring(9, 10);
                String C = fecha.substring(6, 7);
                String E = fecha.substring(17, i);
                String F = fecha.substring(14, 16);
                codigo = F + C + A + E + B;
                Autos a = new Autos(marca, modelo, ano, codigo, ruta1, ruta2, ruta3, ruta4, ruta5, "Disponible", color, taza, null);
                if (new Query().nuevoAuto(a)) {
                    s.setAttribute("Mensaje", "Auto Registrado con exito");
                    response.sendRedirect("RegistrarAutos.jsp");
                } else {
                    s.setAttribute("Mensaje", "Registro de Auto Fallido");
                    response.sendRedirect("RegistrarAutos.jsp");
                }
            } else {
                s.setAttribute("Mensaje", "Registro de Auto Fallido - Foto");
                response.sendRedirect("RegistrarAutos.jsp");
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

    public boolean archivo() throws IOException {
        if ((int) foto1.getSize() > 4) {
            if (guardarimg(1)) {

                ruta1 = "images/AUTOS/" + marca + "/" + modelo + "/" + ano + "/" + codigo + "/" + codigo + 1;
            } else {
                return false;
            }
        }
        if ((int) foto2.getSize() > 4) {
            if (guardarimg(2)) {
                ruta2 = "images/AUTOS/" + marca + "/" + modelo + "/" + ano + "/" + codigo + "/" + codigo + 2;
            } else {
                return false;
            }
        }
        if ((int) foto3.getSize() > 4) {
            if (guardarimg(3)) {
                ruta3 = "images/AUTOS/" + marca + "/" + modelo + "/" + ano + "/" + codigo + "/" + codigo + 3;
            } else {
                return false;
            }
        }
        if ((int) foto4.getSize() > 4) {
            if (guardarimg(4)) {
                ruta4 = "images/AUTOS/" + marca + "/" + modelo + "/" + ano + "/" + codigo + "/" + codigo + 4;
            } else {
                return false;
            }
        }
        if ((int) foto5.getSize() > 4) {
            if (guardarimg(5)) {
                ruta5 = "images/AUTOS/" + marca + "/" + modelo + "/" + ano + "/" + codigo + "/" + codigo + 5;
            } else {
                return false;
            }
        }
        return true;
    }

    public boolean guardarimg(int A) throws IOException {
        BufferedImage imagen = null;
        try {
            switch (A) {
                case 1:
                    imagen = ImageIO.read(foto1.getInputStream());
                    break;
                case 2:
                    imagen = ImageIO.read(foto2.getInputStream());
                    break;
                case 3:
                    imagen = ImageIO.read(foto3.getInputStream());
                    break;
                case 4:
                    imagen = ImageIO.read(foto4.getInputStream());
                    break;
                case 5:
                    imagen = ImageIO.read(foto5.getInputStream());
                    break;
                default:
                    break;
            }

        } catch (Exception e) {
            return false;
        }

        try {

            salida = new File(destino);
            if (!salida.exists()) {
                salida.mkdirs();
            }
            int ancho = imagen.getWidth();
            int alto = imagen.getHeight();
            int escalaAncho = 1150;///(int) (porcentaje * ancho);
            int escalaAlto = 450;///(int) (porcentaje * alto);
            BufferedImage bufim = new BufferedImage(escalaAncho, escalaAlto, imagen.getType());
            Graphics2D g = bufim.createGraphics();
            g.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);
            g.drawImage(imagen, 0, 0, escalaAncho, escalaAlto, 0, 0, ancho, alto, null);
            g.dispose();
            BufferedImage imagen2 = bufim;

            salida = new File(destino + "/" + "29.jpg");
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

            salida = new File(destino + "/" + codigo + A + "250x360.jpg");
            ImageIO.write(imBuff, "jpg", salida);
            
        } catch (Exception e) {
            return false;
        }
       return true;

    }
}
