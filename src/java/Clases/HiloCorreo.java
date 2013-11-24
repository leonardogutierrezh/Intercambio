/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.util.ArrayList;
import java.util.Arrays;

/**
 *
 * @author dreabalbas
 */
public class HiloCorreo extends Thread{
    
    private Anuncio anuncio;
    
    public HiloCorreo(Anuncio a){
        super();
        this.anuncio = a;
    }
@Override 
    public void run(){
        
        Correo c = new Correo();
        c.setAsunto(anuncio.getTitulo());
        c.setMensaje(anuncio.getMensaje());
        ArrayList<String> pasaje = new ArrayList<String>(Arrays.asList(anuncio.getEmails()));
        boolean enviado = c.enviarAnuncio(pasaje);
        
    } 
    
}
