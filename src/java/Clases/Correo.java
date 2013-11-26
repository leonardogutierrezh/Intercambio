/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import java.util.ArrayList;

/**
 *
 * @author dreabalbas
 */
public class Correo extends org.apache.struts.action.ActionForm{

    private String mailSistema = "intercambios.usb@gmail.com";
    private String claveMail = "sgiDRICUSB";
    private String nombreRemitente;
    private String correoRemitente;
    private String asunto;
    private String mensaje;
    private Session session;
    private String email;
    Message msg;
    
    private final String correoDRIC = "intercambio.dri@gmail.com";
    private final String firma = "\n\nEste correo fue enviado gracias al servicio de envio de notificaciones"
                                 + " del Sistema de Gestión de Intercambios de la Dirección de Relaciones"
                                 + " Internacionales y de Cooperación de la Universidad Simón Bolívar";
    
    public Correo(){
        super();
    }
    
    public String getMailSistema() {
        return mailSistema;
    }

    public void setMailSistema(String mailSistema) {
        this.mailSistema = mailSistema;
    }

    public String getClaveMail() {
        return claveMail;
    }

    public void setClaveMail(String claveMail) {
        this.claveMail = claveMail;
    }

    public String getNombreRemitente() {
        return nombreRemitente;
    }

    public void setNombreRemitente(String nombreRemitente) {
        this.nombreRemitente = nombreRemitente;
    }

    public String getCorreoRemitente() {
        return correoRemitente;
    }

    public void setCorreoRemitente(String correoRemitente) {
        this.correoRemitente = correoRemitente;
    }

    public String getAsunto() {
        return asunto;
    }

    public void setAsunto(String asunto) {
        this.asunto = asunto;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public Session getSession() {
        return session;
    }

    public void setSession(Session session) {
        this.session = session;
    }

    public Message getMsg() {
        return msg;
    }

    public void setMsg(Message msg) {
        this.msg = msg;
    }
    
    public String getCorreoDRIC() {
        return correoDRIC;
    }

    public String getFirma() {
        return firma;
    }
    
    /**
     *
     * @return
     */
    public String getEmail() {
        return email;
    }


    /*
     * Metodo utilizado para el envio de mensajes por el servicio de contacto
     * de la pagina.
     * 
     * true significa que fue válido el envío
     */
    public boolean enviar(String destinatario) {
        
        // Se establecen las caracteristicas mediante las cuales se enviara el 
        // correo
        Properties p = new Properties();
        p.put("mail.smtp.host", "smtp.gmail.com");
        p.put("mail.smtp.socketFactory.port", "465");
        p.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        p.put("mail.smtp.auth", "true");
        p.put("mail.smtp.port", "465");

        // Inicio de sesion en el correo del sistema
        Session session = Session.getDefaultInstance(p,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(getMailSistema(), getClaveMail());
                    }
                });

        try {
            
            // Se establece el destinatario, remitente, asunto y mensaje del correo
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(getMailSistema()));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(destinatario));
            message.setSubject(getAsunto());
            
            String contenido = "Nombre del remitente: " + getNombreRemitente() + 
                               "\nCorreo del remitente: " + getCorreoRemitente() + 
                               "\nMensaje: " + getMensaje() + getFirma();
                    
            
            message.setText(contenido);
            
            // Envio del correo
            Transport.send(message);

            return true;
            
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    } 
    
    
    /*
     * Metodo utilizado para el envio de notificaciones del sistema
     * 
     * true indica que la notificacion fue enviada.
     */
    public boolean enviarUsuario(String destinatario) {
        Properties p = new Properties();
        p.put("mail.smtp.host", "smtp.gmail.com");
        p.put("mail.smtp.socketFactory.port", "465");
        p.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        p.put("mail.smtp.auth", "true");
        p.put("mail.smtp.port", "465");

        Session session = Session.getDefaultInstance(p,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(getMailSistema(), getClaveMail());
                    }
                });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(getMailSistema()));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(destinatario));
            message.setSubject(getAsunto());
            
            String contenido = getMensaje() + getFirma();
                    
            message.setText(contenido);
            Transport.send(message);

            return true;
            
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }
 
    public boolean enviarAnuncio(ArrayList<String> dst){
        
        Properties p = new Properties();
        p.put("mail.smtp.host", "smtp.gmail.com");
        p.put("mail.smtp.socketFactory.port", "465");
        p.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        p.put("mail.smtp.auth", "true");
        p.put("mail.smtp.port", "465");

        Session session = Session.getDefaultInstance(p,
                new javax.mail.Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(getMailSistema(), getClaveMail());
                    }
                });
        
        try{
        
            Message message = new MimeMessage(session);
            String destinatario = new String();
            
            for (int i=0;i < dst.size();i++){
                
                destinatario = dst.get(i);
                message.setFrom(new InternetAddress(getMailSistema()));
                message.setRecipients(Message.RecipientType.TO,
                        InternetAddress.parse(destinatario));
                message.setSubject(getAsunto());
                String contenido = getMensaje() + getFirma();

                    message.setText(contenido);
                Transport.send(message);
            }
            
            return true;

        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
        
    }
}