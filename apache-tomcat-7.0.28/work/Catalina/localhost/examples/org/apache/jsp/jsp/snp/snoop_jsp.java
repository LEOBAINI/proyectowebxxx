/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.28
 * Generated at: 2012-08-10 01:59:18 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.jsp.snp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class snoop_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<body bgcolor=\"white\">\r\n");
      out.write("<h1> Request Information </h1>\r\n");
      out.write("<font size=\"4\">\r\n");
      out.write("JSP Request Method: ");
      out.print( util.HTMLFilter.filter(request.getMethod()) );
      out.write("\r\n");
      out.write("<br>\r\n");
      out.write("Request URI: ");
      out.print( util.HTMLFilter.filter(request.getRequestURI()) );
      out.write("\r\n");
      out.write("<br>\r\n");
      out.write("Request Protocol: ");
      out.print( util.HTMLFilter.filter(request.getProtocol()) );
      out.write("\r\n");
      out.write("<br>\r\n");
      out.write("Servlet path: ");
      out.print( util.HTMLFilter.filter(request.getServletPath()) );
      out.write("\r\n");
      out.write("<br>\r\n");
      out.write("Path info: ");
      out.print( util.HTMLFilter.filter(request.getPathInfo()) );
      out.write("\r\n");
      out.write("<br>\r\n");
      out.write("Query string: ");
      out.print( util.HTMLFilter.filter(request.getQueryString()) );
      out.write("\r\n");
      out.write("<br>\r\n");
      out.write("Content length: ");
      out.print( request.getContentLength() );
      out.write("\r\n");
      out.write("<br>\r\n");
      out.write("Content type: ");
      out.print( util.HTMLFilter.filter(request.getContentType()) );
      out.write("\r\n");
      out.write("<br>\r\n");
      out.write("Server name: ");
      out.print( util.HTMLFilter.filter(request.getServerName()) );
      out.write("\r\n");
      out.write("<br>\r\n");
      out.write("Server port: ");
      out.print( request.getServerPort() );
      out.write("\r\n");
      out.write("<br>\r\n");
      out.write("Remote user: ");
      out.print( util.HTMLFilter.filter(request.getRemoteUser()) );
      out.write("\r\n");
      out.write("<br>\r\n");
      out.write("Remote address: ");
      out.print( util.HTMLFilter.filter(request.getRemoteAddr()) );
      out.write("\r\n");
      out.write("<br>\r\n");
      out.write("Remote host: ");
      out.print( util.HTMLFilter.filter(request.getRemoteHost()) );
      out.write("\r\n");
      out.write("<br>\r\n");
      out.write("Authorization scheme: ");
      out.print( util.HTMLFilter.filter(request.getAuthType()) );
      out.write("\r\n");
      out.write("<br>\r\n");
      out.write("Locale: ");
      out.print( request.getLocale() );
      out.write("\r\n");
      out.write("<hr>\r\n");
      out.write("The browser you are using is\r\n");
      out.print( util.HTMLFilter.filter(request.getHeader("User-Agent")) );
      out.write("\r\n");
      out.write("<hr>\r\n");
      out.write("</font>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
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
