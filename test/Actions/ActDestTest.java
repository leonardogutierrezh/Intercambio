/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author gustavo
 */
public class ActDestTest {
    
    public ActDestTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of execute method, of class ActDest.
     */
    @Test
    public void testExecute() throws Exception {
        System.out.println("execute");
        ActionMapping mapping = null;
        ActionForm form = null;
        HttpServletRequest request = null;
        HttpServletResponse response = null;
        ActDest instance = new ActDest();
        ActionForward expResult = null;
        ActionForward result = instance.execute(mapping, form, request, response);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.

    }
}
