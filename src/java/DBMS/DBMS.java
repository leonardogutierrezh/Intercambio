package DBMS;

import Clases.*;
import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author gustavo
 * @Modified by dreabalbas
 */
public class DBMS {

    static private Connection conexion;

    protected DBMS() {
    }
    static private DBMS instance = null;

    static public DBMS getInstance() {
        if (null == DBMS.instance) {
            DBMS.instance = new DBMS();
        }
        conectar();
        return DBMS.instance;
    }

    public static boolean conectar() {
        try {
            Class.forName("org.postgresql.Driver");
            conexion = DriverManager.getConnection(
                    "jdbc:postgresql://localhost:5432/postgres",
                    "postgres",
                    "postgres");
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean Sistema() {
        PreparedStatement psSistema = null;
        try {
            psSistema = conexion.prepareStatement("SELECT * FROM \"dycicle\".sistema");

            ResultSet salida = psSistema.executeQuery();
            salida.next();
            return salida.getBoolean("cerrado");

        } catch (SQLException ex) {
            Logger.getLogger(DBMS.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }

    }

    public boolean CambiarSistema(boolean b) {

        String psSistema = null;
        try {

            Statement stm = conexion.createStatement();
            /*Si b es true es para activar el sistema si es false es para desactivarlo*/
            if (b) {
                stm = conexion.createStatement();
                psSistema = "UPDATE \"dycicle\".sistema SET cerrado= FALSE ";
                b = false;
            } else {
                stm = conexion.createStatement();
                psSistema = "UPDATE \"dycicle\".sistema SET cerrado= TRUE ";
                b = true;
            }

            int a = stm.executeUpdate(psSistema);
            return b;

        } catch (SQLException ex) {
            Logger.getLogger(DBMS.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }

    }

    /* Esta funcion se utiliza cuando un usuario inicia sesion
     * para verificar que su nombre y contrasena sean correctos
     * 
     */
    public Usuario consultarUsuario(Usuario u) {
        PreparedStatement psConsultar = null;
        try {

            psConsultar = conexion.prepareStatement("SELECT * FROM \"dycicle\".usuario"
                    + " WHERE nombreusuario = ? AND contrasena = ?");

            psConsultar.setString(1, u.getNombreusuario());
            psConsultar.setString(2, u.getContrasena());
            ResultSet rs = psConsultar.executeQuery();
            while (rs.next()) {

                u.setPrivilegio(rs.getInt("privilegio"));
                if (u.getPrivilegio() == 5 || u.getPrivilegio() == 6) {
                    Usuario aux = obtenerEstadoSolicitud(u);
                    u.setConfirmar(aux.getConfirmar());
                }
                u.setNombre(rs.getString("nombre"));
                u.setEmail(rs.getString("email"));
                return u;
            }

        } catch (SQLException ex) {
            Logger.getLogger(DBMS.class.getName()).log(Level.SEVERE, null, ex);
        }

        u.setNombreusuario(null);

        return u;
    }

    public boolean agregarUsuario(Usuario u) {

        PreparedStatement psAgregar = null;

        try {
            psAgregar = conexion.prepareStatement("INSERT INTO \"dycicle\".usuario VALUES (?,?,?,?,?);");
            psAgregar.setString(1, u.getNombreusuario());
            psAgregar.setString(2, u.getEmail());
            psAgregar.setInt(3, u.getPrivilegio());
            psAgregar.setString(4, u.getNombre());
            psAgregar.setString(5, u.getContrasena());
            Integer i = psAgregar.executeUpdate();
            return i > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return false;
    }

    public boolean eliminarUsuario(Usuario u) {
        try {

            String nombreusuario = u.getNombreusuario();
            String sqlquery = "SELECT privilegio FROM \"dycicle\".usuario"
                    + " WHERE nombreusuario = '" + nombreusuario + "'";

            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);

            boolean prox = rs.next();
            int privilegio = rs.getInt("privilegio");

            Integer i, j, k, l, m, n, o, p, q, r;
            i = 1;
            j = 1;
            k = 1;
            l = 1;
            m = 1;
            n = 1;
            o = 1;
            p = 1;
            q = 1;
            r = 1;

            if (privilegio == 2) {
                sqlquery = "DELETE FROM \"dycicle\".gestor WHERE nombreusuario = '"
                        + nombreusuario + "'";
            } else if (privilegio == 3 || privilegio == 4) {
                sqlquery = "DELETE FROM \"dycicle\".postulante WHERE nombreusuario = '"
                        + nombreusuario + "'";
            } else if (privilegio == 5) {
                /*Elimino de la tabla financiamiento*/
                sqlquery = "DELETE FROM \"dycicle\".financiamiento WHERE nombreusuario = '"
                        + nombreusuario + "'";
                stmt = conexion.createStatement();
                i = stmt.executeUpdate(sqlquery);
                /*Elimino de la tabla antecedente*/
                sqlquery = "DELETE FROM \"dycicle\".antecedenteacademico WHERE nombreusuario = '"
                        + nombreusuario + "'";
                stmt = conexion.createStatement();
                j = stmt.executeUpdate(sqlquery);
                /*Elimino de la tabla idiomas*/
                sqlquery = "DELETE FROM \"dycicle\".idiomas WHERE nombreusuario = '"
                        + nombreusuario + "'";
                stmt = conexion.createStatement();
                k = stmt.executeUpdate(sqlquery);
                /*Elimino de la tabla representante*/
                sqlquery = "DELETE FROM \"dycicle\".representante WHERE nombreusuario = '"
                        + nombreusuario + "'";
                stmt = conexion.createStatement();
                l = stmt.executeUpdate(sqlquery);
                /*Elimino de la tabla archivos*/
                sqlquery = "DELETE FROM \"dycicle\".archivosestudiante WHERE nombreusuario = '"
                        + nombreusuario + "'";
                stmt = conexion.createStatement();
                m = stmt.executeUpdate(sqlquery);
                /*Elimino de la tabla planestudio*/
                sqlquery = "DELETE FROM \"dycicle\".planestudio WHERE nombreusuario = '"
                        + nombreusuario + "'";
                stmt = conexion.createStatement();
                n = stmt.executeUpdate(sqlquery);
                /*Elimino de la tabla universidades*/
                sqlquery = "DELETE FROM \"dycicle\".universidades WHERE nombreusuario = '"
                        + nombreusuario + "'";
                stmt = conexion.createStatement();
                o = stmt.executeUpdate(sqlquery);
                /*Elimino de la tabla postulacion*/
                sqlquery = "DELETE FROM \"dycicle\".postulacion WHERE nombreusuario = '"
                        + nombreusuario + "'";
                stmt = conexion.createStatement();
                p = stmt.executeUpdate(sqlquery);
                /*Elimino de la tabla estudianteusb*/
                sqlquery = "DELETE FROM \"dycicle\".estudianteusb WHERE nombreusuario = '"
                        + nombreusuario + "'";
                stmt = conexion.createStatement();
                r = stmt.executeUpdate(sqlquery);
                /*Se deja el sql para que sea eliminado despues*/
                sqlquery = "DELETE FROM \"dycicle\".estudiante WHERE nombreusuario = '"
                        + nombreusuario + "'";

            } else if (privilegio == 6) {
                /*Elimino de la tabla antecedente*/
                sqlquery = "DELETE FROM \"dycicle\".antecedenteacademico WHERE nombreusuario = '"
                        + nombreusuario + "'";
                stmt = conexion.createStatement();
                i = stmt.executeUpdate(sqlquery);
                /*Elimino de la tabla idiomas*/
                sqlquery = "DELETE FROM \"dycicle\".idiomas WHERE nombreusuario = '"
                        + nombreusuario + "'";
                stmt = conexion.createStatement();
                j = stmt.executeUpdate(sqlquery);
                /*Elimino de la tabla representante*/
                sqlquery = "DELETE FROM \"dycicle\".representante WHERE nombreusuario = '"
                        + nombreusuario + "'";
                stmt = conexion.createStatement();
                k = stmt.executeUpdate(sqlquery);
                /*Elimino de la tabla archivos*/
                sqlquery = "DELETE FROM \"dycicle\".archivosestudiante WHERE nombreusuario = '"
                        + nombreusuario + "'";
                stmt = conexion.createStatement();
                l = stmt.executeUpdate(sqlquery);
                /*Elimino de la tabla planestudio*/
                sqlquery = "DELETE FROM \"dycicle\".planestudio WHERE nombreusuario = '"
                        + nombreusuario + "'";
                stmt = conexion.createStatement();
                m = stmt.executeUpdate(sqlquery);
                /*Elimino de la tabla universidades*/
                sqlquery = "DELETE FROM \"dycicle\".universidades WHERE nombreusuario = '"
                        + nombreusuario + "'";
                stmt = conexion.createStatement();
                n = stmt.executeUpdate(sqlquery);
                /*Elimino de la tabla postulacion*/
                sqlquery = "DELETE FROM \"dycicle\".postulacion WHERE nombreusuario = '"
                        + nombreusuario + "'";
                stmt = conexion.createStatement();
                o = stmt.executeUpdate(sqlquery);
                sqlquery = "DELETE FROM \"dycicle\".estudianteinternacional WHERE nombreusuario = '"
                        + nombreusuario + "'";
                stmt = conexion.createStatement();
                p = stmt.executeUpdate(sqlquery);
                sqlquery = "DELETE FROM \"dycicle\".estudiante WHERE nombreusuario = '"
                        + nombreusuario + "'";
            }

            stmt = conexion.createStatement();
            q = stmt.executeUpdate(sqlquery);

            Integer s = 1;
            sqlquery = "DELETE FROM \"dycicle\".usuario" + " WHERE nombreusuario = '"
                    + nombreusuario + "'";
            stmt = conexion.createStatement();
            s = stmt.executeUpdate(sqlquery);

            return (i > 0 && j > 0 && k > 0 && l > 0 && m > 0 && n > 0 && o > 0 && p > 0 && q > 0 && r > 0) || s > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public boolean agregarGestor(Usuario g) {
        PreparedStatement psAgregar = null;

        try {
            psAgregar = conexion.prepareStatement("INSERT INTO \"dycicle\".gestor VALUES (?,?);");
            psAgregar.setString(1, g.getNombreusuario());
            psAgregar.setString(2, g.getNombreusuario());
            Integer i = psAgregar.executeUpdate();
            return i > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return false;
    }

    public boolean agregarCoordUSB(Postulante p) {
        PreparedStatement psAgregar = null;
        try {
            psAgregar = conexion.prepareStatement("INSERT INTO \"dycicle\".postulante VALUES (?,?,?, 'null',?);");
            psAgregar.setString(1, p.getNombreusuario());
            psAgregar.setString(2, p.getCodigo());
            psAgregar.setString(3, p.getTipo());
            psAgregar.setString(4, p.getNombreCarrera());;
            Integer i = psAgregar.executeUpdate();
            return i > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return false;
    }

    public boolean agregarUniExt(Postulante p) {

        PreparedStatement psAgregar = null;

        try {
            psAgregar = conexion.prepareStatement("INSERT INTO \"dycicle\".postulante VALUES (?,?,?,?, 'null');");
            psAgregar.setString(1, p.getNombreusuario());
            psAgregar.setString(2, p.getNombreUniExt());
            psAgregar.setString(3, p.getTipo());
            psAgregar.setString(4, p.getNombreUniExt());
            Integer i = psAgregar.executeUpdate();
            return i > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return false;
    }

    /*
     * Esta funcion es la de agregar estudiante desde el administrador
     */
    public boolean agregarEstudianteUSB(EstudianteUSB e) {
        /*
         * este va a tener rollback
         */
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        PreparedStatement ps3 = null;
        PreparedStatement ps4 = null;
        PreparedStatement ps5 = null;
        try {
            conexion.setAutoCommit(false);
            ps1 = conexion.prepareStatement("SELECT nombrecarrera,codigo FROM \"dycicle\".postulante where "
                    + "nombreusuario =?;");
            ps1.setString(1, e.getCarrera());
            ResultSet rs = ps1.executeQuery();
            conexion.commit();

            while (rs.next()) {
                e.setCodCarrera(rs.getString("codigo"));
                e.setCarrera(rs.getString("nombrecarrera"));
            }

            ps2 = conexion.prepareStatement("INSERT INTO \"dycicle\".estudiante VALUES ("
                    + "?, '" + "null" + "',?,?,?,?,?,?,"
                    + " 'null','null', 'null',  'null', 'null', 'null', 'null', "
                    + " 'null', 'null', 'null',?, '2012-11-27','null','null');");
            ps2.setString(1, e.getNombreusuario());
            ps2.setString(2, e.getpNombre());
            ps2.setString(3, e.getsNombre());
            ps2.setString(4, e.getpApellido());
            ps2.setString(5, e.getsApellido());
            ps2.setString(6, e.getCarrera());
            ps2.setInt(7, Integer.parseInt(e.getCodCarrera()));
            ps2.setString(8, e.getEmail());

            //falta el carnet el en jsp
            ps3 = conexion.prepareStatement("INSERT INTO \"dycicle\".estudianteUSB VALUES("
                    + " ?,  'null' ,?);");
            ps3.setString(1, e.getNombreusuario());
            ps3.setString(2, e.getCarnet());


            ps4 = conexion.prepareStatement("INSERT INTO \"dycicle\".AntecedenteAcademico VALUES ("
                    + "?, '1.0000','null','null',?, "
                    + "'opcion', '0', '0000', '0', 'null', 'null');");

            ps4.setString(1, e.getNombreusuario());
            ps4.setString(2, e.getCarrera());

            ps5 = conexion.prepareStatement("INSERT INTO \"dycicle\".Postulacion VALUES ("
                    + "?, 'Sin postular', 'recomendacion', 'comentario');");
            ps5.setString(1, e.getNombreusuario());


            /*ejecuciones*/

            Integer i = ps2.executeUpdate();
            conexion.commit();
            Integer j = ps3.executeUpdate();
            conexion.commit();
            Integer k = ps4.executeUpdate();
            conexion.commit();
            Integer l = ps5.executeUpdate();
            conexion.commit();

            /*volvemos a como estabamos*/
            conexion.setAutoCommit(true);

            return i > 0 && j > 0 && k > 0 && l > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
            try {
                System.out.println("haciendo rollback");
                conexion.rollback();
            } catch (SQLException excep) {
                System.out.println("No se pudo hacer rollback");

            }
            /*Cerramos las conexiones*/
        }
        try {
            if (ps1 != null) {
                ps1.close();
            }
            if (ps2 != null) {
                ps2.close();
            }
            if (ps3 != null) {
                ps3.close();
            }
            if (ps4 != null) {
                ps4.close();
            }
            if (ps5 != null) {
                ps5.close();
            }
            conexion.setAutoCommit(true);
        } catch (SQLException excep) {
            System.out.println("No se cerro la conexion");
            try {
                conexion.setAutoCommit(true);
            } catch (SQLException excep2) {
                System.out.println("falla");
            }
        }

        return false;
    }

    /*
     * Esta funcion es la de agregar estudiante desde el administrador
     */
    public boolean agregarEstudianteExt(EstudianteInternacional e) {
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        PreparedStatement ps3 = null;
        PreparedStatement ps4 = null;
        try {

            ps1 = conexion.prepareStatement("INSERT INTO \"dycicle\".estudiante VALUES (?"
                    + ", 'null',?,?,?,?, 'null', '0000', 'null','null', 'null',"
                    + "'null', 'null', 'null', 'null',"
                    + " 'null', 'null', 'null',?, '2012-11-27','null','null');");
            ps1.setString(1, e.getNombreusuario());
            ps1.setString(2, e.getpNombre());
            ps1.setString(3, e.getsNombre());
            ps1.setString(4, e.getpApellido());
            ps1.setString(5, e.getsApellido());
            ps1.setString(6, e.getEmail());
            // Insercion dentro de la tabla estudiante

            // la fecha de nacimiento colocada es temporal, se coloca para que no de error la insercion.
            // La direccion de la foto tambien es temporal.

            //Insercion dentro de la tabla estudianteInternacional
            ps2 = conexion.prepareStatement("INSERT INTO \"dycicle\".estudianteInternacional VALUES(?"
                    + ",?, 'null', 'null', 'null', 'No');");
            ps2.setString(1, e.getNombreusuario());
            ps2.setInt(2, e.getPasaporte());

            //Insercion dentro de la tabla AntecedenteAcademico
            ps3 = conexion.prepareStatement("INSERT INTO \"dycicle\".AntecedenteAcademico"
                    + " VALUES (?, '1.0000', 'null','null', 'null', "
                    + "'opcion', '0','0000' , '0', 'null', 'null');");
            ps3.setString(1, e.getNombreusuario());
            ps4 = conexion.prepareStatement("INSERT INTO \"dycicle\".Postulacion"
                    + " VALUES (?, 'En evaluacion', 'recomendacion', 'comentario');");
            ps4.setString(1, e.getNombreusuario());
            Statement stmt = conexion.createStatement();
            Integer i = ps1.executeUpdate();
            Integer j = ps2.executeUpdate();
            Integer k = ps3.executeUpdate();
            Integer l = ps4.executeUpdate();

            return i > 0 && j > 0 && k > 0 && l > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public boolean modificarUsuario(Usuario u) {
        PreparedStatement psModificar = null;
        try {
            psModificar = conexion.prepareStatement("UPDATE \"dycicle\".usuario SET email= ?, nombre= ?, privilegio= ? "
                    + "WHERE nombreusuario =? ");
            psModificar.setString(1, u.getEmail());
            psModificar.setString(2, u.getNombre());
            psModificar.setInt(3, u.getPrivilegio());
            psModificar.setString(4, u.getNombreusuario());

            Integer i = psModificar.executeUpdate();
            return i > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public Usuario obtenerEstadoSolicitud(Usuario u) {
        PreparedStatement ps = null;
        try {
            ps = conexion.prepareStatement("SELECT estadopostulacion FROM \"dycicle\".POSTULACION WHERE nombreusuario = ?");
            ps.setString(1, u.getNombreusuario());
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                u.setConfirmar(rs.getString("estadopostulacion"));
            }

            return u;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public boolean cambiarEstadoSolicitud(Usuario u) {
        PreparedStatement ps = null;
        try {

            ps = conexion.prepareStatement("UPDATE \"dycicle\".POSTULACION SET estadopostulacion = ? "
                    + "WHERE nombreusuario = ?");
            ps.setString(1, u.getConfirmar());
            ps.setString(2, u.getNombreusuario());
            Integer i = ps.executeUpdate();

            return i > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public boolean modificarPerfil(Usuario u) {
        String query = "UPDATE \"dycicle\".usuario SET ";
        try {
            if (!u.getNuevacontra().equals("")) {
                query += "contrasena = '" + u.getNuevacontra() + "', ";
            }
            if (!u.getNombre().equals("")) {
                query += "nombre = '" + u.getNombre() + "', ";
            }

            if (!u.getEmail().equals("")) {
                query += "email = '" + u.getEmail() + "', ";
            }

            query = query.substring(0, query.length() - 2);
            query += " WHERE nombreusuario ='" + u.getNombreusuario() + "'";

            Statement stmt = conexion.createStatement();
            Integer i = stmt.executeUpdate(query);

            return i > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public ArrayList<Usuario> listarUsuarios() {

        ArrayList<Usuario> usrs = new ArrayList<Usuario>(0);
        PreparedStatement ps = null;
        try {
            ps = conexion.prepareStatement("SELECT * FROM \"dycicle\".usuario");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Usuario u = new Usuario();
                u.setNombreusuario(rs.getString("nombreusuario"));
                u.setEmail(rs.getString("email"));
                usrs.add(u);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return usrs;
    }

        public ArrayList<Usuario> listarCoordinaciones() {

        ArrayList<Usuario> usrs = new ArrayList<Usuario>(0);
        PreparedStatement ps = null;
        try {
            ps = conexion.prepareStatement("SELECT * FROM \"dycicle\".usuario WHERE privilegio = 3");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Usuario u = new Usuario();
                u.setNombreusuario(rs.getString("nombreusuario"));
                u.setEmail(rs.getString("email"));
                usrs.add(u);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return usrs;
    }
    
    public ArrayList<Usuario> listarDestinatarios(String[] nombres) {

        ArrayList<Usuario> usrs = new ArrayList<Usuario>(0);
        PreparedStatement ps = null;
        try {
            for (int i = 0; i < nombres.length; i++) {
                ps = conexion.prepareStatement("SELECT * FROM \"dycicle\".usuario WHERE "
                        + "nombreusuario =?");
                ps.setString(1, nombres[i]);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    Usuario u = new Usuario();
                    u.setNombreusuario(rs.getString("nombreusuario"));
                    u.setNombre(rs.getString("nombre"));
                    u.setEmail(rs.getString("email"));
                    usrs.add(u);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return usrs;
    }

    public ArrayList<String> listarDocumentos(Usuario u) throws SQLException {

        ArrayList<String> archivos = new ArrayList<String>(0);
        try {
            PreparedStatement ps = null;
            ps = conexion.prepareStatement("SELECT * FROM \"dycicle\".archivosestudiante WHERE nombreusuario= ?;");
            ps.setString(1, u.getNombreusuario());

            ResultSet rs = ps.executeQuery();
            String p = null;


            while (rs.next()) {
                p = rs.getString("direccion");
            }
            if (p == null) {
                return null;
            } else {

                File dir = new File(p);
                for (File child : dir.listFiles()) {
                    String tmp;

                    tmp = child.getAbsolutePath();
                    if (tmp.endsWith("PlanillaIntercambio_USB.pdf")||tmp.endsWith("PlanillaIntercambio_Ext.pdf")) {
                        archivos.add(0, tmp);
                    } else {
                        archivos.add(tmp);
                    }
                }
            }

            return archivos;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return archivos;
    }

    public ArrayList<Usuario> listarEstudiantesPostulados() {

        ArrayList<Usuario> usrs = new ArrayList<Usuario>(0);
        PreparedStatement ps = null;

        try {
            ps = conexion.prepareStatement("SELECT * FROM \"dycicle\".estudiante NATURAL JOIN \"dycicle\".postulacion");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Usuario u = new Usuario();
                u.setNombreusuario(rs.getString("nombreusuario"));
                u.setEmail(rs.getString("email"));
                u.setConfirmar(rs.getString("estadopostulacion"));
                usrs.add(u);
            };

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return usrs;
    }

    public ArrayList<Usuario> listarEstudiantes(Usuario u) {

        ArrayList<Usuario> usrs = new ArrayList<Usuario>(0);

        try {

            String sqlquery = "SELECT * FROM \"dycicle\".estudiante WHERE "
                    + "carreraEst = '" + u.getNombreusuario() + "';";

            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);
            while (rs.next()) {
                Usuario t = new Usuario();
                t.setNombreusuario(rs.getString("nombreusuario"));
                usrs.add(t);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return usrs;
    }
    
        public ArrayList<Usuario> listarPostuladosCoordinacion(Usuario u) {

        ArrayList<Usuario> usrs = new ArrayList<Usuario>(0);

        try {
            PreparedStatement ps = conexion.prepareStatement("SELECT * FROM \"dycicle\".estudiante NATURAL JOIN \"dycicle\".postulacion WHERE estadopostulacion = 'En evaluacion' and "
                    + "carreraEst = '" + u.getNombreusuario() + "';");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Usuario t = new Usuario();
                t.setNombreusuario(rs.getString("nombreusuario"));
                usrs.add(t);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return usrs;
    }

        public Estudiante obtenerEstudiante(Usuario u) {

        Estudiante usrs = new Estudiante();

        try {
            PreparedStatement ps = conexion.prepareStatement("SELECT * FROM \"dycicle\".estudiante WHERE "
                    + "nombreusuario = '" + u.getNombreusuario() + "';");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
            usrs.setOrigen(rs.getString("origen"));
            usrs.setpNombre(rs.getString("primernombre"));
            usrs.setpApellido(rs.getString("primerapellido"));
            usrs.setSexo(rs.getString("sexo"));
            usrs.setUrb(rs.getString("urbanizacion"));
            usrs.setCalle(rs.getString("calle"));
            usrs.setApartamento(rs.getString("apartamento"));
            usrs.setEdificio(rs.getString("edificio"));
            usrs.setApartamento(rs.getString("apartamento"));
            usrs.setCiudad(rs.getString("ciudad"));
            usrs.setEstado("estado");
            usrs.setTelefonoCelular(rs.getString("telefonocel"));
            usrs.setTelefonoCasa(rs.getString("telefonocasa"));
            usrs.setEmail(rs.getString("email"));
            usrs.setFechaNacimiento(rs.getString("fechanac"));
            usrs.setNacionalidad(rs.getString("nacionalidad"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return usrs;
    }
     
      public AntecedentesAcademicos obtenerAntecedente(Usuario u) {

        AntecedentesAcademicos usrs = new AntecedentesAcademicos();

        try {
            PreparedStatement ps = conexion.prepareStatement("SELECT * FROM \"dycicle\".antecedenteacademico WHERE "
                    + "nombreusuario = '" + u.getNombreusuario() + "';");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
            usrs.setIndice(rs.getDouble("indice"));
            usrs.setCarrera(rs.getString("carrera"));
            usrs.setDecanato(rs.getString("decanato"));
            usrs.setcredAprob(rs.getString("credaprob"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return usrs;
    }
        
        public Representante obtenerRepresentante(Usuario u) {

        Representante usrs = new Representante();

        try {
            PreparedStatement ps = conexion.prepareStatement("SELECT * FROM \"dycicle\".representante WHERE "
                    + "nombreusuario = '" + u.getNombreusuario() + "';");
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
              System.out.println("pruebaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
              System.out.println(rs.getString("nombres"));
              usrs.setNombres(rs.getString("nombres"));
              usrs.setApellidos(rs.getString("apellidos"));
              usrs.setTelefonocel(rs.getString("telefonocel"));
              usrs.setTelefonohab(rs.getString("telefonohab"));
              usrs.setEmailrep(rs.getString("emailrep"));
              usrs.setTiporelacion(rs.getString("tiporelacion"));
              usrs.setDireccion(rs.getString("direccion"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        System.out.println(usrs.getApellidos());
        return usrs;
    }
        
    public ArrayList<Idioma> obtenerIdioma(Usuario u) {
        ArrayList<Idioma> usrs = new ArrayList<Idioma>(0);

        try {
            PreparedStatement ps = conexion.prepareStatement("SELECT * FROM \"dycicle\".idiomas WHERE "
                    + "nombreusuario = '" + u.getNombreusuario() + "';");
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
              Idioma i = new Idioma();
              i.setNombreidioma(rs.getString("nombreidioma"));
              i.setNivelverbal(rs.getString("nivelverbal"));
              i.setNivelescrito(rs.getString("nivelescrito"));
              usrs.add(i);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return usrs;
    }
        
    public Usuario obtenerDatos(Usuario u) {

        Usuario datos = new Usuario();
        PreparedStatement ps = null;
        try {
            ps = conexion.prepareStatement("SELECT * FROM \"dycicle\".usuario"
                    + " WHERE nombreusuario = ?");
            ps.setString(1, u.getNombreusuario());

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                datos.setNombre(rs.getString("nombre"));
                datos.setNombreusuario(rs.getString("nombreusuario"));
                datos.setEmail(rs.getString("email"));
                datos.setPrivilegio(rs.getInt("privilegio"));
                datos.setContrasena(rs.getString("contrasena"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return datos;
    }

    public boolean agregarPlanillaUSB(PlanillaUSB p) {
        try {

            String sqlqueryEstudiante = "UPDATE \"dycicle\".estudiante SET "
                    + "PrimerNombre = '" + p.getNombre1() + "', "
                    + "SegundoNombre = '" + p.getNombre2() + "', "
                    + "PrimerApellido = '" + p.getApellido1() + "',"
                    + "SegundoApellido = '" + p.getApellido2() + "',"
                    + "CarreraEst = '" + p.getCarrera() + "', "
                    + "Sexo = '" + p.getSexo() + "', "
                    + "Urbanizacion = '" + p.getUrbanizacion() + "', "
                    + "Calle = '" + p.getCalle() + "', "
                    + "Edificio = '" + p.getEdificio() + "', "
                    + "Apartamento = '" + p.getApartamento() + "', "
                    + "Ciudad = '" + p.getCiudad() + "', "
                    + "Estado = '" + p.getEstado() + "', "
                    + "CodPostal = '" + p.getCodPostal() + "', "
                    + "TelefonoCel = '" + p.getTelefonoCelular() + "', "
                    + "TelefonoCasa = '" + p.getTelefonoCasa() + "', "
                    + "Fax = '" + p.getFax() + "', "
                    + "Email = '" + p.getEmail() + "', "
                    + "FechaNac = '" + p.getFechaNacimiento() + "', "
                    + "Nacionalidad = '" + p.getNacionalidad() + "' WHERE "
                    + "NombreUsuario = '" + p.getNombreUsuario() + "';";

            String sqlqueryEstudianteUSB = "UPDATE \"dycicle\".estudianteUSB SET "
                    + "Cedula = '" + p.getCedula() + "',"
                    + "Carnet = '" + p.getCarnet() + "' WHERE "
                    + "NombreUsuario = '" + p.getNombreUsuario() + "';";

            //Verificamos si el estudiante tiene algun representante ya creado
            String sqlqueryRep = "SELECT nombreusuario FROM \"dycicle\".representante WHERE"
                    + " nombreusuario='" + p.getNombreUsuario() + "';";
            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlqueryRep);

            String sqlqueryRepresentante;
            if (rs.next()) {
                sqlqueryRepresentante = "UPDATE \"dycicle\".Representante SET "
                        + "NombreUsuario = '" + p.getNombreUsuario() + "', "
                        + "Nombres = '" + p.getNombresRep() + "', "
                        + "Apellidos = '" + p.getApellidosRep() + "', "
                        + "TelefonoCel= '" + p.getCelRep() + "', "
                        + "TelefonoHab= '" + p.getTlfRepCasa() + "', "
                        + "EmailRep= '" + p.getEmailRep() + "', "
                        + "TipoRelacion= '" + p.getRelacion() + "', "
                        + "Direccion = '" + p.getDireccionRep() + "' WHERE "
                        + "NombreUsuario = '" + p.getNombreUsuario() + "';";
            } else {

                // Datos del representante
                sqlqueryRepresentante = "INSERT INTO \"dycicle\".Representante VALUES ("
                        + "'" + p.getNombreUsuario() + "', "
                        + "'" + p.getNombresRep() + "', "
                        + "'" + p.getApellidosRep() + "', "
                        + "'" + p.getCelRep() + "', "
                        + "'" + p.getTlfRepCasa() + "', "
                        + "'" + p.getEmailRep() + "', "
                        + "'" + p.getRelacion() + "', "
                        + "'" + p.getDireccionRep() + "');";
            }

            //Antecedentes Academicos
            String sqlqueryAntecedente = "UPDATE \"dycicle\".AntecedenteAcademico SET "
                    + "Indice = '" + p.getIndice() + "', "
                    + "Decanato = '" + p.getDecanato() + "', "
                    + "AreaDeEstudio = '" + p.getAreaEstud() + "', "
                    + "Carrera = '" + p.getCarrera() + "', "
                    + "Opcion = '" + p.getOpcion() + "', "
                    + "CredAprob= '" + p.getCreditosApro() + "' WHERE "
                    + "NombreUsuario = '" + p.getNombreUsuario() + "';";


            //Verificamos si el estudiante ya habia seleccionado una
            // universidad como primera opcion
            String sqlqueryUni1 = "SELECT nombreusuario FROM \"dycicle\".universidades WHERE"
                    + " nombreusuario='" + p.getNombreUsuario() + "'"
                    + " AND Prioridad='1';";
            stmt = conexion.createStatement();
            rs = stmt.executeQuery(sqlqueryUni1);

            if (rs.next()) {

                sqlqueryUni1 = "UPDATE \"dycicle\".Universidades SET "
                        + "NombreUsuario = '" + p.getNombreUsuario() + "', "
                        + "Prioridad = '1', " //Prioridad 
                        + "NombreUni = '" + p.getNombreOpcion1() + "', "
                        + "Pais = '" + p.getPaisOpcion1() + "', "
                        + "TipoPrograma = '" + p.getProgramaOpcion1() + "', "
                        + "NombrePrograma = '" + p.getNombreProgramaOpcion1() + "', "
                        + "MesFechaIni = '" + p.getMesFechaIni1() + "', "
                        + "AnioFechaIni ='" + p.getAnoFechaIni1() + "', "
                        + "MesFechaFin = '" + p.getMesFechaFin1() + "', "
                        + "AnioFechaFin = '" + p.getAnoFechaFin1() + "', "
                        + "Duracion = '" + p.getDuracionProgramaOpcion1() + "' WHERE "
                        + "NombreUsuario = '" + p.getNombreUsuario() + "';";
            } else {

                sqlqueryUni1 = "INSERT INTO \"dycicle\".Universidades VALUES ("
                        + "'" + p.getNombreUsuario() + "', "
                        + "'1', " //Prioridad 
                        + "'" + p.getNombreOpcion1() + "', "
                        + "'" + p.getPaisOpcion1() + "', "
                        + "'" + p.getProgramaOpcion1() + "', "
                        + "'" + p.getNombreProgramaOpcion1() + "', "
                        + "'" + p.getMesFechaIni1() + "', "
                        + "'" + p.getAnoFechaIni1() + "', "
                        + "'" + p.getMesFechaFin1() + "', "
                        + "'" + p.getAnoFechaFin1() + "', "
                        + "'" + p.getDuracionProgramaOpcion1() + "');";

            }

            //Verificamos si el estudiante ya habia seleccionado una
            // universidad como primera opcion
            String sqlqueryUni2 = "SELECT nombreusuario FROM \"dycicle\".universidades WHERE"
                    + " nombreusuario='" + p.getNombreUsuario() + "'"
                    + " AND Prioridad='2';";
            stmt = conexion.createStatement();
            rs = stmt.executeQuery(sqlqueryUni2);

            if (rs.next()) {

                sqlqueryUni2 = "UPDATE \"dycicle\".Universidades SET "
                        + "NombreUsuario = '" + p.getNombreUsuario() + "', "
                        + "Prioridad = '2', " //Prioridad 
                        + "NombreUni = '" + p.getNombreOpcion2() + "', "
                        + "Pais = '" + p.getPaisOpcion2() + "', "
                        + "TipoPrograma = '" + p.getProgramaOpcion2() + "', "
                        + "NombrePrograma = '" + p.getNombreProgramaOpcion2() + "', "
                        + "MesFechaIni = '" + p.getMesFechaIni2() + "', "
                        + "AnioFechaIni ='" + p.getAnoFechaIni2() + "', "
                        + "MesFechaFin = '" + p.getMesFechaFin2() + "', "
                        + "AnioFechaFin = '" + p.getAnoFechaFin2() + "', "
                        + "Duracion = '" + p.getDuracionProgramaOpcion2() + "' WHERE "
                        + "NombreUsuario = '" + p.getNombreUsuario() + "';";
            } else {

                sqlqueryUni2 = "INSERT INTO \"dycicle\".Universidades VALUES ("
                        + "'" + p.getNombreUsuario() + "', "
                        + "'2', " //Prioridad 
                        + "'" + p.getNombreOpcion2() + "', "
                        + "'" + p.getPaisOpcion2() + "', "
                        + "'" + p.getProgramaOpcion2() + "', "
                        + "'" + p.getNombreProgramaOpcion2() + "', "
                        + "'" + p.getMesFechaIni2() + "', "
                        + "'" + p.getAnoFechaIni2() + "', "
                        + "'" + p.getMesFechaFin2() + "', "
                        + "'" + p.getAnoFechaFin2() + "', "
                        + "'" + p.getDuracionProgramaOpcion2() + "');";

            }

            //Verificamos si el estudiante ya habia introducido informacion
            // sobre el financiamiento
            String sqlqueryFinanciamiento = "SELECT nombreusuario FROM \"dycicle\".Financiamiento WHERE"
                    + " nombreusuario='" + p.getNombreUsuario() + "';";
            stmt = conexion.createStatement();
            rs = stmt.executeQuery(sqlqueryFinanciamiento);

            if (rs.next()) {
                sqlqueryFinanciamiento = "UPDATE \"dycicle\".Financiamiento SET "
                        + "NombreUsuario = '" + p.getNombreUsuario() + "', "
                        + "PpalFuente = '" + p.getFuenteFinanciamiento() + "', "
                        + "DescrFuente = '" + p.getDescripcion1() + "', "
                        + "TieneBecaDe = '" + p.getAyudaEc() + "', "
                        + "DescrBeca'" + p.getDescripcion2() + "' WHERE "
                        + "NombreUsuario = '" + p.getNombreUsuario() + "';";
            } else {
                sqlqueryFinanciamiento = "INSERT INTO \"dycicle\".Financiamiento VALUES ("
                        + "'" + p.getNombreUsuario() + "', "
                        + "'" + p.getFuenteFinanciamiento() + "', "
                        + "'" + p.getDescripcion1() + "', "
                        + "'" + p.getAyudaEc() + "', "
                        + "'" + p.getDescripcion2() + "');";
            }


            stmt = conexion.createStatement();


            Integer i = stmt.executeUpdate(sqlqueryEstudiante);
            Integer j = stmt.executeUpdate(sqlqueryEstudianteUSB);
            Integer k = stmt.executeUpdate(sqlqueryRepresentante);
            Integer l = stmt.executeUpdate(sqlqueryAntecedente);
            Integer m = stmt.executeUpdate(sqlqueryUni1);
            Integer n = stmt.executeUpdate(sqlqueryUni2);
            Integer o = stmt.executeUpdate(sqlqueryFinanciamiento);

            return ((i > 0) && (j > 0) && (k > 0) && (l > 0) && (m > 0) && (n > 0) && (o > 0));

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public boolean agregarPlanillaExt(PlanillaExt p) {
        try {

            String sqlqueryEstudiante = "UPDATE \"dycicle\".estudiante SET "
                    + "PrimerNombre = '" + p.getNombre1() + "', "
                    + "SegundoNombre = '" + p.getNombre2() + "', "
                    + "PrimerApellido = '" + p.getApellido1() + "',"
                    + "SegundoApellido = '" + p.getApellido2() + "',"
                    + "Sexo = '" + p.getSexo() + "', "
                    + "Calle = '" + p.getCalle() + "', "
                    + "Edificio = '" + p.getEdificio() + "', "
                    + "Apartamento = '" + p.getApartamento() + "', "
                    + "Ciudad = '" + p.getCiudad() + "', "
                    + "Estado = '" + p.getEstado() + "', "
                    + "CodPostal = '" + p.getCodPostal() + "', "
                    + "TelefonoCel = '" + p.getTelefonoCelular() + "', "
                    + "TelefonoCasa = '" + p.getTelefonoCasa() + "', "
                    + "FechaNac = '" + p.getFechaNacimiento() + "', "
                    + "Nacionalidad = '" + p.getNacionalidad() + "' WHERE "
                    + "NombreUsuario = '" + p.getNombreUsuario() + "';";

            String sqlqueryEstudianteExt = "UPDATE \"dycicle\".estudianteInternacional SET "
                    + "Pasaporte = '" + p.getPasaporte() + "',"
                    //+ "LenguaMaterna = '" + p.getLenguaMaterna() + "',"
                    + "PaisOrigen = '" + p.getPaisOrigen() + "',"
                    + "UniOrigen = '" + p.getNombreUniOrigen() + "' WHERE "
                    + "NombreUsuario = '" + p.getNombreUsuario() + "';";

            // Datos del representante
            //Verificamos si el estudiante tiene algun representante ya creado

            String sqlqueryRep = "SELECT nombreusuario FROM \"dycicle\".representante WHERE"
                    + " nombreusuario='" + p.getNombreUsuario() + "';";
            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlqueryRep);

            String sqlqueryRepresentante;
            if (rs.next()) {
                sqlqueryRepresentante = "UPDATE \"dycicle\".Representante SET "
                        + "NombreUsuario = '" + p.getNombreUsuario() + "', "
                        + "Nombres = '" + p.getNombresRep() + "', "
                        + "Apellidos = '" + p.getApellidosRep() + "', "
                        + "TelefonoCel= '" + p.getCelRep() + "', "
                        + "TelefonoHab= '" + p.getTlfRepCasa() + "', "
                        + "EmailRep= '" + p.getEmailRep() + "', "
                        + "TipoRelacion= '" + p.getRelacion() + "', "
                        + "Direccion = '" + p.getDireccionRep() + "' WHERE "
                        + "NombreUsuario = '" + p.getNombreUsuario() + "';";
            } else {
                sqlqueryRepresentante = "INSERT INTO \"dycicle\".Representante VALUES ("
                        + "'" + p.getNombreUsuario() + "', "
                        + "'" + p.getNombresRep() + "', "
                        + "'" + p.getApellidosRep() + "', "
                        + "'" + p.getCelRep() + "', "
                        + "'" + p.getTlfRepCasa() + "', "
                        + "'" + p.getEmailRep() + "', "
                        + "'" + p.getRelacion() + "', "
                        + "'" + p.getDireccionRep() + "');";
            }


            //Antecedentes Academicos
            String sqlqueryAntecedente = "UPDATE \"dycicle\".AntecedenteAcademico SET "
                    + "AreaDeEstudio = '" + p.getAreaEstud() + "', "
                    + "Carrera = '" + p.getCarrera() + "', "
                    + "AnioIngreso = '" + p.getAnioIngreso() + "', "
                    + "AniosAprob= '" + p.getAniosAprobados() + "', "
                    + "CoordMovilidad='" + p.getNombreCoordMovilidad() + "', "
                    + "CoordAcademico='" + p.getNombreCoordAcademico() + "' WHERE "
                    + "NombreUsuario = '" + p.getNombreUsuario() + "';";

            // Opciones de uni de intercambios
            String sqlqueryUni1 = "INSERT INTO \"dycicle\".Universidades VALUES ("
                    + "'" + p.getNombreUsuario() + "', "
                    + "'1', " //Prioridad
                    + "'Universidad Simon Bolivar', "
                    + "'Venezuela', "
                    + "'" + p.getPrograma() + "', "
                    + "'" + p.getNombrePrograma() + "', "
                    + "'null', 'null', 'null', 'null', "
                    + "'" + p.getDuracionPrograma() + "');";


            Integer i = stmt.executeUpdate(sqlqueryEstudiante);
            Integer j = stmt.executeUpdate(sqlqueryEstudianteExt);
            Integer k = stmt.executeUpdate(sqlqueryRepresentante);
            Integer l = stmt.executeUpdate(sqlqueryAntecedente);
            Integer m = stmt.executeUpdate(sqlqueryUni1);

            return ((i > 0) && (j > 0) && (k > 0) && (l > 0) && (m > 0));

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    //Metodo para obtener los idiomas 
    public Idiomas obtenerIdiomas(Usuario u) {

        Idiomas idims = new Idiomas();

        try {
            String sqlquery = "SELECT * FROM \"dycicle\".idiomas "
                    + " WHERE nombreusuario ='" + u.getNombreusuario() + "';";

            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {

                idims.setIdiomaDest(0, rs.getString("NombreIdioma"));
                idims.setNivelVerbal(0, rs.getString("NivelVerbal"));
                idims.setNivelEscrito(0, rs.getString("NivelEscrito"));
                idims.setNivelConversacional(0, rs.getString("NivelConversacional"));
                idims.setNivelAuditivo(0, rs.getString("NivelAuditivo"));


            }


        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return idims;

    }

    public boolean modificarIdioma(Idiomas idi) {

        ArrayList archivos = idi.getListEscrito();
        ArrayList archivo = idi.getListVerbal();
        ArrayList archiv = idi.getListIdioma();
        ArrayList archi = idi.getListConversacional();
        PreparedStatement ps = null;
        int i, j;
        j = 0;
        try {
            ps = conexion.prepareStatement("UPDATE \"dycicle\".idiomas SET "
                    + "NivelVerbal = ?, NivelEscrito=?,NivelConversacional=? WHERE "
                    + " NombreUsuario =? AND NombreIdioma=? ;");
            for (i = 0; i < archivos.size(); i++) {
                ps.setString(1, (String) archivo.get(i));
                ps.setString(2, (String) archivos.get(i));
                ps.setString(3, (String) archi.get(i));
                ps.setString(4, idi.getNombreusuario());
                ps.setString(5, (String) archiv.get(i));

                j = ps.executeUpdate();

            }

            return j > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }


    }

    //Metodo para obtener idiomas de estudiantes internacionales
    public Idiomas obtenerIdiomas2(Usuario u) {

        Idiomas idims = new Idiomas();

        try {

            String sqlquery = "SELECT * FROM \"dycicle\".estudianteInternacional"
                    + " WHERE nombreusuario ='" + u.getNombreusuario() + "';";
            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);

            if (rs.next()) {
                idims.setLenguaMaterna(rs.getString("LenguaMaterna"));
                idims.setTomarCursoDeEspaniol(rs.getString("CursoEspaniol"));
            }

            sqlquery = "SELECT * FROM \"dycicle\".idiomas "
                    + " WHERE nombreusuario ='" + u.getNombreusuario() + "';";

            stmt = conexion.createStatement();
            rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {

                idims.setIdiomaDest(0, rs.getString("NombreIdioma"));
                idims.setNivelVerbal(0, rs.getString("NivelVerbal"));
                idims.setNivelEscrito(0, rs.getString("NivelEscrito"));
                idims.setNivelConversacional(0, rs.getString("NivelConversacional"));
                idims.setNivelAuditivo(0, rs.getString("NivelAuditivo"));


            }


        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return idims;

    }

    //Metodo para obtener plan de estudios
    public PlanDeEstudio obtenerMaterias(Usuario u) {

        PlanDeEstudio plan = new PlanDeEstudio();

        try {
            String sqlquery = "SELECT * FROM \"dycicle\".planestudio "
                    + " WHERE nombreusuario ='" + u.getNombreusuario() + "';";

            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {

                plan.setMateriaUSB(0, rs.getString("MateriaUsb"));
                plan.setCodigoUSB(0, rs.getString("CodigoUsb"));
                plan.setCreditosUSB(0, rs.getInt("CreditoUsb"));
                plan.setMateriaUniv(0, rs.getString("MateriaUniv"));
                plan.setCodigoUniv(0, rs.getString("CodigoUniv"));
                plan.setCreditosUniv(0, rs.getInt("CreditoUniv"));

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return plan;

    }

    //Metodo para obtener plan de estudio extranjero    
    public PlanExtranjero obtenerMateriasExt(Usuario u) {

        PlanExtranjero plan = new PlanExtranjero();

        try {
            String sqlquery = "SELECT * FROM \"dycicle\".planestudio "
                    + " WHERE nombreusuario ='" + u.getNombreusuario() + "';";

            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {

                plan.setMateriaUSB(0, rs.getString("MateriaUsb"));
                plan.setCodigoUSB(0, rs.getString("CodigoUsb"));
                plan.setCreditosUSB(0, rs.getInt("CreditoUsb"));

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return plan;

    }

        public ArrayList<PlanMaterias> obtenerPlanMaterias(Usuario u) {

        ArrayList<PlanMaterias> plan;
        plan = new ArrayList<PlanMaterias>();

        try {
            String sqlquery = "SELECT * FROM \"dycicle\".planestudio "
                    + " WHERE nombreusuario ='" + u.getNombreusuario() + "';";

            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {
                PlanMaterias materia = new PlanMaterias();
                materia.setmateriausb(rs.getString("materiausb"));
                materia.setcreditousb(rs.getString("creditousb"));
                materia.setcodigousb(rs.getString("codigousb"));
                materia.setmateriauniv(rs.getString("materiauniv"));
                materia.setcreditouniv(rs.getString("creditouniv"));
                materia.setcodigouniv(rs.getString("codigouniv"));
                plan.add(materia);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return plan;

    }
    
    public PlanDeEstudio obtenerPlanDeEstudio(Usuario u) {
        PlanDeEstudio datos = new PlanDeEstudio();

        try {
            String sqlquery = "SELECT * FROM \"dycicle\".planestudio WHERE "
                    + " nombreusuario ='" + u.getNombreusuario() + "';";
            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);
            while (rs.next()) {
                datos.setCodigoUSB(0, rs.getString("codigousb"));
                datos.setCreditosUSB(0, rs.getInt("creditousb"));
                datos.setMateriaUSB(0, rs.getString("materiausb"));
                datos.setCodigoUniv(0, rs.getString("codigouniv"));
                datos.setCreditosUniv(0, rs.getInt("creditouniv"));
                datos.setMateriaUniv(0, rs.getString("materiauniv"));
            }
            datos.setNombreUsuario(u.getNombreusuario());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return datos;

    }

    public PlanillaUSB obtenerPlanillaUSB(Usuario u) {

        PlanillaUSB datos = new PlanillaUSB();

        try {

            String sqlquery = "SELECT * FROM \"dycicle\".estudiante NATURAL JOIN "
                    + "\"dycicle\".estudianteusb NATURAL JOIN "
                    + " \"dycicle\".AntecedenteAcademico NATURAL JOIN "
                    + "\"dycicle\".Financiamiento "
                    + " WHERE nombreusuario ='" + u.getNombreusuario() + "';";

            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);

            sqlquery = "SELECT * FROM \"dycicle\".representante "
                    + " WHERE nombreusuario ='" + u.getNombreusuario() + "';";

            stmt = conexion.createStatement();
            ResultSet rs2 = stmt.executeQuery(sqlquery);
            rs2.next(); //Informacion del representante

            sqlquery = "SELECT * FROM \"dycicle\".universidades "
                    + "WHERE nombreusuario = '" + u.getNombreusuario() + "' "
                    + "ORDER BY prioridad;";

            stmt = conexion.createStatement();
            ResultSet rs3 = stmt.executeQuery(sqlquery);
            rs3.next(); //Informacion de la primera opcion de universidad
            
            sqlquery = "SELECT * FROM \"dycicle\".estudiante "
                    + "WHERE nombreusuario = '" + u.getNombreusuario() + "' ";

            stmt = conexion.createStatement();
            ResultSet rs4 = stmt.executeQuery(sqlquery);
            rs4.next(); //Comentario sobre el estudiante

            boolean primeraUni = rs.next();
            datos.setNombreUsuario(rs.getString("NombreUsuario"));
            datos.setApellido1(rs.getString("PrimerApellido"));
            datos.setApellido2(rs.getString("SegundoApellido"));
            datos.setNombre1(rs.getString("PrimerNombre"));
            datos.setNombre2(rs.getString("SegundoNombre"));
            datos.setCedula(rs.getString("Cedula"));
            datos.setCarnet(rs.getString("Carnet"));
            datos.setSexo(rs.getString("Sexo"));
            datos.setUrbanizacion(rs.getString("Urbanizacion"));
            datos.setCalle(rs.getString("Calle"));
            datos.setEdificio(rs.getString("Edificio"));
            datos.setApartamento(rs.getString("Apartamento"));
            datos.setCiudad(rs.getString("Ciudad"));
            datos.setEstado(rs.getString("Estado"));
            datos.setCodPostal(rs.getString("CodPostal"));
            datos.setTelefonoCasa(rs.getString("TelefonoCasa"));
            datos.setTelefonoCelular(rs.getString("TelefonoCel"));
            datos.setFax(rs.getString("Fax"));
            datos.setEmail(rs.getString("Email"));
            datos.setFechaNacimiento(rs.getString("FechaNac"));
            datos.setNacionalidad(rs.getString("Nacionalidad"));
            datos.setApellidosRep(rs2.getString("Apellidos"));
            datos.setNombresRep(rs2.getString("Nombres"));
            datos.setCelRep(rs2.getString("TelefonoCel"));
            datos.setTlfRepCasa(rs2.getString("TelefonoHab"));
            datos.setEmailRep(rs2.getString("EmailRep"));
            datos.setRelacion(rs2.getString("TipoRelacion"));
            datos.setDireccionRep(rs2.getString("Direccion"));
            datos.setIndice(rs.getString("Indice"));
            datos.setDecanato(rs.getString("Decanato"));
            datos.setAreaEstud(rs.getString("AreaDeEstudio"));
            datos.setCarrera(rs.getString("Carrera"));
            datos.setOpcion(rs.getString("Opcion"));
            datos.setCreditosApro(rs.getInt("CredAprob"));
            datos.setFuenteFinanciamiento(rs.getString("PpalFuente"));
            datos.setAyudaEc(rs.getString("TieneBecaDe"));
            datos.setDescripcion1(rs.getString("DescrFuente"));
            datos.setDescripcion2(rs.getString("DescrBeca"));
            datos.setProgramaOpcion1(rs3.getString("TipoPrograma"));
            datos.setNombreProgramaOpcion1(rs3.getString("NombrePrograma"));
            datos.setDuracionProgramaOpcion1(rs3.getString("Duracion"));
            datos.setPaisOpcion1(rs3.getString("Pais"));
            datos.setNombreOpcion1(rs3.getString("NombreUni"));
            datos.setMesFechaIni1(rs3.getString("MesFechaIni"));
            datos.setAnoFechaIni1(rs3.getString("AnioFechaIni"));
            datos.setMesFechaFin1(rs3.getString("MesFechaFin"));
            datos.setAnoFechaFin1(rs3.getString("AnioFechaFin"));

            boolean segundaUni = rs3.next();
            datos.setProgramaOpcion2(rs3.getString("TipoPrograma"));
            datos.setNombreProgramaOpcion2(rs3.getString("NombrePrograma"));
            datos.setDuracionProgramaOpcion2(rs3.getString("Duracion"));
            datos.setPaisOpcion2(rs3.getString("Pais"));
            datos.setNombreOpcion2(rs3.getString("NombreUni"));
            datos.setMesFechaIni2(rs3.getString("MesFechaIni"));
            datos.setAnoFechaIni2(rs3.getString("AnioFechaIni"));
            datos.setMesFechaFin2(rs3.getString("MesFechaFin"));
            datos.setAnoFechaFin2(rs3.getString("AnioFechaFin"));
            
            datos.setComentarioRecomendacion(rs4.getString("Comentario"));
            


        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return datos;
    }

    public PlanillaExt obtenerPlanillaExt(Usuario u) {

        PlanillaExt datos = new PlanillaExt();

        try {

            String sqlquery = "SELECT * FROM \"dycicle\".estudiante NATURAL JOIN "
                    + "\"dycicle\".estudianteinternacional NATURAL JOIN "
                    + "\"dycicle\".Universidades "
                    + " WHERE nombreusuario ='" + u.getNombreusuario() + "';";

            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);

            sqlquery = "SELECT * FROM \"dycicle\".representante "
                    + " WHERE nombreusuario ='" + u.getNombreusuario() + "';";

            stmt = conexion.createStatement();
            ResultSet rs2 = stmt.executeQuery(sqlquery);
            rs2.next();

            sqlquery = "SELECT * FROM \"dycicle\".antecedenteacademico "
                    + " WHERE nombreusuario ='" + u.getNombreusuario() + "';";

            stmt = conexion.createStatement();
            ResultSet rs3 = stmt.executeQuery(sqlquery);
            rs3.next();

            boolean primeraUni = rs.next();

            datos.setNombreUsuario(rs.getString("NombreUsuario"));
            datos.setApellido1(rs.getString("PrimerApellido"));
            datos.setApellido2(rs.getString("SegundoApellido"));
            datos.setNombre1(rs.getString("PrimerNombre"));
            datos.setNombre2(rs.getString("SegundoNombre"));
            datos.setSexo(rs.getString("Sexo"));
            datos.setPasaporte(rs.getString("Pasaporte"));
            datos.setCalle(rs.getString("Calle"));
            datos.setEdificio(rs.getString("Edificio"));
            datos.setApartamento(rs.getString("Apartamento"));
            datos.setCiudad(rs.getString("Ciudad"));
            datos.setEstado(rs.getString("Estado"));
            datos.setCodPostal(rs.getString("CodPostal"));
            datos.setTelefonoCasa(rs.getString("TelefonoCasa"));
            datos.setTelefonoCelular(rs.getString("TelefonoCel"));
            datos.setEmail(rs.getString("Email"));
            datos.setFechaNacimiento(rs.getString("FechaNac"));
            datos.setNacionalidad(rs.getString("Nacionalidad"));
            datos.setApellidosRep(rs2.getString("Apellidos"));
            datos.setNombresRep(rs2.getString("Nombres"));
            datos.setCelRep(rs2.getString("TelefonoCel"));
            datos.setTlfRepCasa(rs2.getString("TelefonoHab"));
            datos.setEmailRep(rs2.getString("EmailRep"));
            datos.setRelacion(rs2.getString("TipoRelacion"));
            datos.setDireccionRep(rs2.getString("Direccion"));
            datos.setAreaEstud(rs3.getString("AreaDeEstudio"));
            datos.setCarrera(rs3.getString("Carrera"));
            datos.setAnioIngreso(rs3.getInt("AnioIngreso"));
            datos.setAniosAprobados(rs3.getInt("AniosAprob"));
            datos.setPrograma(rs.getString("TipoPrograma"));
            datos.setNombrePrograma(rs.getString("NombrePrograma"));
            datos.setDuracionPrograma(rs.getString("Duracion"));
            datos.setPaisOrigen(rs.getString("PaisOrigen"));
            datos.setNombreCoordAcademico(rs3.getString("CoordAcademico"));
            datos.setNombreCoordMovilidad(rs3.getString("CoordMovilidad"));
            datos.setNombreUniOrigen(rs.getString("UniOrigen"));

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return datos;
    }

    public boolean modificarPlanillaUSB(PlanillaUSB p) {

        try {
            String sqlqueryEstudiante = "UPDATE \"dycicle\".estudiante SET "
                    + "PrimerNombre = '" + p.getNombre1() + "', "
                    + "SegundoNombre = '" + p.getNombre2() + "', "
                    + "PrimerApellido = '" + p.getApellido1() + "',"
                    + "SegundoApellido = '" + p.getApellido2() + "',"
                    + "CarreraEst = '" + p.getCarrera() + "', "
                    + "Sexo = '" + p.getSexo() + "', "
                    + "Urbanizacion = '" + p.getUrbanizacion() + "', "
                    + "Calle = '" + p.getCalle() + "', "
                    + "Edificio = '" + p.getEdificio() + "', "
                    + "Apartamento = '" + p.getApartamento() + "', "
                    + "Ciudad = '" + p.getCiudad() + "', "
                    + "Estado = '" + p.getEstado() + "', "
                    + "CodPostal = '" + p.getCodPostal() + "', "
                    + "TelefonoCel = '" + p.getTelefonoCelular() + "', "
                    + "TelefonoCasa = '" + p.getTelefonoCasa() + "', "
                    + "Fax = '" + p.getFax() + "', "
                    + "Email = '" + p.getEmail() + "', "
                    + "FechaNac = '" + p.getFechaNacimiento() + "', "
                    + "Nacionalidad = '" + p.getNacionalidad() + "' WHERE "
                    + "nombreusuario = '" + p.getNombreUsuario() + "';";

            String sqlqueryEstudianteUSB = "UPDATE \"dycicle\".estudianteUSB SET "
                    + "Cedula = '" + p.getCedula() + "',"
                    + "Carnet = '" + p.getCarnet() + "' WHERE "
                    + "NombreUsuario = '" + p.getNombreUsuario() + "';";

            //Verificamos si el estudiante tiene algun representante ya creado
            String sqlqueryRep = "SELECT nombreusuario FROM \"dycicle\".representante WHERE"
                    + " nombreusuario='" + p.getNombreUsuario() + "';";
            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlqueryRep);

            String sqlqueryRepresentante;
            if (rs.next()) {
                sqlqueryRepresentante = "UPDATE \"dycicle\".Representante SET "
                        + "Nombres = '" + p.getNombresRep() + "', "
                        + "Apellidos = '" + p.getApellidosRep() + "', "
                        + "TelefonoCel= '" + p.getCelRep() + "', "
                        + "TelefonoHab= '" + p.getTlfRepCasa() + "', "
                        + "EmailRep= '" + p.getEmailRep() + "', "
                        + "TipoRelacion= '" + p.getRelacion() + "', "
                        + "Direccion = '" + p.getDireccionRep() + "' WHERE "
                        + "NombreUsuario = '" + p.getNombreUsuario() + "';";
            } else {

                // Datos del representante
                sqlqueryRepresentante = "INSERT INTO \"dycicle\".Representante VALUES ("
                        + "'" + p.getNombreUsuario() + "', "
                        + "'" + p.getNombresRep() + "', "
                        + "'" + p.getApellidosRep() + "', "
                        + "'" + p.getCelRep() + "', "
                        + "'" + p.getTlfRepCasa() + "', "
                        + "'" + p.getEmailRep() + "', "
                        + "'" + p.getRelacion() + "', "
                        + "'" + p.getDireccionRep() + "');";
            }

            //Antecedentes Academicos
            String sqlqueryAntecedente = "UPDATE \"dycicle\".AntecedenteAcademico SET "
                    + "Indice = '" + p.getIndice() + "', "
                    + "Decanato = '" + p.getDecanato() + "', "
                    + "AreaDeEstudio = '" + p.getAreaEstud() + "', "
                    + "Carrera = '" + p.getCarrera() + "', "
                    + "Opcion = '" + p.getOpcion() + "', "
                    + "CredAprob= '" + p.getCreditosApro() + "' WHERE "
                    + "NombreUsuario = '" + p.getNombreUsuario() + "';";

            // Opciones de uni de intercambios
            String sqlqueryUni1 = "UPDATE \"dycicle\".Universidades SET "
                    + "NombreUni= '" + p.getNombreOpcion1() + "',"
                    + "Pais= '" + p.getPaisOpcion1() + "', "
                    + "TipoPrograma= '" + p.getProgramaOpcion1() + "', "
                    + "NombrePrograma= '" + p.getNombreProgramaOpcion1() + "', "
                    + "MesFechaIni= '" + p.getMesFechaIni1() + "', "
                    + "AnioFechaIni= '" + p.getAnoFechaIni1() + "', "
                    + "MesFechaFin= '" + p.getMesFechaFin1() + "', "
                    + "AnioFechaFin= '" + p.getAnoFechaFin1() + "', "
                    + "Duracion= '" + p.getDuracionProgramaOpcion1() + "' WHERE "
                    + "NombreUsuario= '" + p.getNombreUsuario() + "' AND "
                    + "Prioridad= '1' ;";

            String sqlqueryUni2 = "UPDATE \"dycicle\".Universidades SET "
                    + "NombreUni= '" + p.getNombreOpcion2() + "',"
                    + "Pais= '" + p.getPaisOpcion2() + "', "
                    + "TipoPrograma= '" + p.getProgramaOpcion2() + "', "
                    + "NombrePrograma= '" + p.getNombreProgramaOpcion2() + "', "
                    + "MesFechaIni= '" + p.getMesFechaIni2() + "', "
                    + "AnioFechaIni= '" + p.getAnoFechaIni2() + "', "
                    + "MesFechaFin= '" + p.getMesFechaFin2() + "', "
                    + "AnioFechaFin= '" + p.getAnoFechaFin2() + "', "
                    + "Duracion= '" + p.getDuracionProgramaOpcion2() + "' WHERE "
                    + "NombreUsuario= '" + p.getNombreUsuario() + "' AND "
                    + "Prioridad= '2' ;";


            String sqlqueryFinanciamiento = "UPDATE \"dycicle\".Financiamiento SET "
                    + "PpalFuente= '" + p.getFuenteFinanciamiento() + "',"
                    + "DescrFuente= '" + p.getDescripcion1() + "', "
                    + "TieneBecaDe= '" + p.getAyudaEc() + "', "
                    + "DescrBeca= '" + p.getDescripcion2() + "' WHERE "
                    + "NombreUsuario= '" + p.getNombreUsuario() + "';";

            stmt = conexion.createStatement();


            Integer i = stmt.executeUpdate(sqlqueryEstudiante);
            Integer j = stmt.executeUpdate(sqlqueryEstudianteUSB);
            Integer k = stmt.executeUpdate(sqlqueryRepresentante);
            Integer l = stmt.executeUpdate(sqlqueryAntecedente);
            Integer m = stmt.executeUpdate(sqlqueryUni1);
            Integer n = stmt.executeUpdate(sqlqueryUni2);
            Integer o = stmt.executeUpdate(sqlqueryFinanciamiento);

            return ((i > 0) && (j > 0) && (k > 0) && (l > 0) && (m > 0) && (n > 0) && (o > 0));

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public boolean modificarPlanillaExt(PlanillaExt p) {

        try {
            String sqlqueryEstudiante = "UPDATE \"dycicle\".estudiante SET "
                    + "PrimerNombre = '" + p.getNombre1() + "', "
                    + "SegundoNombre = '" + p.getNombre2() + "', "
                    + "PrimerApellido = '" + p.getApellido1() + "',"
                    + "SegundoApellido = '" + p.getApellido2() + "',"
                    + "CarreraEst = '" + p.getCarrera() + "', "
                    + "Sexo = '" + p.getSexo() + "', "
                    + "Calle = '" + p.getCalle() + "', "
                    + "Edificio = '" + p.getEdificio() + "', "
                    + "Apartamento = '" + p.getApartamento() + "', "
                    + "Ciudad = '" + p.getCiudad() + "', "
                    + "Estado = '" + p.getEstado() + "', "
                    + "CodPostal = '" + p.getCodPostal() + "', "
                    + "TelefonoCel = '" + p.getTelefonoCelular() + "', "
                    + "TelefonoCasa = '" + p.getTelefonoCasa() + "', "
                    + "Email = '" + p.getEmail() + "', "
                    + "FechaNac = '" + p.getFechaNacimiento() + "', "
                    + "Nacionalidad = '" + p.getNacionalidad() + "' WHERE "
                    + "nombreusuario = '" + p.getNombreUsuario() + "';";

            String sqlqueryEstudianteUSB = "UPDATE \"dycicle\".estudianteInternacional SET "
                    + "Pasaporte = '" + p.getPasaporte() + "',"
                    + "PaisOrigen = '" + p.getPasaporte() + "',"
                    + "UniOrigen = '" + p.getNombreUniOrigen() + "' WHERE "
                    + "NombreUsuario = '" + p.getNombreUsuario() + "';";

            //Verificamos si el estudiante tiene algun representante ya creado
            String sqlqueryRep = "SELECT nombreusuario FROM \"dycicle\".representante WHERE"
                    + " nombreusuario='" + p.getNombreUsuario() + "';";
            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlqueryRep);

            String sqlqueryRepresentante;
            if (rs.next()) {
                sqlqueryRepresentante = "UPDATE \"dycicle\".Representante SET "
                        + "Nombres = '" + p.getNombresRep() + "', "
                        + "Apellidos = '" + p.getApellidosRep() + "', "
                        + "TelefonoCel= '" + p.getCelRep() + "', "
                        + "TelefonoHab= '" + p.getTlfRepCasa() + "', "
                        + "EmailRep= '" + p.getEmailRep() + "', "
                        + "TipoRelacion= '" + p.getRelacion() + "', "
                        + "Direccion = '" + p.getDireccionRep() + "' WHERE "
                        + "NombreUsuario = '" + p.getNombreUsuario() + "';";
            } else {

                // Datos del representante
                sqlqueryRepresentante = "INSERT INTO \"dycicle\".Representante VALUES ("
                        + "'" + p.getNombreUsuario() + "', "
                        + "'" + p.getNombresRep() + "', "
                        + "'" + p.getApellidosRep() + "', "
                        + "'" + p.getCelRep() + "', "
                        + "'" + p.getTlfRepCasa() + "', "
                        + "'" + p.getEmailRep() + "', "
                        + "'" + p.getRelacion() + "', "
                        + "'" + p.getDireccionRep() + "');";
            }

            //Antecedentes Academicos
            String sqlqueryAntecedente = "UPDATE \"dycicle\".AntecedenteAcademico SET "
                    + "AreaDeEstudio = '" + p.getAreaEstud() + "', "
                    + "Carrera = '" + p.getCarrera() + "', "
                    + "AnioIngreso = '" + p.getAnioIngreso() + "', "
                    + "AniosAprob= '" + p.getAniosAprobados() + "', "
                    + "CoordMovilidad='" + p.getNombreCoordMovilidad() + "', "
                    + "CoordAcademico='" + p.getNombreCoordAcademico() + "' WHERE "
                    + "NombreUsuario = '" + p.getNombreUsuario() + "';";

            // Opciones de uni de intercambios
            String sqlqueryUni1 = "INSERT INTO \"dycicle\".Universidades VALUES ("
                    + "'" + p.getNombreUsuario() + "', "
                    + "'1', " //Prioridad
                    + "'Universidad Simon Bolivar', "
                    + "'Venezuela', "
                    + "'" + p.getPrograma() + "', "
                    + "'" + p.getNombrePrograma() + "', "
                    + "'null', 'null', 'null', 'null', "
                    + "'" + p.getDuracionPrograma() + "');";

            stmt = conexion.createStatement();


            Integer i = stmt.executeUpdate(sqlqueryEstudiante);
            Integer j = stmt.executeUpdate(sqlqueryEstudianteUSB);
            Integer k = stmt.executeUpdate(sqlqueryRepresentante);
            Integer l = stmt.executeUpdate(sqlqueryAntecedente);
            Integer m = stmt.executeUpdate(sqlqueryUni1);

            return ((i > 0) && (j > 0) && (k > 0) && (l > 0) && (m > 0));

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public boolean agregarAnuncio(Anuncio a) {
        PreparedStatement ps = null;
        try {
            ps = conexion.prepareStatement("INSERT INTO \"dycicle\".Noticias "
                    + "VALUES(?,?);");
            ps.setString(1, a.getTitulo());
            ps.setString(2, a.getMensaje());
            /*String sqlquery = "INSERT INTO \"dycicle\".Noticias VALUES"
             + "('" + a.getTitulo() + "','"
             + a.getMensaje() + "');";*/

            //Statement stmt = conexion.createStatement();
            Integer i = ps.executeUpdate();// stmt.executeUpdate(sqlquery);

            return i > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return false;
    }

    public ArrayList<Anuncio> consultarAnuncios() {

        ArrayList<Anuncio> anuncios = new ArrayList<Anuncio>();

        try {
            String sqlquery = "SELECT nombre,fecha FROM \"dycicle\".noticias "
                    + "ORDER BY fecha ;";

            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);


            while (rs.next()) {
                Anuncio a = new Anuncio();
                a.setTitulo(rs.getString("nombre"));
                a.setFecha(rs.getString("fecha"));

                anuncios.add(a);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return anuncios;
    }

    public String verAnuncio(Anuncio a) {

        String mensaje = new String();
        try {
            String sqlquery = "SELECT informacion "
                    + "FROM \"dycicle\".Noticias "
                    + "WHERE nombre = '" + a.getTitulo() + "' "
                    + "AND fecha = '" + a.getFecha() + "';";

            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {
                mensaje = rs.getString("informacion");
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return mensaje;

    }

    public int obtenerNumeroPlanilla() {

        try {
            String sqlquery = "SELECT * FROM \"dycicle\".nroPlanillaUSB";
            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {
                int numero = rs.getInt("privilegio");
                numero++;
                sqlquery = "UPDATE \"dycicle\".nroPlanillaUSB SET nro='" + numero + "'";
                stmt = conexion.createStatement();
                Integer i = stmt.executeUpdate(sqlquery);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return 1;
    }

    public String[] existeEmail(String email) {

        String[] info = new String[3];
        PreparedStatement ps = null;

        try {
            ps = conexion.prepareStatement("SELECT nombreusuario, contrasena, email "
                    + "FROM \"dycicle\".usuario WHERE email = ?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                for (int i = 0; i < 1; i++) {

                    info[0] = rs.getString("nombreusuario");
                    info[1] = rs.getString("contrasena");
                    info[2] = rs.getString("email");

                }

            } else {
                return null;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return info;

    }

    public String[] existeUsuario(String usuario) {

        String[] info = new String[3];
        PreparedStatement ps = null;

        try {
            ps = conexion.prepareStatement("SELECT nombreusuario, contrasena, email "
                    + "FROM \"dycicle\".usuario WHERE nombreusuario = ?");
            ps.setString(1, usuario);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                for (int i = 0; i < 1; i++) {

                    info[0] = rs.getString("nombreusuario");
                    info[1] = rs.getString("contrasena");
                    info[2] = rs.getString("email");
                }

            } else {
                return null;
            }


        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return info;

    }

    public String[] getInfoPostulante(String usuario) {

        String info[] = new String[4];
        PreparedStatement ps = null;
        try {
            ps = conexion.prepareStatement("SELECT Tipo, Codigo, NombreUniExt, NombreCarrera "
                    + "FROM \"dycicle\".postulante WHERE nombreusuario = ?");
            ps.setString(1, usuario);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                for (int i = 0; i < 1; i++) {

                    info[0] = rs.getString("tipo");
                    info[1] = rs.getString("codigo");
                    info[2] = rs.getString("nombreuniext");
                    info[3] = rs.getString("nombrecarrera");
                }

            } else {
                return null;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return info;
    }

    public EstudianteUSB obtenerDatosUSB(Usuario u) {

        EstudianteUSB datos = new EstudianteUSB();
        PreparedStatement ps = null;

        try {
            ps = conexion.prepareStatement("SELECT * FROM \"dycicle\".estudianteusb"
                    + " WHERE nombreusuario =?");
            ps.setString(1, u.getNombreusuario());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                datos.setNombreusuario(rs.getString("nombreusuario"));
                datos.setCarnet(rs.getString("carnet"));
                datos.setCedula(rs.getString("cedula"));

            }

            return datos;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public boolean InsertarPath(String path, Usuario user) {
        try {

            EstudianteUSB usuario = obtenerDatosUSB(user);

            PreparedStatement ps = null;
            ps = conexion.prepareStatement("INSERT INTO \"dycicle\".archivosestudiante "
                    + "VALUES(?,?);");
            ps.setString(1, user.getNombreusuario());
            ps.setString(2, path);

            String sqlquery = "SELECT * FROM \"dycicle\".archivosestudiante WHERE "
                    + "nombreusuario = '" + user.getNombreusuario() + "';";

            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);

            if (rs.next()) {
                sqlquery = "UPDATE \"dycicle\".archivosestudiante SET "
                        + "direccion = '" + path + "' "
                        + "WHERE nombreusuario = '" + user.getNombreusuario() + "';";
            } else {
                sqlquery = "INSERT INTO \"dycicle\".archivosestudiante VALUES("
                        + "'" + user.getNombreusuario() + "','" + path + "');";
            }

            Integer i = stmt.executeUpdate(sqlquery);
            return i > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;

    }

    public boolean InsertarIdioma(Idiomas idioma) {


        try {

            String sqlquery = "SELECT nombreusuario FROM \"dycicle\".estudianteInternacional WHERE"
                    + " nombreusuario='" + idioma.getNombreusuario() + "';";
            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);

            if (rs.next()) {
                sqlquery = "UPDATE \"dycicle\".estudianteInternacional SET "
                        + "LenguaMaterna = '" + idioma.getLenguaMaterna() + "',"
                        + "CursoEspaniol = '" + idioma.getTomarCursoDeEspaniol() + "' "
                        + "WHERE nombreusuario = '" + idioma.getNombreusuario() + "';";
                stmt = conexion.createStatement();
                Integer i = stmt.executeUpdate(sqlquery);
            }

            ArrayList escri = idioma.getListEscrito();
            ArrayList ver = idioma.getListVerbal();
            ArrayList idio = idioma.getListIdioma();
            ArrayList conver = idioma.getListConversacional();
            ArrayList audi = idioma.getListAuditivo();
            for (int i = 0; i < idio.size(); i++) {
                sqlquery = "INSERT INTO \"dycicle\".idiomas VALUES("
                        + "'" + idioma.getNombreusuario() + "','" + idio.get(i) + "','"
                        + ver.get(i) + "','" + escri.get(i) + "','" + conver.get(i) + "','" + audi.get(i) + "');";
                stmt = conexion.createStatement();
                Integer j = stmt.executeUpdate(sqlquery);
            }
            return true;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;

    }

    /**
     * Este metodo es para insertar el plan de estudio de los estudiantes
     * USBistas que estan aplicando
     */
    public boolean InsertarPlan(PlanDeEstudio plan) {
        PreparedStatement ps = null;
        try {


            ArrayList codusb = plan.getListCodigoUSB();
            ArrayList coduniv = plan.getListCodigoUniv();
            ArrayList creusb = plan.getListCreditoUSB();
            ArrayList creuniv = plan.getListCreditoUniv();
            ArrayList nomusb = plan.getListMateriaUSB();
            ArrayList nomuniv = plan.getListMateriaUniv();
            String nombre = plan.getNombreUsuario();
            for (int i = 0; i < codusb.size(); i++) {
                ps = conexion.prepareStatement("INSERT INTO \"dycicle\".planestudio "
                        + "VALUES(?,?,?,?,?,?,?);");
                ps.setString(1, (String) nombre);
                ps.setString(2, (String) codusb.get(i));
                ps.setString(3, (String) nomusb.get(i));
                ps.setInt(4, (Integer) creusb.get(i));
                ps.setString(5, (String) coduniv.get(i));
                ps.setString(6, (String) nomuniv.get(i));
                ps.setInt(7, (Integer) creuniv.get(i));
                Integer j = ps.executeUpdate();
                return j > 0;

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
        return false;

    }

    public UniversidadPrograma obtenerUniversidad(Usuario u, String prioridad) {

        UniversidadPrograma datos = new UniversidadPrograma();
        PreparedStatement ps = null;
        try {
            ps = conexion.prepareStatement("SELECT * FROM \"dycicle\".universidades"
                    + " WHERE nombreusuario = '" + u.getNombreusuario() + "' AND prioridad = '" + prioridad + "';");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                datos.setnombreuni(rs.getString("nombreuni"));
                datos.setnombreprograma(rs.getString("nombreprograma"));
                datos.setmesfechaini(rs.getString("mesfechaini"));
                datos.setaniofechaini(rs.getString("aniofechaini"));
                datos.setmesfechafin(rs.getString("mesfechafin"));
                datos.setaniofechafin(rs.getString("aniofechafin"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return datos;
    }
    
    /* Esta funcion es para insertar el plan de estudio de los estudiantes extranjeros*/
    public boolean InsertarPlan(PlanExtranjero plan) {

        try {
            PreparedStatement ps = null;
            ArrayList codusb = plan.getListCodigoUSB();
            ArrayList creusb = plan.getListCreditoUSB();
            ArrayList nomusb = plan.getListMateriaUSB();
            String nombre = plan.getNombreUsuario();
            for (int i = 0; i < codusb.size(); i++) {
                ps = conexion.prepareStatement("INSERT INTO \"dycicle\".planestudio "
                        + "VALUES(?,?,?,?,'1', '1', '1');");
                ps.setString(1, nombre);
                ps.setString(2, (String) codusb.get(i));
                ps.setString(3, (String) nomusb.get(i));
                ps.setInt(4, (Integer) creusb.get(i));
                Integer j = ps.executeUpdate();

            }

            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public ArrayList<Usuario> listarBusquedaAvanzada(Busqueda busqueda) {

        ArrayList<Usuario> usrs = new ArrayList<Usuario>(0);
        String sqlqueryu = "";
        String query2 = "";
        boolean iniciado = false;

        if (!busqueda.getNombre().equalsIgnoreCase("")) {
            if (busqueda.getNombre().toLowerCase().equals(busqueda.getNombre())) {
                char[] arreglo = busqueda.getNombre().toCharArray();
                arreglo[0] = Character.toUpperCase(arreglo[0]);
                busqueda.setNombre(new String(arreglo));
            }
            query2 += "PrimerNombre='" + busqueda.getNombre() + "'";
            iniciado = true;


        }

        if (!busqueda.getApellido().equalsIgnoreCase("")) {
            if (busqueda.getApellido().toLowerCase().equals(busqueda.getApellido())) {
                char[] arreglo = busqueda.getApellido().toCharArray();
                arreglo[0] = Character.toUpperCase(arreglo[0]);
                busqueda.setApellido(new String(arreglo));
            }
            if (iniciado) {
                query2 += " AND ";
            }
            query2 += "PrimerApellido='" + busqueda.getApellido() + "'";
            iniciado = true;

        }


        if (!busqueda.getCarnet().equalsIgnoreCase("")) {
            if (iniciado) {
                query2 += " AND ";
            }
            query2 += "Carnet='" + busqueda.getCarnet() + "'";
            iniciado = true;

        }

        if (!busqueda.getIndice().equalsIgnoreCase("")) {
            if (iniciado) {
                query2 += " AND ";
            }
            query2 += "Indice " + busqueda.getIndice();
            iniciado = true;
        }

        if (!busqueda.getCarrera().equalsIgnoreCase("")) {
            if (iniciado) {
                query2 += " AND ";
            }
            query2 += "Carrera='" + busqueda.getCarrera() + "'";
            iniciado = true;
        }


        if (!busqueda.getPais().equalsIgnoreCase("")) {
            if (iniciado) {
                query2 += " AND ";
            }
            sqlqueryu += "NATURAL JOIN \"dycicle\".universidades ";
            query2 += "Pais='" + busqueda.getPais() + "'";
            iniciado = true;
        }

        if (!busqueda.getOpcion1().equalsIgnoreCase("")) {
            if (iniciado) {
                query2 += " AND ";
            }
            sqlqueryu += "NATURAL JOIN \"dycicle\".universidades ";
            query2 += "NombreUni='" + busqueda.getOpcion1() + "'";
            iniciado = true;
        }


        if (iniciado) {
            try {
                String sqlquery = "SELECT * FROM \"dycicle\".estudiante NATURAL JOIN "
                        + "\"dycicle\".postulacion NATURAL JOIN "
                        + "\"dycicle\".estudianteusb NATURAL JOIN "
                        + "\"dycicle\".antecedenteacademico ";

                sqlquery += sqlqueryu;
                sqlquery += "WHERE " + query2;

                sqlquery += ";";
                Statement stmt = conexion.createStatement();
                ResultSet rs = stmt.executeQuery(sqlquery);

                while (rs.next()) {
                    Usuario u = new Usuario();
                    u.setNombreusuario(rs.getString("nombreusuario"));
                    u.setNombre(rs.getString("primernombre"));
                    u.setEmail(rs.getString("email"));
                    u.setConfirmar(rs.getString("estadopostulacion"));
                    usrs.add(u);
                };
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            return usrs;
        }

        try {
            String sqlquery = "SELECT * FROM \"dycicle\".estudiante NATURAL JOIN"
                    + " \"dycicle\".postulacion";
            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {
                Usuario u = new Usuario();
                u.setNombreusuario(rs.getString("nombreusuario"));
                u.setNombre(rs.getString("primernombre"));
                u.setEmail(rs.getString("email"));
                u.setConfirmar(rs.getString("estadopostulacion"));
                usrs.add(u);
            };

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return usrs;



    }

    public ArrayList<Usuario> listarBusquedaAvanzadaAnuncios(Busqueda busqueda) {

        ArrayList<Usuario> usrs = new ArrayList<Usuario>(0);
        String sqlqueryu = "";
        String query2 = "";
        String query3 = "";
        String query4 = "";
        boolean iniciado = false;
        boolean iniciadoP = false;
        boolean iniciadoG = false;

        // ARMANDO EL QUERY PARA LOS ESTUDIANTES
        if (!busqueda.getNombre().equalsIgnoreCase("")) {
            if (busqueda.getNombre().toLowerCase().equals(busqueda.getNombre())) {
                char[] arreglo = busqueda.getNombre().toCharArray();
                arreglo[0] = Character.toUpperCase(arreglo[0]);
                busqueda.setNombre(new String(arreglo));
            }
            query2 += "PrimerNombre='" + busqueda.getNombre() + "'";
            iniciado = true;

        }

        if (!busqueda.getApellido().equalsIgnoreCase("")) {
            if (busqueda.getApellido().toLowerCase().equals(busqueda.getApellido())) {
                char[] arreglo = busqueda.getApellido().toCharArray();
                arreglo[0] = Character.toUpperCase(arreglo[0]);
                busqueda.setApellido(new String(arreglo));
            }
            if (iniciado) {
                query2 += " AND ";
            }
            query2 += "PrimerApellido='" + busqueda.getApellido() + "'";
            iniciado = true;

        }

        if (!busqueda.getCarnet().equalsIgnoreCase("")) {
            if (iniciado) {
                query2 += " AND ";
            }
            query2 += "Carnet='" + busqueda.getCarnet() + "'";
            iniciado = true;

        }

        if (!busqueda.getIndice().equalsIgnoreCase("")) {
            if (iniciado) {
                query2 += " AND ";
            }
            query2 += "Indice " + busqueda.getIndice();
            iniciado = true;
        }

        if (!busqueda.getCarrera().equalsIgnoreCase("")) {
            if (iniciado) {
                query2 += " AND ";
            }
            query2 += "Carrera='" + busqueda.getCarrera() + "'";
            iniciado = true;
        }


        if (!busqueda.getPais().equalsIgnoreCase("")) {
            if (iniciado) {
                query2 += " AND ";
            }
            sqlqueryu += "NATURAL JOIN \"dycicle\".universidades ";
            query2 += "Pais='" + busqueda.getPais() + "'";
            iniciado = true;
        }

        if (!busqueda.getOpcion1().equalsIgnoreCase("")) {
            if (iniciado) {
                query2 += " AND ";
            }
            sqlqueryu += "NATURAL JOIN \"dycicle\".universidades ";
            query2 += "NombreUni='" + busqueda.getOpcion1() + "'";
            iniciado = true;
        }

        //ARMANDO EL QUERY PARA LOS POSTULANTES
        String nombrePostu = busqueda.getNombrePostu();
        if (!nombrePostu.equalsIgnoreCase("")) {
            query3 += "(NombreCarrera ='" + nombrePostu + "' OR "
                    + "NombreUniExt = '" + nombrePostu + "')";

            iniciadoP = true;

        }

        String tipo = busqueda.getTipoPostu();
        if (!tipo.equalsIgnoreCase("")) {
            if (iniciadoP) {
                query3 += " AND ";
            }
            query3 += "Tipo = '" + tipo + "'";
            iniciadoP = true;
        }

        //ARMANDO EL QUERY PARA LOS GESTORES
        String nombreG = busqueda.getGestor();
        if (!nombreG.equalsIgnoreCase("")) {
            query4 += "NombreG = '" + nombreG + "'";

            iniciadoG = true;

        }

        //Si se coloco informacion en los campos de los estudiantes 
        if (iniciado) {
            try {
                String sqlquery = "SELECT * FROM \"dycicle\".estudiante NATURAL JOIN "
                        + "\"dycicle\".postulacion NATURAL JOIN "
                        + "\"dycicle\".estudianteusb NATURAL JOIN "
                        + "\"dycicle\".antecedenteacademico ";

                sqlquery += sqlqueryu;
                sqlquery += "WHERE " + query2 + ";";
                Statement stmt = conexion.createStatement();
                ResultSet rs = stmt.executeQuery(sqlquery);

                while (rs.next()) {
                    Usuario u = new Usuario();
                    u.setNombreusuario(rs.getString("nombreusuario"));
                    u.setNombre(rs.getString("primernombre"));
                    u.setEmail(rs.getString("email"));
                    usrs.add(u);
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

        // Si se coloco informacion en los campos de los postulantes
        if (iniciadoP) {
            try {
                String sqlquery = "SELECT * FROM \"dycicle\".usuario NATURAL JOIN "
                        + "\"dycicle\".postulante ";
                sqlquery += "WHERE " + query3 + ";";
                Statement stmt2 = conexion.createStatement();
                ResultSet rs2 = stmt2.executeQuery(sqlquery);

                while (rs2.next()) {
                    Usuario u = new Usuario();
                    u.setNombreusuario(rs2.getString("nombreusuario"));
                    u.setNombre(rs2.getString("nombre"));
                    u.setEmail(rs2.getString("email"));
                    usrs.add(u);
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }

        }

        if (iniciadoG) {
            try {
                String sqlquery = "SELECT * FROM \"dycicle\".usuario NATURAL JOIN "
                        + "\"dycicle\".gestor ";
                sqlquery += "WHERE " + query4 + ";";
                Statement stmt3 = conexion.createStatement();
                ResultSet rs3 = stmt3.executeQuery(sqlquery);

                while (rs3.next()) {
                    Usuario u = new Usuario();
                    u.setNombreusuario(rs3.getString("nombreusuario"));
                    u.setNombre(rs3.getString("nombre"));
                    u.setEmail(rs3.getString("email"));
                    usrs.add(u);
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }

        }
        if (iniciado || iniciadoP || iniciadoG) {
            return usrs;
        }

        try {
            String sqlquery = "SELECT * FROM \"dycicle\".usuario;";
            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sqlquery);

            while (rs.next()) {
                Usuario u = new Usuario();
                u.setNombreusuario(rs.getString("nombreusuario"));
                u.setNombre(rs.getString("nombre"));
                u.setEmail(rs.getString("email"));
                usrs.add(u);
            };

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return usrs;

    }

    public String getPrivilegioUsuario(String nombreUsuario) {
        String result = null;
        PreparedStatement ps = null;
        try {
            ps = conexion.prepareStatement("SELECT privilegio FROM \"dycicle\".usuario WHERE"
                    + " nombreusuario=?;");
            ps.setString(1, nombreUsuario);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                result = rs.getString("privilegio");
            }
        } catch (SQLException ex) {
        }
        return result;
    }

    public boolean Comentar(Usuario u) {
        PreparedStatement ps = null;
        try {
            ps = conexion.prepareStatement("UPDATE \"dycicle\".estudiante SET "
                    + "comentario= ? WHERE nombreusuario = ?");
            ps.setString(1, u.getConfirmar());
            ps.setString(2, u.getNombreusuario());
            Integer i = ps.executeUpdate();
            return i > 0;

        } catch (SQLException ex) {
        }
        return true;
    }
    
    public boolean Recomendar(Usuario u) {
        PreparedStatement ps = null;
        try {
            ps = conexion.prepareStatement("UPDATE \"dycicle\".postulacion SET "
                    + "comentrecomend= ? , recomendacion = ? WHERE nombreusuario = ?");
            ps.setString(1, u.getConfirmar());
            ps.setString(2, u.getConfirmar2());
            ps.setString(3, u.getNombreusuario());
            Integer i = ps.executeUpdate();
            return i > 0;

        } catch (SQLException ex) {
        }
        return true;
    }

    public boolean registrar(String usuario, String accion) {

        try {

            String sqlquery = "INSERT INTO \"dycicle\".LogAuditoria VALUES('" + usuario + "', '" + accion + "');";
            Statement stmt = conexion.createStatement();
            Integer i = stmt.executeUpdate(sqlquery);
            return i > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public ArrayList<Usuario> LogAuditoria() {

        String sql = "SELECT * FROM \"dycicle\".LogAuditoria ORDER BY fecha DESC";
        ArrayList<Usuario> users = new ArrayList();
        try {
            Statement stmt = conexion.createStatement();    
            ResultSet set = stmt.executeQuery(sql);

            while (set.next()) {
                Usuario u = new Usuario();
                u.setNombreusuario(set.getString("NombreUsuario"));
                u.setConfirmar(set.getString("Accion"));
                u.setNombre(set.getString("Fecha"));
                users.add(u);

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return users;
    }

    public boolean existeUsuario(Usuario u) {
        PreparedStatement psConsultar = null;

        try {
            psConsultar = conexion.prepareStatement("SELECT * FROM \"dycicle\".usuario"
                    + " WHERE nombreusuario = ?;");
            psConsultar.setString(1, u.getNombreusuario());
            ResultSet set = psConsultar.executeQuery();
            return set.next();


        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return false;

    }
    
    public EstudianteUSB obtenerDatosEstUsb(String u) {
        PreparedStatement psConsultar = null;
        EstudianteUSB estu = new EstudianteUSB();
        try {
            Statement stmt  = conexion.createStatement();
            
            String sqlquery = "SELECT * FROM \"dycicle\".estudiante"
                    + " WHERE nombreusuario = '" + u + "';" ;
            ResultSet rs = stmt.executeQuery(sqlquery);
            Boolean b = rs.next();
            
            if (b){
                System.out.println("Si estaa");
                estu.setpNombre(rs.getString("primernombre"));
                estu.setsNombre("");
                estu.setpApellido(rs.getString("primerapellido"));
                estu.setsApellido("");
                
                System.out.println("nombre" + rs.getString("primernombre"));
            }else{
                System.out.println("NOOO esta");
            }
            
            sqlquery = "SELECT * FROM \"dycicle\".estudianteusb"
                    + " WHERE nombreusuario = '" + u + "';" ;
            rs = stmt.executeQuery(sqlquery);
            b = rs.next();
            
            if (b){
                System.out.println("Si estaa");
                estu.setCarnet(rs.getString("carnet"));
            }else{
                System.out.println("NOOO esta");
            }
            
            
            return estu;


        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        return estu;

    }
    
}
