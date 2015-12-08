<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<p>Hello, você está em <%=request.getServerName() %> </p>
<%
	java.util.Date date = new java.util.Date();
	out.println("Hoje é " + String.valueOf(date));
%>
<p>Exemplos</p>
<p></p><a href="gravaAttributo.jsp">Tom Jobim - Exemplo de Variavel de Sessão</a><br/>
<a href="calculaFatorial.jsp?numero=4.3">Fatorial - Chamada de Classe Java</a><br/>
<a href="cadastroAluno.jsp">Cadastro Aluno - Recepção de Variaveis</a><br/>
<a href="noCache.jsp">No Cache</a></br>
<a href="sessionTime.jsp">Configurar tempo de sessão</a>
<a href="relatorioProdutos.jsp">Lojinha - Conexão com banco</a>

<% 	response.setHeader("Expires","00/00/0000");
	response.setHeader("Pragma","no-cache");
	if(request.getProtocol().equals("HTTP/1.1")){
		response.setHeader("Cache-Control","no-cache");
	}
%>
</body>
</html>