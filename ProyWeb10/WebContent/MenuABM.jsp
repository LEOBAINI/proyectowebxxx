<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Menu de ABM</title>
<link rel="stylesheet" type="text/css" href="style/style.css" /><!-- Para cambiar tema desde un solo archivo -->
<%!String estado; 


%>
<%


session.setAttribute("permiso", "administrador");//borrar esta linea para asegurar seguridad 
session.setAttribute("usuario", "jorge");
session.setAttribute("contrasenia", "jorge");%>







<script type="text/javascript">

function dirige(){
	
elijaAbm();

var indice = document.forms.menuABM.objetos.selectedIndex;


var valor = document.forms.menuABM.objetos[indice].value; 



if(valor=="cliente"){
	document.forms.menuABM.action="AbmCliente.jsp";
	
} if(valor=="tarea"){
	document.forms.menuABM.action="AbmTarea.jsp";
	
} if(valor=="subtarea"){
	document.forms.menuABM.action="AbmSubTarea.jsp";

} if(valor=="departamento"){
	document.forms.menuABM.action="AbmDepto.jsp";
	
} if(valor=="usuario"){
	document.forms.menuABM.action="AbmUsuario.jsp";
}
}


function elijaAbm(){
	if(getRadioButtonSelectedValue(document.forms.menuABM.abm)=="Alta"){
		return "Alta";
	}
	if(getRadioButtonSelectedValue(document.forms.menuABM.abm)=="Baja"){
		return "Baja";
	}
	if(getRadioButtonSelectedValue(document.forms.menuABM.abm)=="Modificacion"){
		return "Modificacion";
	}
}
function getRadioButtonSelectedValue(ctrl)
{
    for(var i=0;i<ctrl.length;i++)
        if(ctrl[i].checked) return ctrl[i].value;
}

</script>
</head>
<body  title="Aqu� puede crear,modificar y eliminar los objetos disponibles en la pesta�a desplegable" bgcolor="#E6E6E6">




<h2 align="center"><u>Aqu� puede crear,modificar y eliminar los objetos disponibles en la pesta�a desplegable</u></h2><br>
 
                          
<br><br>



 <form name="menuABM"  method="post">
 
 <input name="abm" value="Alta" type="radio">Alta<br> 

 <input name="abm" value="Baja" type="radio">Baja<br>
 
 <input name="abm" value="Modificacion" type="radio">Modificacion<br>
 
 <div align="left"><a>Elija el objeto en cuesti�n</a> <br> <br>  <select
			name="objetos">
			<option value="cliente">Cliente</option>
			<option value="departamento">Departamento</option>
			<option value="subtarea">Subtarea</option>
			<option value="tarea">Tarea</option>
			<option value="usuario">Usuario</option>
			

		</select></div>

		
		 <br><input type="submit" onclick="dirige()"/>
	</form>
<br>
<a href="MenuPpal.jsp" >Volver a menu principal</a>
</body>
</html>






