<%@page import="clases.SelectBD"%>
<%@page import="clases.SelectBean"%>
<%@page import="clases.PacienteBD"%>
<%@page import="clases.PacienteBean"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="estilos.css">
        
        <%!
            public List<SelectBean> buscar(String nombre_tabla){
                SelectBD selectObj = new SelectBD();
                List<SelectBean> lstSelect = selectObj.buscar(nombre_tabla);
                return lstSelect;   
            }

            public List<SelectBean> buscarWh(String nombre_tabla, String valor){
                SelectBD selectChange = new SelectBD();
                List<SelectBean> lstChange = selectChange.buscarWh(nombre_tabla, valor);
                return lstChange;
            }   
            
            public List<SelectBean> buscarPuesto(String valor){
                SelectBD selectPuesto = new SelectBD();
                List<SelectBean> lstPuesto = selectPuesto.buscarPuesto(valor);
                return lstPuesto;
            }

            public boolean flgTraerPuestos = false;
            public boolean flgTraerMuni = false;
        %>
        
        <script>
            
            //Agrega los datos a la base de datos
             function inserPaciente(){
                 document.frmRegistro.action = "index.jsp?accion=insertar";
                 document.frmRegistro.submit();
                 <%
                     String Accion = request.getParameter("accion") == null ? "": request.getParameter("accion");
                     if (Accion.equals("insertar")){
                         boolean flgOperation = false;
                         PacienteBean nuevoPaciente = new PacienteBean();
                         nuevoPaciente.setDpi(request.getParameter("txtCui"));
                         nuevoPaciente.setNombre1(request.getParameter("txtNombre1"));
                         nuevoPaciente.setNombre2(request.getParameter("txtNombre2"));
                         nuevoPaciente.setNombre3(request.getParameter("txtNombre3"));
                         nuevoPaciente.setApellido1(request.getParameter("txtApellido1"));
                         nuevoPaciente.setApellido2(request.getParameter("txtApellido2"));
                         nuevoPaciente.setNacimiento(request.getParameter("txtNacimiento"));
                         nuevoPaciente.setDireccion(request.getParameter("txtDireccion"));
                         nuevoPaciente.setCelular(request.getParameter("txtCelular"));
                         nuevoPaciente.setIgss(request.getParameter("radioSi-No"));
                         nuevoPaciente.setComunidad(request.getParameter("txtComunidad"));
                         nuevoPaciente.setPueblo(request.getParameter("txtPueblo"));
                         nuevoPaciente.setEscolaridad(request.getParameter("txtEscolaridad"));
                         nuevoPaciente.setSexo(request.getParameter("txtSexo"));
                         nuevoPaciente.setZona("1");
                         nuevoPaciente.setDiscapacidad(request.getParameter("txtDiscapacidad"));
                         nuevoPaciente.setEnfermedad(request.getParameter("txtEnfermedad"));
                         nuevoPaciente.setTelefono(request.getParameter("txtTelefonia"));
                         nuevoPaciente.setDepartamento(request.getParameter("txtDepartamento"));
                         nuevoPaciente.setMunicipio(request.getParameter("txtMunicipio"));
                         PacienteBD nuevoPaBD = new PacienteBD();
                         flgOperation = nuevoPaBD.insertar(nuevoPaciente);
                     }
                 %>
             }
            
            //Inserta options dentro del select establecido por el id
             function insertarOption(valor, nombre, id){
                 var miSelect = document.getElementById(id);
                 var miOption = document.createElement("option");
                 
                 miOption.setAttribute("value", valor);
                 miOption.setAttribute("label", nombre);
             
                 miSelect.appendChild(miOption);
             }
             
             //Se crean las consultas para llenar los select al cargar la página
             function cargaInicio(){
                <%
                    String tablas[] = {"SEXO", "ESCOLARIDAD", "DEPARTAMENTO", "DEPARTAMENTO", "COMUNIDAD_LINGUISTICA", "PUEBLO",
                    "TELEFONIA", "DISCAPACIDAD", "ENFERMEDAD"};
                    String ids[] = {"selectSexo", "selectEsc", "selectDep", "selDepVac", "selComunidad", "selPueblo",
                    "selTelefono", "selDiscapacidad", "selEnfermedad"};
                    for(int i = 0; i < tablas.length; i++){
                        List<SelectBean> listado = (List<SelectBean>)buscar(tablas[i]);
                        for(int j = 0; j < listado.size(); j++){
                            SelectBean selection = listado.get(j);
                            String valor = String.valueOf(selection.getId());
                            String nombre = selection.getNombre();
                %>
                        insertarOption("<%=valor%>", "<%=nombre%>", "<%=ids[i]%>");
                <%
                        }
                    }
                %>
             }
             
             //Cambio de los municipios según el departamento seleccionado
             function cambioDeOpcion(valor, id){
                 var x = 1;
                <%
                    //if(flgTraerMuni ==  true){
                    int i = 1;
                    do{
                %>
                        if(x == valor){
                            document.getElementById(id).innerText = null;
                            <%
                                List<SelectBean> listChange = (List<SelectBean>)buscarWh("MUNICIPIO", String.valueOf(i));
                                for(int z = 0; z < listChange.size(); z++){
                                    SelectBean selectChange = listChange.get(z);
                                    String valor2 = String.valueOf(selectChange.getId());
                                    String nombre2 = selectChange.getNombre();
                            %>
                                        insertarOption("<%=valor2%>", "<%=nombre2%>", id);
                            <%
                                }
                            %>
                            console.log("<%=i%>");
                            console.log(document.querySelector('input[name="radioSi-No"]:checked').value);
                        }
                        x++;
                <%
                        i++;
                    }while(i < 23);
                    //}
                %>
             }
             
             //Cambio de los puestos de vacunación según el departamento y municipio seleccionados
             function cambioPuesto(puesto){
                 var p = 1;
                 <%
                    //if (flgTraerPuestos == true){
                    int c = 1;
                    do{
                 %>
                        if(p == puesto){
                            document.getElementById("selPuestoVac").innerText = null;
                            <%
                                List<SelectBean> lstPuesto = (List<SelectBean>)buscarPuesto(String.valueOf(c));
                                for(int z = 0; z < lstPuesto.size(); z++){
                                    SelectBean selectPuesto = lstPuesto.get(z);
                                    String valor = String.valueOf(selectPuesto.getId());
                                    String nombre = selectPuesto.getNombre();
                            %>
                                        insertarOption("<%=valor%>", "<%=nombre%>", "selPuestoVac");
                            <%
                                }
                            %>
                            console.log(puesto);
                        }
                        p++;
                 <%
                        c++;
                     }while(c < 341);
                    //}
                 %>
             }
             
             function validarTecla(evt){
                 var code = (evt.which) ? evt.which : evt.keyCode;
                 if(code == 8){
                     return true;
                 }else if(code >= 48 && code <= 57){
                     return true;
                 }else{
                     return false;
                 }
             }
             
             function validarSubmit(){
                 if(document.getElementById("Cui").value.length == 0 || document.getElementById("Nombre1").value.length == 0 ||
                         document.getElementById("Ape1").value.length == 0 || document.getElementById("Ape2").value.length == 0 ||
                         document.getElementById("residencia").value.length == 0 || document.getElementById("feNac").value.length == 0 ||
                         document.getElementById("celular1").value.length == 0 || document.getElementById("celular2").value.length == 0){
                     alert("Hay campos vacíos");
                }else{
                    if(document.getElementById("celular1").value !== document.getElementById("celular2").value){
                        alert("Los números de celular no coinciden");
                    }else{
                        inserPaciente();
                    }
                }
             }
             
        </script>
        
    </head>
    
    <body onload="cargaInicio()">
        <form name="frmRegistro" method="post">
        <header>Ingreso de Datos</header>
        <h1>Datos Generales</h1>
        <table>
            <tr>
                <td colspan="2"><h5>Nacionalidad*</h5></td>
                <td colspan="2"><input type="text" name="nacionalidad" size="40" value="guatemalteco" disabled></td>
                <td colspan="2" align="center"><h5>CUI* </h5></td>
                <td colspan="2"><input type="text" name="txtCui" size="40" value="" placeholder="CUI" maxlength="13" onkeypress="return validarTecla(event);" id="Cui"></td>
            </tr>
            <tr>
                <td colspan="2"><h5>Nombres* </h5></td>
                <td colspan="2"><input type="text" name="txtNombre1" size="40" value="" placeholder="Primer Nombre" id="Nombre1"></td>
                <td colspan="2"><input type="text" name="txtNombre2" size="40" value="" placeholder="Segundo Nombre"></td>
                <td colspan="2"><input type="text" name="txtNombre3" size="40" value="" placeholder="Tercer Nombre"></td>
            </tr>
            <tr>
                <td colspan="2"><h5>Apellidos* </h5></td>
                <td colspan="2"><input type="text" name="txtApellido1" size="40" value="" placeholder="Primer Apellido" id="Ape1"></td>
                <td colspan="4"><input type="text" name="txtApellido2" size="40" value="" placeholder="Segundo Apellido" id="Ape2"></td>
            </tr>   
            <tr>
                <td colspan="2"><h5>Sexo* </h5></td>
                <td colspan="2">
                    <select name="txtSexo" id="selectSexo">
                        <option disabled="">Seleccione una opción</option>
                    </select>
                </td>
                <td><h5>Fecha de Nacimiento* </h5></td>
                <td><input type="date" name="txtNacimiento" id="feNac"</td>
                <td><h5>Escolaridad* </h5></td>
                <td>
                    <select name="txtEscolaridad" id="selectEsc">
                        <option disabled="">Seleccione una opción</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2"><h5>Departamento Residencia* </h5></td>
                <td colspan="2">
                    <select name="txtDepartamento" class="sel" id="selectDep" onclick="cambioDeOpcion(this.value, 'selectMuni')">
                        <option disabled="">Seleccione una opción</option>
                    </select>
                </td>
                <td colspan="2"><h5>Municipio Residencia* </h5></td>
                <td colspan="2">
                    <select name="txtMunicipio" class="sel" id="selectMuni">
                        <option disabled="">Seleccione una opción</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2"><h5>Dirección de Residencia* </h5></td>
                <td colspan="6"><input type="text" name="txtDireccion" size="100" value="" placeholder="Dirección" id="residencia"></td>
            </tr>
            <tr>
                <td colspan="2"><h5>Pueblo* </h5></td>
                <td colspan="2">
                    <select name="txtPueblo" class="sel" id="selPueblo">
                        <option disabled="">Seleccione una opción</option>
                    </select>
                </td>
                <td colspan="2"><h5>Comunidad Lingüistica* </h5></td>
                <td colspan="2">
                    <select name="txtComunidad" class="sel2" id="selComunidad">
                        <option disabled="">Seleccione una opción</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2"><h5>Correo Electrónico </h5></td>
                <td colspan="2"><input type="txtEmail" name="correo" size="40" value="" placeholder="Correo Electrónico"></td>
                <td colspan="2"><h5>Teléfono Celular* </h5></td>
                <td><input type="text" name="txtCelular" size="16" value="" placeholder="Teléfono Celular" maxlength="8" onkeypress="return validarTecla(event);" id="celular1"></td>
                <td>
                    <select name="txtTelefonia" id="selTelefono">
                        <option disabled="">Seleccione una opción</option>
                    </select>
                </td>
            </tr>
            <tr align="right">
                <td colspan="4"></td>
                <td colspan="2" align="left"><h5>Confirmar Teléfono* </h5></td>
                <td colspan="2"><input type="text" name="txtConfirTelefono" size="40" value="" placeholder="Repetir Teléfono Celular" maxlength="8" onkeypress="return validarTecla(event);" id="celular2"></td>
            </tr>
            <tr>
                <td colspan="2"><h5>Discapacidad* </h5></td>
                <td colspan="2">
                    <select name="txtDiscapacidad" class="sel" id="selDiscapacidad">
                        <option disabled="">Seleccione una opción</option>
                    </select>
                </td>
                <td colspan="2"><h5>Enfermedad Crónica* </h5></td>
                <td colspan="2">
                    <select name="txtEnfermedad" class="sel2" id="selEnfermedad">
                        <option disabled="">Seleccione una opción</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2"><h5>¿Tiene afiliación de IGSS?* </h5></td>
                <td colspan="6">
                    <label>
                        <input id="radioSi" type="radio" name="radioSi-No" value="Y">Si 
                    </label>
                    <label>
                        <input id="radioNo" type="radio" name="radioSi-No" value="N">No 
                    </label>
                </td>
            </tr>
            <tr>
                <td colspan="8"><h2>Puesto de Vacunación</h2></td>
            </tr>
            <tr>
                <td colspan="2"><h5>Departamento* </h5></td>
                <td colspan="2">
                    <select class="sel" id="selDepVac" onclick="cambioDeOpcion(this.value, 'selMunVac')">
                        <option disabled="">Seleccione una opción</option>
                    </select>
                </td>
                <td colspan="2"><h5>Municipio* </h5></td>
                <td colspan="2">
                    <select class="sel2" id="selMunVac" onclick="cambioPuesto(this.value)">
                        <option disabled="">Seleccione una opción</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2"><h5>Puesto de Vacunación* </h5></td>
                <td colspan="6">
                    <select class="sel" id="selPuestoVac">
                        <option disabled="">Seleccione una opción</option>
                    </select>
                </td>
            </tr>
        </table>
        <input  id="btn" type="button" name="btnIngresar" value="Ingresar Datos" onclick="validarSubmit()">
        </form>
    </body>
</html>
