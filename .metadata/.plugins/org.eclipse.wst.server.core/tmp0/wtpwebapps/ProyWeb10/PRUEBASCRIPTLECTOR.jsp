<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="" name="formu" id="formu">
<input type="text" name="sobr" id="sobr">

<%String prueba="variable java"; 
String horas="12";
String max ="9.9";%>
<SCRIPT>
 function compruebaExcesoDeHoras( hs, maxhs){
	
	 if(parseFloat(hs) >= parseFloat(maxhs)){
		 if(confirm("ha excedido el l�mite de "+maxhs+" horas diarias, confirma?")){
			 alert("Confirm� con "+hs+" horas "+"y max "+maxhs);
		 }else{
			 alert("No confirm�");
			 
		 }
		 
	 }else{
		 alert("Datos enviados con "+hs+" horas "+"y max "+maxhs);
	 }
	 
 }
 </SCRIPT>

<script>
function pepe(){
	
	
alert(document.formu.sobr.value);
}</script>
<script type="text/javascript">
function saluda(){
var pepe=document.formu.sobr.value;
	<!--'<%=prueba%>';-->
prompt('Saluda',pepe);
}

</script>
<script type="text/javascript">
function confirmaJava(){
	<%String hola=null;%>
	
	if(confirm("seguro?")){
		<%hola="hola";%>
		
	}else{
		<%hola="Chau";%>
		
	}
	
	alert('<%=hola%>');
	
}</script>
<!-- compruebaExcesoDeHoras("<%=horas%>","<%=max%>") -->
<input type="button" onclick='confirmaJava()'> 



</form>

</body>
</html>