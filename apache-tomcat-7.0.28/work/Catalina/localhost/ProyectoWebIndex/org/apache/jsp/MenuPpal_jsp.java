/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.28
 * Generated at: 2012-08-21 20:38:31 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import seguridad.Validacion;
import Base.metodosSql;
import java.sql.*;

public final class MenuPpal_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\r\n");
      out.write("<title>MenuPpal</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body bgcolor=\"#E6E6E6\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<input type=\"hidden\" value=\"no\" name=\"filtrar\">\r\n");
      out.write("\t");

	//setHeader("Refresh", "5; URL=http://host/path")
	
	
	
	metodosSql metodos = new metodosSql();
	
      out.write('\r');
      out.write('\n');
      out.write('	');
if(request.getParameter("usuario")!=null && request.getParameter("contrasenia")!=null){
		
		String usuario = request.getParameter("usuario");	
		String contrasenia = request.getParameter("contrasenia");
	
	
	    
	    session.setAttribute("usuario", usuario);
		session.setAttribute("contrasenia", contrasenia);
		}
	
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t");
out.print("Mostrando usuario de sesion "+session.getAttribute("usuario")+"<br><br>");//usuario
      out.write('\r');
      out.write('\n');
      out.write('	');
//contrasenia
      out.write('\r');
      out.write('\n');
      out.write('	');

	boolean esAdministrador=false;
	
	session.setAttribute("filtrar", "no");
		Validacion val = new Validacion();
		String permisoDeUser = val.validarUsuario(session.getAttribute("usuario").toString(), session.getAttribute("contrasenia").toString());
		//session.setAttribute("usuario", usuario);
		
		if (permisoDeUser != null) {
			if (permisoDeUser.equals("administrador")){
			
				session.setAttribute("esAdministrador",true);
				
				

				//response.sendRedirect("IngresoConsulta.jsp");
			
			}
			if(permisoDeUser.equals("usuario")) {
				
				session.setAttribute("esAdministrador",false);
				
				//response.sendRedirect("IngresoConsulta.jsp");	
		
		
			}
		}
		else {
			response.sendRedirect("loginError.jsp");//si no tiene permisos suficientes, error!
		}
		//out.println(permisoDeUser);
		//response.setHeader("Refresh", "1");
	
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<a href=\"CargaDiaria.jsp\">Cargar Datos</a><br><br>\r\n");
      out.write("<a href=\"Tabla.jsp\">Ver Datos sin filtro (solo de su perfil si es usuario)</a><br><br>\r\n");
      out.write("<a href=\"FiltroConsulta.jsp\">Ver Datos con filtro (solo de su perfil si es usuario)</a><br><br>\r\n");
      out.write("<a href=\"QueMesCierra.jsp\">Cerrar mes</a>\r\n");
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