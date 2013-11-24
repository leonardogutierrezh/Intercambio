/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

        var fCount = 5;
        var Count = 0;
        var mCount = 0;
        var direccionPlanillaSmile1='/Intercambio/estudianteUSB/Recursos/SMILE_Student_Learning-Agreement.doc'
        var direccionPlanillaSmile2='/Intercambio/estudianteUSB/Recursos/SMILE_Student_Application-Form.doc'
        var direccionPlanillaCinda1='/Intercambio/estudianteUSB/Recursos/CINDA_Ficha_de_reconocimiento.doc'
        var direccionPlanillaCinda2='/Intercambio/estudianteUSB/Recursos/CINDA_Ficha_solicitud_de_participación.doc'
        
        function cambiar_link1(){
            
            var seleccion=document.getElementById('prog_princ');
            if(seleccion.value == "SMILE"){
                document.getElementById('planillaExt1').href=direccionPlanillaSmile1;
                document.getElementById('planillaExt1').innerHTML='Descargue el Contrato de estudiantes para SMILE';
                document.getElementById('planillaExt2').href=direccionPlanillaSmile2;
                document.getElementById('planillaExt2').innerHTML='Descargue el formulario de Aplicacion SMILE'
            }
            
            if(seleccion.value == "CINDA"){
                document.getElementById('planillaExt1').href=direccionPlanillaCINDA;
                document.getElementById('planillaExt1').innerHTML='Descargue el formulario de Reconocimiento para CINDA';
                document.getElementById('planillaExt2').href=direccionPlanillaCINDA;
                document.getElementById('planillaExt2').innerHTML='Descargue el formulario de participación para CINDA';
            }
            
        }
        
        function addMate(tableID) {
            mCount++;

            var fObject = document.getElementById(tableID);
            var checkbox2 = "checkbox";
            var nomUSB = "materiaUSB[" +  mCount +  "]";
            var codUSB = "codigoUSB[" +  mCount +  "]";
            var creUSB = "creditosUSB[" +  mCount +  "]";
            var arr2 = "c[]";
            var type = "text";
            
            var style1 = "width:80%;";
            var style2 = "width:60%;";
            
            var o2 = document.createElement("input");
            var check2 = document.createElement("input");
            var i1 = document.createElement("input");
            var i2 = document.createElement("input");
            var i3 = document.createElement("input");
            var tr = document.createElement("tr");
            var td = document.createElement("td");
            var td2 = document.createElement("td");
            var td4 = document.createElement("td");
            var td6 = document.createElement("td");
            var td8 = document.createElement("td");
            var td10 = document.createElement("td");
            var td12 = document.createElement("td");
                
            //Atributos para el checkbox
            check2.setAttribute("type",checkbox2);
            check2.setAttribute("name",arr2);
            i1.setAttribute("type",type);
            i1.setAttribute("name",codUSB);
            i1.setAttribute("style",style1);
            i2.setAttribute("type",type);
            i2.setAttribute("name",nomUSB);
            i2.setAttribute("style",style1);
            i3.setAttribute("type",type);
            i3.setAttribute("name",creUSB);
            i3.setAttribute("style",style1);
             
            td.appendChild(check2);
            td2.appendChild(i1);
            td4.appendChild(i2);
            td6.appendChild(i3);
            
            
            tr.appendChild(td);
            
            tr.appendChild(td2);
            
            tr.appendChild(td4);
            
            tr.appendChild(td6);
            
            fObject.appendChild(tr);
               
        }
        
       
        function addIdi(tableID) {
              Count++;

            var fObject = document.getElementById(tableID);
            var checkbox = "checkbox";
            var idioma = "idiomaDest[" +  Count +  "]";
            var verbal = "nivelVerbal[" +  Count +  "]";
            var escrito = "nivelEscrito[" +  Count +  "]";
            var conversacional = "nivelConversacional[" + Count + "]";
            //auditivo
            var auditivo = "nivelAuditivo[" + Count + "]";
            var basico = "Basico";
            var intermedio = "Intermedio";
            var avanzado = "Avanzado";
            var arr = "chk[]";
            var type = "text";
            var style1 = "width:80%;";
            //var style2 = "padding:1%;";
            
            var tit1 = "Idioma que maneja";
            var tit2 = "Nivel Verbal";
            var tit3 = "Nivel Escrito";
            var tit4 = "Nivel Oral";
            //auditivo
            var tit5 = "Nivel Auditivo";
            var o2 = document.createElement("input");
            var check = document.createElement("input");
            
            //Nivel Escrito
            var op1 = document.createElement("option"); //basico
            var op2 = document.createElement("option");//intermedio
            var op3 = document.createElement("option");//avanzado
            
            //Nivel Verbal
            var op4 = document.createElement("option");//basico
            var op5 = document.createElement("option");//intermedio
            var op6 = document.createElement("option");//avanzado
            
            //Nivel Conversacional
            var op7 = document.createElement("option");//basico
            var op8 = document.createElement("option"); //intermedio
            var op9 = document.createElement("option"); //avanzado
            
            var op10 = document.createElement("option");
            var op11 = document.createElement("option");
            var op12 = document.createElement("option");
            //auditivo
            var op16 = document.createElement("option");
            
            //Nivel Auditivo
            var op13 = document.createElement("option");//basico
            var op14 = document.createElement("option"); //intermedio
            var op15 = document.createElement("option"); //avanzado
            
            
            var tr = document.createElement("tr");
            var select1 = document.createElement("select");
            var select2 =document.createElement("select");
            var select3 = document.createElement("select");
            //auditivo
            var select4 = document.createElement("select");
            var td2 = document.createElement("td");
            var td4 = document.createElement("td");
            var td6 = document.createElement("td");
            var td7 = document.createElement("td");
            var td9 = document.createElement("td");
            var td10 = document.createElement("td");
            
            //auditivo
            var td12 = document.createElement("td");
            
            //paddings para todas las columnas
            /*td.setAttribute("style",style2);
            td2.setAttribute("style",style2);
            td3.setAttribute("style",style2);
            td4.setAttribute("style",style2);
            td5.setAttribute("style",style2);
            td6.setAttribute("style",style2);
            td7.setAttribute("style",style2);
            td8.setAttribute("style",style2);
            td9.setAttribute("style",style2);
            td10.setAttribute("style",style2);
            td11.setAttribute("style",style2);
            td12.setAttribute("style",style2);*/
            
            
                
            //Atributos para el checkbox
            check.setAttribute("type",checkbox);
            check.setAttribute("name",arr);
            op1.setAttribute("value",basico);
            op1.innerHTML = "Basico";
            op4.setAttribute("value",basico);
            op4.innerHTML = "Basico";
            op7.setAttribute("value", basico);
            op7.innerHTML = "Basico";
            op2.setAttribute("value",intermedio);
            op2.innerHTML = "Intermedio";
            op5.setAttribute("value",intermedio);
            op5.innerHTML = "Intermedio";
            op8.setAttribute("value", intermedio);
            op8.innerHTML = "Intermedio";
            op3.setAttribute("value",avanzado);
            op3.innerHTML = "Avanzado";
            op6.setAttribute("value",avanzado);
            op6.innerHTML = "Avanzado";
            op9.setAttribute("value", avanzado);
            op9.innerHTML = "Avanzado";
            
            op10.setAttribute("value","");
            op11.setAttribute("value","");
            op12.setAttribute("value","");
            op16.setAttribute("value","");
            
            //auditivo
            
            op15.setAttribute("value",basico);
            op15.innerHTML = "Basico";
            op13.setAttribute("value",intermedio);
            op13.innerHTML = "Intermedio";
            op14.setAttribute("value",avanzado);
            op14.innerHTML = "Avanzado";
            
            
            
            o2.setAttribute("type",type);
            o2.setAttribute("name",idioma);
            o2.setAttribute("style",style1);
            op1.setAttribute("value",basico);
            op2.setAttribute("value", intermedio);
            op3.setAttribute("value",avanzado);
            select1.setAttribute("name",verbal);
            select1.setAttribute("style",style1);
            select2.setAttribute("name",escrito);
            select2.setAttribute("style",style1);
            select3.setAttribute("name",conversacional);
            select3.setAttribute("style",style1);
            //auditivo
            select4.setAttribute("name",auditivo);
            select4.setAttribute("style",style1);
            
            td7.appendChild(check);
            tr.appendChild(td7);
            //td.innerHTML = tit1;
            //tr.appendChild(td);
            td2.appendChild(o2);
            tr.appendChild(td2);
            
            //td3.innerHTML = tit2;
            //tr.appendChild(td3);
            select1.appendChild(op10);
            select1.appendChild(op7);
            select1.appendChild(op1);
            select1.appendChild(op2);
            select1.appendChild(op3);
            td4.appendChild(select1);
            tr.appendChild(td4);
            
            //td5.innerHTML = tit3;
            //tr.appendChild(td5);
            select2.appendChild(op11);
            select2.appendChild(op8);
            select2.appendChild(op4);
            select2.appendChild(op5);
            select2.appendChild(op6);
            td6.appendChild(select2);
            tr.appendChild(td6);
            
            //td8.innerHTML = tit4;
            //tr.appendChild(td8);
            select3.appendChild(op12);
            select3.appendChild(op7);
            select3.appendChild(op8);
            select3.appendChild(op9);
            td10.appendChild(select3);
            tr.appendChild(td10);
            
            //td11.innerHTML = tit5;
            //tr.appendChild(td11);
            select4.appendChild(op16);
            select4.appendChild(op13);
            select4.appendChild(op14);
            select4.appendChild(op15);
            td12.appendChild(select4);
            tr.appendChild(td12);
            
            fObject.appendChild(tr);
               
        }         
        
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
            var td3 = document.createElement("td");
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
                
            fObject.appendChild(tr).appendChild(td3);    
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
                        fCount--;
                    }
	
                }
		
            } catch(e) {
                alert(e);
            }
        }
        
        
        
        function deleteRow2(tableID) {
            try {

                var table = document.getElementById(tableID);
                var rowCount = table.rows.length;
	
                for(var i=0; i<rowCount; i++) {
                    var row = table.rows[i];
                    var chkbox = row.cells[0].childNodes[0];
                    if(null != chkbox && true == chkbox.checked) {
				
                        if(rowCount <= 2) {
                            alert("No puede borrar todas las opciones");
                            break;
                        }
                        table.deleteRow(i);
                        rowCount--;
                        i--;
                        Count--;
                        
                    }
	
                }
		
            } catch(e) {
                alert(e);
            }
        }
        
        function deletePlan(tableID) {
            try {

                var table = document.getElementById(tableID);
                var rowCount = table.rows.length;
        
                for(var i=0; i<rowCount; i++) {
                    var row = table.rows[i];
                    var chkbox = row.cells[0].childNodes[0];
                    
                    if(null != chkbox && true == chkbox.checked) {	
                        if(rowCount <= 2) {
                            alert("No puede borrar todas las opciones");
                            break;
                        }
                       
                        table.deleteRow(i);
                        rowCount--;
                        i--;
                        mCount--;
                    }
	
                }
		
            } catch(e) {
                alert(e);
            }
        }
        
        function show(target){
            document.getElementById(target).style.display = 'block';
        }

        function hide(target){
            document.getElementById(target).style.display = 'none';
        }

        function seleccion(opc)
        {
            //escondemos todos los contenidos
            document.getElementById("opci1").style.display="none";
            document.getElementById("opci2").style.display="none";
            document.getElementById("opci3").style.display="none";
            document.getElementById("opci4").style.display="none";
            document.getElementById("opci5").style.display="none";
            document.getElementById("opci6").style.display="none";
            switch(opc)
            {
                case 1:
                    //mostramos elcontenido de la primera opcion
                    document.getElementById("opci1").style.display="block";
                    break;
                case 2:
                    //mostramos elcontenido de la segunda opcion
                    document.getElementById("opci2").style.display="block";
                    break;
                case 3:
                    //mostramos elcontenido de la tercera opcion
                    document.getElementById("opci3").style.display="block";
                    break;
                case 4:
                    //mostramos elcontenido de la tercera opcion
                    document.getElementById("opci4").style.display="block";
                    break;
                case 5:
                    //mostramos elcontenido de la tercera opcion
                    document.getElementById("opci5").style.display="block";
                    break;
                case 6:
                    //mostramos elcontenido de la tercera opcion
                    document.getElementById("opci6").style.display="block";
                    break;                           
            }
        }

        // CAMBIA EL PAIS DE ACUERDO AL TIPO DE CONVENIO ELEGIDO

        // Convenios Bilaterales
        var paises_Bilaterales=new Array("Seleccione", "Alemania","Australia", "Canadá", "Colombia", "España", "EstadosUnidos", "Finlandia", "Francia", "Italia", "Japón", "México", "Noruega", "Perú", "PuertoRico", "ReinoUnido", "Suecia")
        // SMILE
        var paises_SMILE=new Array("Seleccione", "Alemania", "Bélgica", "Brasil", "Chile", "Colombia", "España", "Polonia", "Portugal", "RepúblicaCheca")
        // CINDA
        var paises_Cinda=new Array("Seleccione", "Argentina", "Bolivia", "Brasil", "Chile", "Colombia", "CostaRica", "Ecuador", "España", "Italia", "México", "Panamá", "Paraguay", "Perú", "RepúblicaDominicana", "Uruguay", "Venezuela")

        function cambia_pais(){ 
            //tomo el valor del select del pais elegido 
            programa = document.getElementById("prog_princ")[document.getElementById("prog_princ").selectedIndex].value 
            if (programa != 0) { 
                mis_paises=eval("paises_" + programa) 
                num_paises = mis_paises.length 
                document.getElementById("pais_princ").length = num_paises
                document.getElementById("pais_princ").options[0].value=0
                document.getElementById("pais_princ").options[0].text="Seleccione"
                for(i=1;i<num_paises;i++){ 
                    document.getElementById("pais_princ").options[i].value=mis_paises[i]
                    document.getElementById("pais_princ").options[i].text=mis_paises[i] 
                } 
            }else{ 
                //si no había provincia seleccionada, elimino las universidades del select 
                document.getElementById("pais_princ").length = 1 
                document.getElementById("pais_princ").options[0].value = "-" 
                document.getElementById("pais_princ").options[0].text = "-" 
            } 
            //marco como seleccionada la opción primera de provincia 
            document.getElementById("pais_princ").options[0].selected = true 
        }

        // CAMBIA LA UNIVERSIDAD DE ACUERDO AL PAIS ESCOGIDO 
 
        // Universidad con Convenios Bilaterales
        var uni_BilateralesAlemania=new Array("Seleccione", "Universidad de Karlsruhe", "Universidad de Siegen")
        var uni_BilateralesAustralia=new Array("Seleccione", "Universidad Tecnológica de Swinburne")
        var uni_BilateralesCanadá=new Array("Seleccione", "Instituto de Tecnología de Ontario")
        var uni_BilateralesColombia=new Array("Seleccione", "Pontificia Universidad Bolivariana", "Universidad Externado")
        var uni_BilateralesEspaña=new Array("Seleccione", "Universidad de Granada", "Universidad de Zaragoza", "Universidad Politécnica de Valencia")
        var uni_BilateralesEstadosUnidos=new Array("Seleccione", "Universidad de Nuevo México", "Universidad de Oklahoma")
        var uni_BilateralesFinlandia=new Array("Seleccione", "Universidad Abo Akademi")
        var uni_BilateralesFrancia=new Array("Seleccione", "Arts et Métiers ParisTech", "EPF Escuela de Ingenieros", "Escuela de Minas de Nantes", "INSA – Lyon", "TELECOM – SudParis", "Universidad Paris Est Marne la Vallé", "Universidad Paris Ouest Nanterre", "Universidad Tecnológica de Compiègne")
        var uni_BilateralesItalia=new Array("Seleccione", "Politécnico de Milano", "Politécnico de Torino")
        var uni_BilateralesJapón=new Array("Seleccione", "Universidad de Tohoku", "Universidad Tecnológica de Nagaoka")
        var uni_BilateralesMéxico=new Array("Seleccione", "Instituto Tecnológico Superior de Cajeme (ITESCA)", "ITESM Monterrey", "Universidad Veracruzana")
        var uni_BilateralesNoruega=new Array("Seleccione", "NTNU- Trondheim")
        var uni_BilateralesPerú=new Array("Seleccione", "Universidad San Martín de Porres")
        var uni_BilateralesPuertoRico=new Array("Seleccione", "Universidad de Puerto Rico")
        var uni_BilateralesReinoUnido=new Array("Seleccione", "Universidad de Ulster")
        var uni_BilateralesSuecia=new Array("Seleccione", "Real Instituto de Estocolmo KTH", "Universidad de Lund", "Universidad de Uppsala")

        // Universidad con SMILE
        var uni_SMILEAlemania=new Array("Seleccione", "Universidad de Stuttgart")
        var uni_SMILEBélgica=new Array("Seleccione", "Universidad Católica de Lovaina")
        var uni_SMILEBrasil=new Array("Seleccione", "PSML - BRA - Universidad de Sao Paulo", "PSML - BRA - Universidad Federal de Río de Janeiro")
        var uni_SMILEChile=new Array("Seleccione", "PSML - CHI - Pontifica Universidad Católica de Chile")
        var uni_SMILEColombia=new Array("Seleccione", "PSML - COL - Pontificia Universidad Javeriana")
        var uni_SMILEEspaña=new Array("Seleccione", "PSML - ESP - Universidad Politécnica de Cataluña", "PSML - ESP - Universidad Politécnica de Madrid")
        var uni_SMILEPolonia=new Array("Seleccione", "PSML - POL - AGH Universidad de Ciencias y Tecnología")
        var uni_SMILEPortugal=new Array("Seleccione", "PSML - POR - Universidad Técnica de Lisboa")
        var uni_SMILERepúblicaCheca=new Array("Seleccione", "PSML - RPC - Universidad Técnica Checa en Praga")

        // Universidad con CINDA
        var uni_CindaArgentina=new Array("Seleccione", "Universidad Nacional de Cuyo", "Universidad Nacional de Quilmes", "Universidad Nacional de San Martín")
        var uni_CindaBolivia=new Array("Seleccione", "Universidad Católica Boliviana San Pablo", "Universidad Privada Santa Cruz de la Sierra")
        var uni_CindaBrasil=new Array("Seleccione", "Universidad de Sao Paulo ", "Universidad Estadual de Campinas")
        var uni_CindaChile=new Array("Seleccione", "Pontificia Universidad Católica de Chile", "Pontificia Universidad Católica de Valparaíso", "Universidad Austral de Chile", "Universidad de Concepción", "Universidad de Talca", "Universidad de Tarapacá")
        var uni_CindaColombia=new Array("Seleccione", "Pontificia Universidad Javeriana ", "Universidad de los Andes", "Universidad del Norte", "Universidad del Valle")
        var uni_CindaCostaRica=new Array("Seleccione", "Universidad de Costa Rica ")
        var uni_CindaEcuador=new Array("Seleccione", "Escuela Superior Politécnica del Litoral")
        var uni_CindaEspaña=new Array("Seleccione", "Universidad Carlos III de Madrid", "Universidad de Barcelona", "Universidad de las Islas Baleares", "Universidad de Santiago de Compostela", "Universitat Oberta de Catalunya", "Universitat Politécnica de Catalunya")
        var uni_CindaItalia=new Array("Seleccione", "Universidad Degli Studi Di Genova")
        var uni_CindaMéxico=new Array("Seleccione", "ITESM Monterrey ", "Universidad Autónoma Metropolitana")
        var uni_CindaPanamá=new Array("Seleccione", "Universidad de Panamá ")
        var uni_CindaParaguay=new Array("Seleccione", "Universidad Católica de Nuestra Señora de la Asunción")
        var uni_CindaPerú=new Array("Seleccione", "Pontificia Universidad Católica del Perú ", "Universidad de Lima", "Universidad del Pacífico ", "Universidad Peruana Cayetano Heredia")
        var uni_CindaRepúbicaDominicana=new Array("Seleccione", "Instituto Tecnológico de Santo Domingo", "Pontificia Universidad Católica Madre Maestra ")
        var uni_CindaUruguay=new Array("Seleccione", "Universidad Católica del Uruguay")
        var uni_CindaVenezuela=new Array("Seleccione", "Universidad Centroccidental Lisandro Alvarado", "Universidad Metropolitana")


        function cambia_universidad(){ 
            //tomo el valor del select del pais elegido 
            programa = document.getElementById("prog_princ")[document.getElementById("prog_princ").selectedIndex].value 
            pais = document.getElementById("pais_princ")[document.getElementById("pais_princ").selectedIndex].value 
            if (programa != 0) { 
                mis_universidades=eval("uni_" + programa + pais) 
                num_universidades = mis_universidades.length 
                document.getElementById("uni_princ").length = num_universidades 
                for(i=0;i<num_universidades;i++){ 
                    document.getElementById("uni_princ").options[i].value=mis_universidades[i] 
                    document.getElementById("uni_princ").options[i].text=mis_universidades[i] 
                } 
            }else{ 
                //si no había provincia seleccionada, elimino las universidades del select 
                document.getElementById("uni_princ").length = 1 
                document.getElementById("uni_princ").options[0].value = "-" 
                document.getElementById("uni_princ").options[0].text = "-" 
            } 
            //marco como seleccionada la opción primera de provincia 
            document.getElementById("uni_princ").options[0].selected = true 
        }    
   