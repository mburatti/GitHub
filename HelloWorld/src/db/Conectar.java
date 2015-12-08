package db;
import java.sql.*;

public class Conectar {
	private static Connection con;
	private static Statement stm;
	private static String db="jdbc:mysql://localhost:3306/lojinha";
	private static String driver="com.mysql.jdbc.Driver";
	private static String usuario="mburatti";
	private static String senha="mburatti";
	
	/* Creates Connection */
	public static void open() throws Exception {
		Class.forName(driver);
		con=DriverManager.getConnection(db,usuario,senha);
		stm=con.createStatement();
	}
	
	/* Closes Conection */
	public static void close() throws Exception {
		if(closed()==false){
			stm.close();
			con.close();
		}	
	}
	
	/* Test if connection is closed */
	public static boolean closed() throws Exception {
		return((stm==null)&&(con==null));
	}
	
	/* Returns a ResultSet from a give SQL query */
	public static ResultSet executeQuery(String sql) throws Exception {
		if(closed()) 
			open();
		
		return(stm.executeQuery(sql));		
	}
	
	/* Set and Get methods */
	public static void setDB(String v){db=v;}
	public static String getDB(){return(db);}
	
	/* Insert Produtos */
	public static void executeInsert(String nome, double valor) throws Exception {
		String comando = "INSERT INTO produtos (nome, valor) values(\""+nome+"\","+valor+")";
		executeMe(comando);
	}
	
	/* Update Produto */
	public static void executeUpdate(int codigo, String nome, double valor) throws Exception {
		String comando = "UPDATE produtos SET nome=\""+nome+"\",valor="+valor+" WHERE codigo="+codigo;
		executeMe(comando);
	}
	
	/* Disable product */
	public static void executeDelete(int codigo) throws Exception {
		String comando = "UPDATE produtos SET ativo=0 WHERE codigo="+codigo;
		executeMe(comando);
	}
	
	public static ResultSet listarProdutos() throws Exception {
		String comando = "SELECT * FROM produtos WHERE ativo=1";
		return(executeQuery(comando));
	}
	
	/* Execute Statement */
	public static void executeMe(String comando) throws Exception {
		if(closed())
			open();		
		stm.execute(comando);		
	}
}