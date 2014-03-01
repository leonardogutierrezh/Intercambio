<%-- 
    Document   : SubirDocumento
    Created on : 13-nov-2012, 23:50:59
    Author     : gustavo
--%>

<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
    <head>
        <script language="javascript">
            var index = 0;
            var fCount = 0;
            function addRow(tableID) {
                fCount++;

                var fObject = document.getElementById(tableID);
                var checkbox = "checkbox";
                var tag='<input type="file" name="theFile[' +  fCount +  ']" value="">';
                var name = "theFile[" +  fCount +  "]";
                var file = "file";
                var valgin = "middle";
                var value = "";
                var id = "archivos";
                var clas = "feed";
                var arr = "chk[]"
                var style = "position:relative;"
                var o3 = document.createElement("br");
                var o2 = document.createElement("input");
                var check = document.createElement("input");
                var tr = document.createElement("tr");
                var td = document.createElement("td");
                var div1 = document.createElement("div");
                var div2 = document.createElement("div");
                
                
               
                //Atributos para div1
                div1.setAttribute("id",id);
                //fin de atributos para div1
                
                //Atributos para div2
                div2.setAttribute("class",clas);
                //fin de atributos para div2
                
                //Atributos para el checkbox
                check.setAttribute("type",checkbox);
                check.setAttribute("name",arr)
                //Fin de atributos para checkbox
                //Atributos para el archivo
                o2.setAttribute("type", file);
                o2.setAttribute("name", name );
                o2.setAttribute("value", value);
                o2.setAttribute("styame", name );
                o2.setAttribute("valule",style);
                //Fin Atributos para el archivo
                var td2 = document.createElement("td").appendChild(div1).appendChild(div2).appendChild(o2);
                
                //Atributos para el td interno
                td2.setAttribute("valgin",valgin);
                //Fin atributos del td
                                
                fObject.appendChild(tr).appendChild(td).appendChild(check);
                
                var segundo_p = document.getElementById(tableID).getElementsByTagName('td');
                
                
                fObject.appendChild(tr).insertBefore(td2, segundo_p);
                
                
               
            }
 
            function deleteRow(tableID) {
                try {

                    var table = document.getElementById(tableID);
                    var rowCount = table.rows.length;
	
                    for(var i=0; i<rowCount; i++) {
                        var row = table.rows[i];
                        var chkbox = row.cells[0].childNodes[0];
                        if(null != chkbox && true == chkbox.checked) {
				
                            if(rowCount <= 1) {
                                alert("No puede borrar todas las opciones");
                                break;
                            }
                            table.deleteRow(i);
                            rowCount--;
                            i--;
                        }
	
                    }
		
                } catch(e) {
                    alert(e);
                }
            }


        </script>

        <title>Subir Archivo</title>
    </head>
    <body>
        <div align=center>
            <html:form action="/FileUploadAction" method="post" enctype="multipart/form-data">
                <br />

                <table id="dataTable" width="350px" cellspacing="14px">
                    <tbody id ="dataBody">
                        <tr>

                            <td><INPUT type="checkbox" name="chk[]"/></td>

                            <td valign="middle">
                                <div id="archivos" >
                                    <div class="feed">  
                                        <html:file property="theFile[0]" />
                                        <br />
                                        <br />
                                    </div>
                                </div>

                            </td> 
                        </tr>
                    </tbody>
                </table>  
                <input type="button" value="Agregar documento" style="font-size:16px; padding:4px 6px" onclick="addRow('dataBody')"/>

                <input type="button" value="Eliminar" style="font-size:16px; padding:4px 6px" onclick="deleteRow('dataTable')"/>


                <p><html:submit /><p>

                </html:form>
        </div>
    </body>
</html>
