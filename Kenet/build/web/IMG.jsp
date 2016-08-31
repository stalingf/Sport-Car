
<%@page import="java.io.File"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="java.awt.image.RenderedImage"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.awt.RenderingHints"%>
<%@page import="java.awt.Graphics2D"%>
<%@page import="java.io.IOException"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="JDBC.IMG"%>
<%-- 
    Document   : IMG
    Created on : 11-dic-2015, 21:45:51
    Author     : staling
response.setContentType("image/jpeg");
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%

    int nBytes = 0;
    
    ///InputStream is = new IMG().IMG2(request.getParameter("P"), request.getParameter("K"));
    response.setContentType("image/jpeg");
    ////InputStream hhh = request.getInputStream();
    //// porcentaje=  Double.parseDouble(request.getParameter("medida"));
    BufferedImage bf = null;
    try {
        File foto = new File(request.getParameter("K"));
        bf = ImageIO.read(foto);
    } catch (IOException ex) {
        ////Logger.getLogger(Imagen.class.getName()).log(Level.SEVERE, null, ex);
    }
    int ancho = bf.getWidth();
    int alto = bf.getHeight();
    int escalaAncho = Integer.parseInt(request.getParameter("ancho"));///360;///(int) (porcentaje * ancho);
    int escalaAlto = Integer.parseInt(request.getParameter("alto"));//250;///(int) (porcentaje * alto);
    BufferedImage bufim = new BufferedImage(escalaAncho, escalaAlto, bf.getType());
    Graphics2D g = bufim.createGraphics();
    g.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);
    g.drawImage(bf, 0, 0, escalaAncho, escalaAlto, 0, 0, ancho, alto, null);
    g.dispose();
    BufferedImage imBuff = bufim;
    ByteArrayOutputStream baos = new ByteArrayOutputStream();
    ImageIO.write((RenderedImage) imBuff, "jpg", baos);
    byte[] data = baos.toByteArray();

    response.getOutputStream().write(data);
    response.getOutputStream().flush();
    /*OutputStream aux = response.getOutputStream();
    InputStream is = new ByteArrayInputStream(data);
    byte[] buffer = new byte[4096];
    while (true) {
        nBytes = is.read(buffer);
        if (nBytes == -1) {
            is.close();
            aux.flush();
            aux.close();
            break;
        }
        response.setContentType("image/jpeg");
        aux.write(buffer, 0, nBytes);

    }

    is.close();
    aux.flush();
    aux.close();
*/

%> 

