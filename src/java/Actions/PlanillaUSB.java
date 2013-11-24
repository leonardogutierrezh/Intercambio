package Actions;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


import Clases.Usuario;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMessage;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import DBMS.*;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 *
 * @author karen
 */
public class PlanillaUSB extends org.apache.struts.action.Action {
    
    private static final String patronEmail = "^([_A-Za-z0-9-\\.\\+])+@([A-Za-z0-9-])+\\.([A-Za-z0-9-])+$";
    private static final String SUCCESS = "success";
    private static final String FAIL = "failure";
    private static final String ERROR = "error";
    private Pattern patron;
    private Matcher match;

    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, 
           HttpServletRequest request, HttpServletResponse response) 
           throws Exception {
        
        
        
        
        return super.execute(mapping, form, request, response);
    }
    
    
    
}
