<%@page import="clases.SelectBD"%>
<%@page import="clases.SelectBean"%>
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
        %>
        
        <script>
            
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
                        }
                        x++;
                <%
                        i++;
                    }while(i < 23);
                %>
             }
             
             //Cambio de los puestos de vacunación según el departamento y municipio seleccionados
             function cambioPuesto(puesto){
                 var p = 1;
                 <%
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
                 %>
             }
             
        </script>
        
    </head>
    
    <body onload="cargaInicio()">
        <form name="frmRegistro">
        <header>Ingreso de Datos</header>
        <h1>Datos Generales</h1>
        <table>
            <tr>
                <td colspan="2"><h5>Nacionalidad*</h5></td>
                <td colspan="2"><input type="text" name="nacionalidad" size="40" value="guatemalteco" disabled></td>
                <td colspan="2" align="center"><h5>CUI* </h5></td>
                <td colspan="2"><input type="text" name="cui" size="40" value="" placeholder="CUI" maxlength="13"></td>
            </tr>
            <tr>
                <td colspan="2"><h5>Nombres* </h5></td>
                <td colspan="2"><input type="text" name="primerNombre" size="40" value="" placeholder="Primer Nombre"></td>
                <td colspan="2"><input type="text" name="segundoNombre" size="40" value="" placeholder="Segundo Nombre"></td>
                <td colspan="2"><input type="text" name="tercerNombre" size="40" value="" placeholder="Tercer Nombre"></td>
            </tr>
            <tr>
                <td colspan="2"><h5>Apellidos* </h5></td>
                <td colspan="2"><input type="text" name="primerApellido" size="40" value="" placeholder="Primer Apellido"></td>
                <td colspan="4"><input type="text" name="segundoApellido" size="40" value="" placeholder="Segundo Apellido"></td>
            </tr>   
            <tr>
                <td colspan="2"><h5>Sexo* </h5></td>
                <td colspan="2">
                    <select name="sexo" id="selectSexo">
                        <option disabled="">Seleccione una opción</option>
                    </select>
                </td>
                <td><h5>Fecha de Nacimiento* </h5></td>
                <td><input type="date" name="nacimiento"></td>
                <td><h5>Escolaridad* </h5></td>
                <td>
                    <select name="escolaridad" id="selectEsc">
                        <option disabled="">Seleccione una opción</option>
                    </select>
                </td>
            </tr>
            <tr>
                <!-- |---------Pendiente de especificar las conbinaciones----------| -->
                <td colspan="2"><h5>Departamento Residencia* </h5></td>
                <td colspan="2">
                    <select name="departamento" class="sel" id="selectDep" onclick="cambioDeOpcion(this.value, 'selectMuni')">
                        <option disabled="">Seleccione una opción</option>
                    </select>
                </td>
                <td colspan="2"><h5>Municipio Residencia* </h5></td>
                <td colspan="2">
                    <select name="municipio" class="sel" id="selectMuni">
                        <option disabled="">Seleccione una opción</option>
                    </select>
                </td>
                <!-- |-------------------------------------------------------------| -->
            </tr>
            <tr>
                <td colspan="2"><h5>Dirección de Residencia* </h5></td>
                <td colspan="6"><input type="text" name="direccionResidencia" size="100" value="" placeholder="Dirección"></td>
            </tr>
            <tr>
                <td colspan="2"><h5>Pueblo* </h5></td>
                <td colspan="2">
                    <select name="pueblo" class="sel" id="selPueblo">
                        <option disabled="">Seleccione una opción</option>
                    </select>
                </td>
                <td colspan="2"><h5>Comunidad Lingüistica* </h5></td>
                <td colspan="2">
                    <select name="comLinguistica" class="sel2" id="selComunidad">
                        <option disabled="">Seleccione una opción</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2"><h5>Correo Electrónico </h5></td>
                <td colspan="2"><input type="text" name="correo" size="40" value="" placeholder="Correo Electrónico"></td>
                <td colspan="2"><h5>Teléfono Celular* </h5></td>
                <td><input type="text" name="celular" size="16" value="" placeholder="Teléfono Celular" maxlength="8"></td>
                <td>
                    <select name="compCelular" id="selTelefono">
                        <option disabled="">Seleccione una opción</option>
                    </select>
                </td>
            </tr>
            <tr align="right">
                <td colspan="4"></td>
                <td colspan="2" align="left"><h5>Confirmar Teléfono* </h5></td>
                <td colspan="2"><input type="text" name="confirTelefono" size="40" value="" placeholder="Repetir Teléfono Celular" maxlength="8"></td>
            </tr>
            <tr>
                <td colspan="2"><h5>Discapacidad* </h5></td>
                <td colspan="2">
                    <select name="discapacidad" class="sel" id="selDiscapacidad">
                        <option disabled="">Seleccione una opción</option>
                    </select>
                </td>
                <td colspan="2"><h5>Enfermedad Crónica* </h5></td>
                <td colspan="2">
                    <select name="enfermedad" class="sel2" id="selEnfermedad">
                        <option disabled="">Seleccione una opción</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2"><h5>¿Tiene afiliación de IGSS?* </h5></td>
                <td colspan="6">
                    <label>
                        <input id="radioSi" type="radio" name="radioSi-No">Si 
                    </label>
                    <label>
                        <input id="radioNo" type="radio" name="radioSi-No">No 
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
        <input  id="btn" type="button" name="btnIngresar" value="Ingresar Datos">
        </form>
    </body>
</html>
