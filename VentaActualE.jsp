<%-- 
    Document   : VentaActualE
    Created on : Dec 14, 2021, 6:07:53 PM
    Author     : 52556
--%>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="javax.servlet.ServletException" %>
<%@ page import="javax.servlet.annotation.WebServlet" %>
<%@ page import="javax.servlet.http.HttpServlet" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="javax.servlet.http.HttpSession" %>
    


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="stylescafe.css" />
        <title>Cafetería</title>
    </head>
    <body>
            <h1>Carrito con la venta actual</h1>
        <div class="container2">
                <a href="http://localhost:8085/CarritoCompras/finsession.jsp">Terminar con la venta</a>
                <a href="http://localhost:8085/CarritoCompras">Seguir comprando</a>
        </div>
       <div class="mcontainer">
        <div class="container3"> 
        <%
            ArrayList<String> nombreslocal= new ArrayList<String>();
            String nombres= new String();
            String costo= new String();
            double totalcosto=0;
            
            HttpSession sesion= request.getSession(true);
            //Datos de la sesion
            String idSesion=sesion.getId();
            out.println("<h3>Id de la sesión: "+idSesion+"</h3>");
            
            Enumeration nombresParams= request.getParameterNames();
            while(nombresParams.hasMoreElements())
            {
		String param=(String)nombresParams.nextElement();
		String valor= request.getParameter(param);
                if(param.equals("nombre")){
                    nombres=valor;
                     //out.println("<h3>Nombre del producto: "+nombres+"</h3>");
                }else if(param.equals("precio")){
                    costo=valor;
                     //out.println("<h3>Precio del producto: "+valor+"</h3>");
                }
            }
            if(nombres.equals("")){
                ArrayList<String> articulos2=(ArrayList<String>)sesion.getAttribute("articulos");
                if(articulos2==null){
                    out.println("<h3>Aún no hay un producto en la venta</h3>");
                }else{ 
                    out.println("<h3>Estos son los productos en la venta</h3>");
                    out.println("<ol>");
                    for (int i = 0; i < articulos2.size(); i++) {
                       if(i==0 || i%2==0){
                        out.println("<li>"+articulos2.get(i)+": "+articulos2.get(i+1)+"</li>");
                        totalcosto=totalcosto+Double.parseDouble(articulos2.get(i+1));
                       }
                    }
                    out.println("</ol>");
                
                    out.println("<h2> Total a pagar: "+String.valueOf(totalcosto)+" pesos</h2>:");
                }
            }else{
                ArrayList<String> articulos2=(ArrayList<String>)sesion.getAttribute("articulos");
                if(articulos2==null){
                     nombreslocal.add(nombres);
                     nombreslocal.add(costo);
                     sesion.setAttribute("articulos",nombreslocal);
                }else{
                     nombreslocal=articulos2;
                    nombreslocal.add(nombres);
                    nombreslocal.add(costo);
                    sesion.setAttribute("articulos",nombreslocal);
                 }
                    out.println("<h3>Estos son los productos en la venta:</h3>");
                    out.println("<ol>");
                    for (int i = 0; i < nombreslocal.size(); i++) {
                        if(i==0 || i%2==0){
                            out.println("<li>"+nombreslocal.get(i)+": "+nombreslocal.get(i+1)+"</li>");
                            totalcosto=totalcosto+Double.parseDouble(nombreslocal.get(i+1));
                        }
                    }
                    out.println("</ol>");
                
                out.println("<h2>Total a pagar: "+String.valueOf(totalcosto)+" pesos</h2>:");
            }       
        %>
        </div>
       </div>
    </body>
</html>
