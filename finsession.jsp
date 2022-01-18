<%-- 
    Document   : finsession
    Created on : Dec 14, 2021, 7:14:53 PM
    Author     : 52556
--%>

<%@ page import="java.util.ArrayList" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="stylescafe.css" />
        <title>Venta Terminada</title>
    </head>
    <body>
        <h1>Venta Terminada!</h1>
       <div class="mcontainer">
        <div class="container3">
        <%
            HttpSession sesion= request.getSession(true);
            double totalcosto2=0;
            ArrayList<String> articulos2=(ArrayList<String>)sesion.getAttribute("articulos");
            
                for (int i = 0; i < articulos2.size(); i++) {
                    if(i==0 || i%2==0){
                         totalcosto2=totalcosto2+Double.parseDouble(articulos2.get(i+1));
                    }
                }
                
            out.println("<h2>El total a cobrar fue de: "+String.valueOf(totalcosto2)+"</h2>:");
            session.invalidate();
        %>
        </div>
       </div>
        <div class="container2">
        <a href="http://localhost:8085/CarritoCompras">Regresar a la página principal</a>
        </div>
    </body>
</html>
