<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>cajas de texto y javascript - ejemplo 21</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<SCRIPT language=JavaScript>

<!-- Begin
function validateZIP(field) {
var valid = "0123456789-";
var hyphencount = 0;

if (field.length!=5 && field.length!=10) {
alert("Por favor, entre un codigo de 5 digitos");
return false;
}
for (var i=0; i < field.length; i++) {
temp = "" + field.substring(i, i+1);
if (temp == "-") hyphencount++;
if (valid.indexOf(temp) == "-1") {
alert("Codigo Postal no valido.  Por favor, entrelo otra vez.");
return false;
}
if ((hyphencount > 1) || ((field.length==10) && ""+field.charAt(5)!="-")) {
alert("The hyphen character should be used with a properly formatted 5 digit+four zip code, like '12345-6789'.   Please try again.");
return false;
   }
}
alert('Codigo Postal correcto');
}
//  End -->
</SCRIPT>

<BODY >
<a>a ver que hay aca</a>
<P align=center>Valida c&oacute;digo postal</P>
<CENTER>
<FORM name=zip onsubmit="return validateZIP(this.zip.value);">
C&oacute;digo Postal: <INPUT type="text" size=8 name=zip> 
<INPUT type=submit value=enviar> 
</FORM>
</CENTER>
</BODY>
</HTML>
