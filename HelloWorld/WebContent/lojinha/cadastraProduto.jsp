<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" 
    import="java.sql.*"
    import="java.util.*"
    import="java.text.*"
    import="db.*"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastra Produto</title>
</head>
<body>
<p>Cadastro de produtos:</p>
<form action="cadastraProduto.jsp" method="GET">
<a>Nome</a><input type="text" name="nome"/>
<a>Valor</a><input type="text" name="valor"/>
<input type="submit" value="Cadastrar"/>
<% 
	String nome = request.getParameter("nome");
	String valor = request.getParameter("valor");
		
	if((nome!=null)&&(valor!=null)){
		String sql = "SELECT codigo FROM produtos WHERE nome=\""+nome+'"';
		
		Conectar.open();
		
		ResultSet records = Conectar.executeQuery(sql);
		
		if(records.next()){
			Conectar.executeUpdate(Double.valueOf(records.getString("codigo")).intValue(), nome, Double.valueOf(valor));
		}else{
			Conectar.executeInsert(nome,Double.valueOf(valor));			
		}		
		
		Conectar.close();
	}
%>
</form>
<p/>
<jsp:include page="relatorioDB.jsp"></jsp:include>
</body>
</html>