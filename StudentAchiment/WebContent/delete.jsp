<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>

<%

	String id=request.getParameter("id");
	
	
	
	Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		

		String url="jdbc:mysql://localhost:3306/studentdb";
		String dbname="root";
		String dbpass="root";
		con=DriverManager.getConnection(url,dbname,dbpass);
		pst=con.prepareStatement("delete  from studentdb.records where id=?");
		
		pst.setString(1, id);
		pst.executeUpdate();
		System.out.println("deleted added");
		
		%>
		<script>
		
		alert("Recourd deleted");
		</script>

	

