<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" 
    import="java.sql.*"
    import="java.util.*"
    import="java.text.*"
    import="db.*"
%>
<%	
	Conectar.open();
	ResultSet records = Conectar.listarProdutos();	

	out.println("<table border=1><tr><th>Código</th><th>Nome</th><th>Valor</th></tr></tr>");
	
	while(records.next()){
		out.println("<tr><td>"+records.getString("codigo")+"</td><td>"+records.getString("nome")+"</td><td>"+records.getString("valor")+"</td></tr>");
	}		
	out.println("</table>");
	Conectar.close(); 
%>
