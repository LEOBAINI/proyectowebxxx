/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.28
 * Generated at: 2012-12-30 08:50:24 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import Base.metodosSql;
import java.util.ArrayList;

public final class QueMesAbre_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\r\n");
      out.write("<title>Abrir mes</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body bgcolor=\"#E6E6E6\">\r\n");
      out.write("\r\n");
      out.write("\t");

		String usuario=null;
			if(session.getAttribute("usuario")!=null){
			usuario=session.getAttribute("usuario").toString();
			out.println("Usuario: "+usuario);
			
			}else{
		out.println("No hay sesion iniciada<br>");
		response.sendRedirect("index.jsp");
	
      out.write("<a href=\"index.jsp\">Iniciar sesion </a>\r\n");
      out.write("\t");

		}
	
      out.write("\r\n");
      out.write("\t<form action=\"AbrirMes.jsp\" method=\"post\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t");

			
				String usuarioActualizado=request.getParameter("user");
				String mes=request.getParameter("month");
				String anio=request.getParameter("year");
			metodosSql metodos=new metodosSql();
			
			ArrayList<String> usuarios=new ArrayList<String>();
			usuarios=metodos.consultarUnaColumna("select usuario from userlogin");
			
			
			
	String estado=request.getParameter("status");
	
	System.out.println(estado);
	
	if(estado!=null){
		
	if(estado.equals("1")){
		
      out.write("\r\n");
      out.write("\t\t\t<script>\r\n");
      out.write("\t\t\talert('Los datos se cargaron correctamente.')\r\n");
      out.write("\t\t  </script>\r\n");
      out.write("\t\t  ");

	}else{
		
      out.write("\r\n");
      out.write("\t\t<script>\r\n");
      out.write("\t\talert('Hubo un problema al cargar los datos.')\r\n");
      out.write("\t  </script>\r\n");
      out.write("\t  ");

		
	}
	
	}
	
	
      out.write("\r\n");
      out.write("\t\t<a>Elija el mes que va a abrir</a> <br> <br> <a>MES</a> <select\r\n");
      out.write("\t\t\tname=\"meses\">\r\n");
      out.write("\t\t\t<option value=\"1\">ENERO</option>\r\n");
      out.write("\t\t\t<option value=\"2\">FEBRERO</option>\r\n");
      out.write("\t\t\t<option value=\"3\">MARZO</option>\r\n");
      out.write("\t\t\t<option value=\"4\">ABRIL</option>\r\n");
      out.write("\t\t\t<option value=\"5\">MAYO</option>\r\n");
      out.write("\t\t\t<option value=\"6\">JUNIO</option>\r\n");
      out.write("\t\t\t<option value=\"7\">JULIO</option>\r\n");
      out.write("\t\t\t<option value=\"8\">AGOSTO</option>\r\n");
      out.write("\t\t\t<option value=\"9\">SEPTIEMBRE</option>\r\n");
      out.write("\t\t\t<option value=\"10\">OCTUBRE</option>\r\n");
      out.write("\t\t\t<option value=\"11\">NOVIEMBRE</option>\r\n");
      out.write("\t\t\t<option value=\"12\">DICIEMBRE</option>\r\n");
      out.write("\r\n");
      out.write("\t\t</select> <a>AÑO</a> <input type=\"text\" name=\"anio\"\tvalue=");
      out.print(metodos.dameAnio());
      out.write(">\r\n");
      out.write("\r\n");
      out.write("\t\t");

			out.println("USUARIOS");

			out.println(" <select name=" + " usuarios " + ">");

			for (int i = 0; i < usuarios.size(); i++)

				out.println(" <option value=" + usuarios.get(i) + ">"
						+ usuarios.get(i) + "</option>");

			out.println("</select>");
			out.println("<br>");
		
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t<input type=\"submit\" value=\"Aceptar\" />\r\n");
      out.write("\t</form>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t<br>\r\n");
      out.write("\t<br>\r\n");
      out.write("\t<a href=\"MenuPpal.jsp\">Volver a menu</a>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else log(t.getMessage(), t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
