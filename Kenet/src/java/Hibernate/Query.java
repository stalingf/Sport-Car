/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Hibernate;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Scanner;
import java.util.Iterator;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author staling
 */
public class Query implements Runnable {

    public void run() {
        for (int i = 0; i <= 5; i++) {
            System.out.println("Soy el numero" + Thread.currentThread().getName() + " Valor " + i);
        }

    }

    public static void main(String[] args) throws IOException {
        Thread h;
        for (int o = 1; o <= 40; o++) {
            h = new Thread(new Query(), "#" + String.valueOf(o));
            h.start();
        }
        /* 
        Scanner s = new Scanner(System.in);
        System.out.println("Dame un mimero ");
        String numero = s.next();
        System.out.println("hola soy el numero " + numero);
        s.next();

         // Creo la variable fecha1 con la fecha de hoy y luego 
// a la fecha2 le asigno el mismo valor. 
       //Calendar fecha1 = GregorianCalendar.getInstance();
       // Calendar fecha2 = GregorianCalendar.getInstance();

// Ahora le sumo un día a la fecha2 
       // fecha2.set(Calendar.DAY_OF_MONTH, fecha2.get(Calendar.DAY_OF_MONTH) + 1);

// Despliego el valor de ambas variables 
        System.out.println(fecha1.getTime());
        System.out.println(fecha2.getTime());

// Comparo las fechas y despliego el resultado 
        switch (fecha2.compareTo(fecha1)) {
            case 1:
                System.out.println("La fecha2 es mayor");
                break;
            case 0:
                System.out.println("Las fechas son iguales");
                break;
            case -1:
                System.out.println("La fecha2 es menor");
                break;
        }
         */
    }

    public Admin Login(String email, String clave) {

        SessionFactory factory;
        factory = new Configuration().configure().buildSessionFactory();
        Session session = factory.openSession();

        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            /// String sql = "SELECT * FROM admin  WHERE Nombre = "+nombre+" and clave = "+clave;
            SQLQuery query = session.createSQLQuery("SELECT * FROM admin  WHERE email = ? and clave = ?");
            query.addEntity(Admin.class);
            query.setString(0, email);
            query.setString(1, clave);
            List resultado = query.list();
            Admin admin = null;
            for (Iterator ad = resultado.iterator(); ad.hasNext();) {
                admin = (Admin) ad.next();

            }
            tx.commit();
            session.close();
            return admin;
        } catch (HibernateException e) {

        }
        return null;
    }

    public boolean usoEmail(String email) {

        SessionFactory factory = new Configuration().configure().buildSessionFactory();
        Session session = factory.openSession();

        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            /// String sql = "SELECT * FROM admin  WHERE Nombre = "+nombre+" and clave = "+clave;
            SQLQuery query = session.createSQLQuery("SELECT * FROM admin  WHERE email = ?");
            query.addEntity(Admin.class);
            query.setString(0, email);
            List resultado = query.list();
            Admin admin = null;
            for (Iterator ad = resultado.iterator(); ad.hasNext();) {
                admin = (Admin) ad.next();
                if (!admin.getEmail().equals(null) | admin.getEmail() != null) {
                    tx.commit();
                    session.close();
                    return true;
                }

            }
            tx.commit();
            session.close();

        } catch (HibernateException e) {

            return false;
        }
        return false;
    }

    public boolean nuevoAuto(Autos A) {

        SessionFactory factory;
        factory = new Configuration().configure().buildSessionFactory();
        Session session = factory.openSession();

        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            /// String sql = "SELECT * FROM admin  WHERE Nombre = "+nombre+" and clave = "+clave;
            SQLQuery query = session.createSQLQuery("INSERT INTO `autos` (`marca`, `modelo`, `ano`, `codigo`, `foto1`, `foto2`, `foto3`, `foto4`, `foto5`,`estado`, `color`, `taza`, `motivo`) values (?,?,?,?,?,?,?,?,?,?,?,?,?)");

            query.setString(0, A.getMarca());
            query.setString(1, A.getModelo());
            query.setString(2, A.getAno());
            query.setString(3, A.getCodigo());
            query.setString(4, A.getFoto1());
            query.setString(5, A.getFoto2());
            query.setString(6, A.getFoto3());
            query.setString(7, A.getFoto4());
            query.setString(8, A.getFoto5());
            query.setString(9, A.getEstado());
            query.setString(10, A.getColor());
            query.setString(11, A.getTaza());
            query.setString(12, A.getMotivo());
            int resultado = query.executeUpdate();
            tx.commit();
            session.close();
            return true;
        } catch (HibernateException e) {
            return false;
        }

    }

    public boolean nuevoAdmin(Admin A) {

        SessionFactory factory;
        factory = new Configuration().configure().buildSessionFactory();
        Session session = factory.openSession();

        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            /// String sql = "SELECT * FROM admin  WHERE Nombre = "+nombre+" and clave = "+clave;
            SQLQuery query = session.createSQLQuery("INSERT INTO `admin` (`Nombre`, `Apellido`, `Cedula`, `Telefono`, `Foto`, `rango`, `clave`, `email`) values (?,?,?,?,?,?,?,?)");

            query.setString(0, A.getNombre());
            query.setString(1, A.getApellido());
            query.setString(2, A.getClave());
            query.setString(3, A.getTelefono());
            query.setString(4, A.getFoto());
            query.setString(5, A.getRango());
            query.setString(6, A.getClave());
            query.setString(7, A.getEmail());
            int resultado = query.executeUpdate();

            tx.commit();
            session.close();
            return true;
        } catch (HibernateException e) {

        }
        return false;
    }

    public boolean nuevoCliente(Usuario A) {

        SessionFactory factory;
        factory = new Configuration().configure().buildSessionFactory();
        Session session = factory.openSession();

        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            /// String sql = "SELECT * FROM admin  WHERE Nombre = "+nombre+" and clave = "+clave;
            SQLQuery query = session.createSQLQuery("INSERT INTO `usuario` (`nombre`, `apellido`, `cedula`, `telefono`, `foto`) values (?,?,?,?,?)");

            query.setString(0, A.getNombre());
            query.setString(1, A.getApellido());
            query.setString(2, A.getCedula());
            query.setString(3, A.getTelefono());
            query.setString(4, A.getFoto());
            int resultado = query.executeUpdate();
            
            tx.commit();
            session.close();
            return true;
        } catch (HibernateException e) {

        }
        return false;
    }

    public ArrayList<Autos> index(String ID) {

        ArrayList<Autos> A = new ArrayList();
        SessionFactory factory;
        factory = new Configuration().configure().buildSessionFactory();
        Session session = factory.openSession();

        Transaction tx = null;
        try {
            int id = Integer.parseInt(ID);
            id = id * 9;
            tx = session.beginTransaction();
            /// String sql = "SELECT * FROM admin  WHERE Nombre = "+nombre+" and clave = "+clave;

            SQLQuery query = session.createSQLQuery("SELECT * FROM `autos` WHERE ID > ? and estado = ? ORDER BY ID DESC LIMIT 9");
            query.addEntity(Autos.class);
            query.setInteger(0, id);
            query.setString(1, "Disponible");

            List resultado = query.list();

            for (Iterator ad = resultado.iterator(); ad.hasNext();) {
                Autos admin = (Autos) ad.next();
                // Admin auto = new Admin(admin);
                A.add(admin);

            }
            tx.commit();
            session.close();
            return A;
        } catch (HibernateException e) {
            return null;
        }

    }

    public ArrayList<Autos> index2() {

        ArrayList<Autos> A = new ArrayList<Autos>();
        SessionFactory factory;
        factory = new Configuration().configure().buildSessionFactory();
        Session session = factory.openSession();

        Transaction tx = null;
        try {

            tx = session.beginTransaction();

            SQLQuery query = session.createSQLQuery("SELECT * FROM `autos`  where estado = ?  ORDER BY ID DESC LIMIT 4 ");
            query.addEntity(Autos.class);
            ///query.setInteger(0, id);
            query.setString(0, "Disponible");

            List resultado = query.list();

            for (Iterator ad = resultado.iterator(); ad.hasNext();) {
                Autos admin = (Autos) ad.next();
                // Admin auto = new Admin(admin);
                A.add(admin);

            }
            tx.commit();
            session.close();
            return A;
        } catch (HibernateException e) {
            return null;
        }

    }

    public ArrayList<Autos> Taller(String ID) {
        ArrayList<Autos> A = new ArrayList<Autos>();
        SessionFactory factory;
        factory = new Configuration().configure().buildSessionFactory();
        Session session = factory.openSession();

        Transaction tx = null;
        try {
            int id = Integer.parseInt(ID);
            id = id * 9;
            tx = session.beginTransaction();
            /// String sql = "SELECT * FROM admin  WHERE Nombre = "+nombre+" and clave = "+clave;
            SQLQuery query = session.createSQLQuery("SELECT * FROM autos  WHERE estado = ? and ID > ? LIMIT 9 ");
            query.addEntity(Autos.class);
            query.setString(0, "Taller");
            query.setInteger(1, id);

            List resultado = query.list();

            for (Iterator ad = resultado.iterator(); ad.hasNext();) {
                Autos admin = (Autos) ad.next();
                // Admin auto = new Admin(admin);
                A.add(admin);

            }
            tx.commit();
            session.close();
            return A;
        } catch (HibernateException e) {

        }
        return null;

    }

    public ArrayList<Autos> ListaAutos(String ID) {
        ArrayList<Autos> A = new ArrayList<Autos>();
        SessionFactory factory;
        factory = new Configuration().configure().buildSessionFactory();
        Session session = factory.openSession();

        Transaction tx = null;
        try {
            int id = Integer.parseInt(ID);
            id = id * 9;

            tx = session.beginTransaction();
            /// String sql = "SELECT * FROM admin  WHERE Nombre = "+nombre+" and clave = "+clave;
            SQLQuery query = session.createSQLQuery("SELECT * FROM autos WHERE ID > ? LIMIT 9 ");
            query.addEntity(Autos.class);
            query.setInteger(0, id);

            List resultado = query.list();

            for (Iterator ad = resultado.iterator(); ad.hasNext();) {
                Autos admin = (Autos) ad.next();
                System.out.println(admin.getMarca());
                A.add(admin);

            }
            tx.commit();
            session.close();
            return A;
        } catch (HibernateException e) {

            return null;
        }

    }

    public ArrayList<Usuario> ListaClientes(String ID) {
        ArrayList<Usuario> A = new ArrayList<Usuario>();
        SessionFactory factory;
        factory = new Configuration().configure().buildSessionFactory();
        Session session = factory.openSession();

        Transaction tx = null;
        try {
            int id = Integer.parseInt(ID);
            id = id * 9;

            tx = session.beginTransaction();
            /// String sql = "SELECT * FROM admin  WHERE Nombre = "+nombre+" and clave = "+clave;
            SQLQuery query = session.createSQLQuery("SELECT * FROM usuario where ID > ? LIMIT 9 ");
            query.addEntity(Usuario.class);
            query.setInteger(0, id);

            List resultado = query.list();

            for (Iterator ad = resultado.iterator(); ad.hasNext();) {
                Usuario admin = (Usuario) ad.next();

                A.add(admin);

            }
            tx.commit();
            session.close();
            return A;
        } catch (HibernateException e) {

            return null;
        }

    }

    public Autos diponibleAuto(String codigo) {

        SessionFactory factory;
        factory = new Configuration().configure().buildSessionFactory();
        Session session = factory.openSession();

        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            /// String sql = "SELECT * FROM admin  WHERE Nombre = "+nombre+" and clave = "+clave;
            SQLQuery query = session.createSQLQuery("SELECT * FROM autos where estado = ? and codigo = ?");
            query.addEntity(Autos.class);
            query.setString(0, "Disponible");
            query.setString(1, codigo);

            List resultado = query.list();
            Autos auto = null;
            for (Iterator ad = resultado.iterator(); ad.hasNext();) {
                auto = (Autos) ad.next();

            }
            tx.commit();
            session.close();
            return auto;
        } catch (HibernateException e) {

            return null;
        }

    }

    public Usuario usuarioAlquila(String cedula) {

        SessionFactory factory;
        factory = new Configuration().configure().buildSessionFactory();
        Session session = factory.openSession();

        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            /// String sql = "SELECT * FROM admin  WHERE Nombre = "+nombre+" and clave = "+clave;
            SQLQuery query = session.createSQLQuery("SELECT * FROM usuario  WHERE cedula = ?");
            query.addEntity(Usuario.class);
            query.setString(0, cedula);

            List resultado = query.list();
            Usuario Usuario = null;
            for (Iterator ad = resultado.iterator(); ad.hasNext();) {
                Usuario = (Usuario) ad.next();
                System.out.println(Usuario.getNombre());

            }
            tx.commit();
            session.close();
            return Usuario;
        } catch (HibernateException e) {

            return null;
        }

    }

    public ArrayList<Alquilado> Alquilados(String ID) {
        ArrayList<Alquilado> Al = new ArrayList<Alquilado>();
        SessionFactory factory;
        factory = new Configuration().configure().buildSessionFactory();
        Session session = factory.openSession();

        Transaction tx = null;
        try {
            int id = Integer.parseInt(ID);
            id = id * 9;

            tx = session.beginTransaction();
            /// String sql = "SELECT * FROM admin  WHERE Nombre = "+nombre+" and clave = "+clave;
            SQLQuery query = session.createSQLQuery("SELECT * FROM alquilado where estado = ? and ID > ? LIMIT 9 ");

            query.addEntity(Alquilado.class);
            query.setString(0, "Alquilado");
            query.setInteger(1, id);
            List resultado = query.list();
            Alquilado Alquilado = null;
            for (Iterator ad = resultado.iterator(); ad.hasNext();) {
                Alquilado = (Alquilado) ad.next();
                Al.add(Alquilado);

            }
            tx.commit();
            session.close();
            return Al;
        } catch (HibernateException e) {

            return null;
        }

    }

    public boolean alquilar(Alquilado A) {

        SessionFactory factory;
        factory = new Configuration().configure().buildSessionFactory();
        Session session = factory.openSession();

        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            /// String sql = "SELECT * FROM admin  WHERE Nombre = "+nombre+" and clave = "+clave;
            SQLQuery query = session.createSQLQuery("INSERT INTO `alquilado` (`nombreCliente`, `apellidoCliente`, `cedulaCliente`, `fotoCliente`, `marcaAuto`, `modeloAuto`, `codigoAuto`, `fotoAuto`, `rentadoDia`, `paraEntregar`, `RegresadoDia`, `estado`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

            query.setString(0, A.getNombreCliente());
            query.setString(1, A.getApellidoCliente());
            query.setString(2, A.getCedulaCliente());
            query.setString(3, A.getFotoCliente());
            query.setString(4, A.getMarcaAuto());
            query.setString(5, A.getModeloAuto());
            query.setString(6, A.getCodigoAuto());
            query.setString(7, A.getFotoAuto());
            query.setString(8, A.getRentadoDia());
            query.setString(9, A.getParaEntregar());
            query.setString(10, A.getRegresadoDia());
            query.setString(11, A.getEstado());
            int resultado = query.executeUpdate();
            tx.commit();
            session.close();
            return true;
        } catch (HibernateException e) {

            return false;
        }

    }

    public boolean updateAuto(String codigo, String estado) {

        SessionFactory factory;
        factory = new Configuration().configure().buildSessionFactory();
        Session session = factory.openSession();

        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            /// String sql = "SELECT * FROM admin  WHERE Nombre = "+nombre+" and clave = "+clave;
            SQLQuery query = session.createSQLQuery("UPDATE autos set estado = ? WHERE codigo = ?");

            query.setString(0, estado);
            query.setString(1, codigo);

            int resultado = query.executeUpdate();

            tx.commit();
            session.close();
            return true;
        } catch (HibernateException e) {

            return false;
        }

    }

    public boolean regresarAuto(String cedula, String codigo, String entregado) {

        SessionFactory factory;
        factory = new Configuration().configure().buildSessionFactory();
        Session session = factory.openSession();

        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            /// String sql = "SELECT * FROM admin  WHERE Nombre = "+nombre+" and clave = "+clave;

            SQLQuery query = session.createSQLQuery("UPDATE alquilado set `RegresadoDia` = ? , `estado` = ?  WHERE `codigoAuto` = ? and `cedulaCliente` = ?");

            query.setString(0, entregado);
            query.setString(1, "Regresado");
            query.setString(2, codigo);
            query.setString(3, cedula);

            int resultado = query.executeUpdate();

            tx.commit();
            session.close();
            return true;
        } catch (HibernateException e) {

            return false;
        }

    }

    public Autos buscarporid(String codigo) {

        SessionFactory factory;
        factory = new Configuration().configure().buildSessionFactory();
        Session session = factory.openSession();

        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            /// String sql = "SELECT * FROM admin  WHERE Nombre = "+nombre+" and clave = "+clave;
            SQLQuery query = session.createSQLQuery("SELECT * FROM autos where codigo = ? and estado = ?");

            query.addEntity(Autos.class);
            query.setString(0, codigo);
            query.setString(1, "Disponible");
            List resultado = query.list();
            Autos Autos = null;
            for (Iterator ad = resultado.iterator(); ad.hasNext();) {
                Autos = (Autos) ad.next();

            }
            tx.commit();
            session.close();
            return Autos;
        } catch (HibernateException e) {

            return null;
        }

    }

    public boolean ediatarAuto(Autos A, String ID) {

        String foto1 = "", foto2 = "", foto3 = "", foto4 = "", foto5 = "";
        if (A.getFoto1() != null) {
            foto1 = "`foto1` = ? ,";

        }
        if (A.getFoto2() != null) {
            foto2 = "`foto2` = ? ,";

        }
        if (A.getFoto3() != null) {
            foto3 = "`foto3` = ? ,";

        }
        if (A.getFoto4() != null) {
            foto4 = "`foto4` = ? ,";

        }
        if (A.getFoto5() != null) {
            foto5 = "`foto5` = ? ,";

        }

        String sql = "UPDATE autos set `marca` = ? , `modelo` = ? , `ano` = ? ," + foto1 + foto2 + foto3 + foto4 + foto5 + "`color` = ? , `taza` = ? WHERE `codigo` = ?";
        System.out.println(sql);
        SessionFactory factory;
        factory = new Configuration().configure().buildSessionFactory();
        Session session = factory.openSession();

        Transaction tx = null;
        try {
            int cambio = 5;
            tx = session.beginTransaction();
            SQLQuery query = session.createSQLQuery(sql);
            query.setString(0, A.getMarca());
            query.setString(1, A.getModelo());
            query.setString(2, A.getAno());
            if (!foto1.equals("")) {
                cambio += 1;
                query.setString(cambio - 3, A.getFoto1());
            }
            if (!foto2.equals("")) {
                cambio += 1;
                query.setString(cambio - 3, A.getFoto2());
            }
            if (!foto3.equals("")) {
                cambio += 1;
                query.setString(cambio - 3, A.getFoto3());
            }
            if (!foto4.equals("")) {
                cambio += 1;
                query.setString(cambio - 3, A.getFoto4());
            }
            if (!foto5.equals("")) {
                cambio += 1;
                query.setString(cambio - 3, A.getFoto5());
            }

            query.setString(cambio - 2, A.getColor());
            query.setString(cambio - 1, A.getTaza());
            query.setString(cambio, ID);
            int resultado = query.executeUpdate();

            tx.commit();
            session.close();
            return true;
        } catch (HibernateException e) {

            return false;
        }

    }

    public Autos IMGAutos(String ID, String tabla) {

        SessionFactory factory;
        factory = new Configuration().configure().buildSessionFactory();
        Session session = factory.openSession();

        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            /// String sql = "SELECT * FROM admin  WHERE Nombre = "+nombre+" and clave = "+clave;
            SQLQuery query = session.createSQLQuery("SELECT foto FROM " + tabla + " where ID = ?");

            query
                    .addEntity(Autos.class
                    );
            query.setString(0, tabla);
            query.setString(1, ID);
            List resultado = query.list();
            Autos Autos = null;
            for (Iterator ad = resultado.iterator(); ad.hasNext();) {
                Autos = (Autos) ad.next();
                System.out.println(Autos.getMarca());

            }
            tx.commit();
            session.close();
            return Autos;
        } catch (HibernateException e) {

            return null;
        }

    }

    public Usuario BuscarUserparaeditar(String ID) {
        SessionFactory factory;
        factory = new Configuration().configure().buildSessionFactory();
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            /// String sql = "SELECT * FROM admin  WHERE Nombre = "+nombre+" and clave = "+clave;
            SQLQuery query = session.createSQLQuery("SELECT * FROM usuario where ID = ?");

            query
                    .addEntity(Usuario.class
                    );
            query.setString(0, ID);

            List resultado = query.list();
            Usuario Usuario = null;
            for (Iterator ad = resultado.iterator(); ad.hasNext();) {
                Usuario = (Usuario) ad.next();
            }
            tx.commit();
            session.close();
            return Usuario;
        } catch (HibernateException e) {

            return null;
        }

    }

    public boolean editarCliente(Usuario A, String ID) {
        if (A.getFoto() != null) {

            SessionFactory factory;
            factory = new Configuration().configure().buildSessionFactory();
            Session session = factory.openSession();

            Transaction tx = null;
            try {
                tx = session.beginTransaction();

                SQLQuery query = session.createSQLQuery("UPDATE `usuario` SET `nombre` = ?, `apellido` = ?, `cedula` = ?, `telefono` = ?, `foto` = ? WHERE `ID` = ?");

                query.setString(0, A.getNombre());
                query.setString(1, A.getApellido());
                query.setString(2, A.getCedula());
                query.setString(3, A.getTelefono());
                query.setString(4, A.getFoto());
                query.setString(5, ID);

                int resultado = query.executeUpdate();

                tx.commit();
                session.close();
                return true;
            } catch (HibernateException e) {
                tx.commit();
                session.close();
                return false;
            }
        } else {
            SessionFactory factory;
            factory = new Configuration().configure().buildSessionFactory();
            Session session = factory.openSession();

            Transaction tx = null;
            try {
                tx = session.beginTransaction();

                SQLQuery query = session.createSQLQuery("UPDATE `usuario` SET `nombre` = ?, `apellido` = ?, `cedula` = ?, `telefono` = ? WHERE `ID` = ?");

                query.setString(0, A.getNombre());
                query.setString(1, A.getApellido());
                query.setString(2, A.getCedula());
                query.setString(3, A.getTelefono());
                query.setString(4, ID);

                int resultado = query.executeUpdate();

                tx.commit();
                session.close();
                return true;
            } catch (HibernateException e) {
                tx.commit();
                session.close();
                return false;
            }

        }

    }

    public boolean usocedula(String cedula) {

        SessionFactory factory = new Configuration().configure().buildSessionFactory();
        Session session = factory.openSession();

        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            /// String sql = "SELECT * FROM admin  WHERE Nombre = "+nombre+" and clave = "+clave;
            SQLQuery query = session.createSQLQuery("SELECT * FROM usuario  WHERE cedula = ?");
            query.addEntity(Usuario.class);
            query.setString(0, cedula);
            List resultado = query.list();
            Usuario Usuario = null;
            for (Iterator ad = resultado.iterator(); ad.hasNext();) {
                Usuario = (Usuario) ad.next();
                if (!Usuario.getCedula().equals(null) | Usuario.getCedula() != null) {
                    tx.commit();
                    session.close();
                    return true;
                }

            }

        } catch (HibernateException e) {

            return false;
        }
        return false;
    }


    /*
    
    
    
    
    
    
    
    
    
    
    
    
    
    public void testSaveBook() {

        File file = new File("images/extjsfirstlook.jpg");
        byte[] bFile = new byte[(int) file.length()];
        try {
            FileInputStream fileInputStream = new FileInputStream(file);
            fileInputStream.read(bFile);
            fileInputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        Book book = new Book();
        book.setName("Ext JS 4 First Look");

        book.setImage(bFile);
        bookDAO.saveBook(book);
        assertNotNull(book.getId());

    }
    
    
    
    
    
    
    
    
    
    public boolean nuevoCliente(Usuario A) {
        try {
            SessionFactory sesion = HibernateUtil.getSessionFactory();
            Session session;
            session = sesion.openSession();
            Transaction tx = session.beginTransaction();
            session.save(A);
            tx.commit();
            session.close();
            sesion.close();
            A = null;
            return true;

        } catch (Exception e) {
            return false;
        }

    }
    
    
    
    
    
    
    
    
    
    
    
    
    
     public boolean nuevoAdminee(Admin A) {
        try {
            SessionFactory sesion = HibernateUtil.getSessionFactory();
            Session session;
            session = sesion.openSession();
            Transaction tx = session.beginTransaction();
            session.save(A);
            tx.commit();
            session.close();
            sesion.close();
            A = null;
            return true;

        } catch (Exception e) {
            return false;
        }

    }

    
    
    
    
    
     public Admin Login(String nombre, String clave) {
        SessionFactory factory;
        factory = new Configuration().configure().buildSessionFactory();
        Session session = factory.openSession();

        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            /// String sql = "SELECT * FROM admin  WHERE Nombre = "+nombre+" and clave = "+clave;
            SQLQuery query = session.createSQLQuery("SELECT * FROM admin  WHERE Nombre = ? and clave = ?");
            query.addEntity(Admin.class);
            query.setString(0, nombre);
            query.setString(1, clave);
            List resultado = query.list();
            Admin admin ;
            for (Iterator ad = resultado.iterator(); ad.hasNext();) {
                admin = (Admin) ad.next();
                System.out.println(admin.getNombre());

            }
            tx.commit();
            session.close();
            return null;
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        }
        return null;
    }

    
    
    
    
    
    public Admin Login(String nombre, String clave) {
        SessionFactory factory;
        factory = new Configuration().configure().buildSessionFactory();
        Session session = factory.openSession();

        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            String sql = "SELECT * FROM admin  WHERE Nombre = " + nombre + " and clave = " + clave;
            SQLQuery query = session.createSQLQuery(sql);
            query.addEntity(Admin.class);
            List resultado = query.list();

            for (Iterator ad = resultado.iterator(); ad.hasNext();) {
                Admin admin = (Admin) ad.next();
                System.out.println(admin.getNombre());

            }
            tx.commit();
            session.close();
            return null;
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        }
        return null;
    }
     */
}
