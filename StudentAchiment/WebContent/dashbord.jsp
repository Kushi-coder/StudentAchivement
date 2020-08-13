<!DOCTYPE html>
<html lang="en">
<%@ page import="java.sql.*"%>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" media="screen" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap.min.css">

	<title>Your Own Admin</title>
	<style><%@include file="/dashbord.css"%></style>
	

	<link rel="stylesheet" href="css/adminStyle.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Exo+2" rel="stylesheet">


</head>

<body>

<!--	navbar starts here-->
    
    <nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="dashbord.jsp">Admin dashboard</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#"><i class="fa fa-tachometer" aria-hidden="true"></i> Dashboard <span class="sr-only">(current)</span></a></li>
        
        <li><a href="#"><i class="fa fa-users" aria-hidden="true"></i>
 Profile</a></li>
        <li><a href="#"><i class="fa fa-question-circle" aria-hidden="true"></i>
 About us</a></li>
        
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
        <li><a href="insertdata.jsp"><i class="fa fa-user-plus" aria-hidden="true"></i>
 Add Users</a></li>
        <li><a href="#"><i class="fa fa-sign-out" aria-hidden="true"></i>

 Logout</a></li>
        
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav><br>
    
<!--    navbar ends here-->
   
   <div class="container-fluid">
       <div class="row">
           <div class="col-sm-3 col-md-2 sidebar">
               <ul class="nav nav-sidebar">
                   <li class="active"><a href="dashbord.jsp"><i class="fa fa-tachometer" aria-hidden="true"></i> Dashboard</a></li>
                   <li><a href="insertdata.jsp"><i class="fa fa-user-plus" aria-hidden="true"></i> Insert Data</a></li>
                   <li><a href="aboutus.jsp"><i class="fa fa-users" aria-hidden="true"></i>About us</a></li>
                   <li><a href="login.jsp"><i class="fa fa-sign-out" aria-hidden="true"></i>Logout</a></li>
               </ul>
               
           </div>
           <div><br><br>
<form action="" method="get" >
  <div class="input-group">
    <input type="text" class="form-control" placeholder="Search" name="q">
    <div class="input-group-btn">
      <button class="btn btn-primary" id="sbtn"type="submit">
        <i class="glyphicon glyphicon-search"></i>
      </button>
    </div>
  </div>
</form>
</div><br>
           
           <div class="col-sm-9 col-md-10 main">
              
          
          <h2 class="sub-header"><i class="fa fa-file-text" aria-hidden="true"></i> Detailed Report</h2>
          <hr>
          <div class="col-md-12">
	<div class="panel-body">
	<table id="tb1-student" class="table table-responsive table-bordered">
	<thead>
	<tr>
		<th>First Name</th>
		<th>Last Name</th>
		<th>Address</th>
		<th>Pno</th>
		<th>E-mail</th>
		<th>Passout Year</th>
		<th>Present Company</th>
		<th>Designation</th>
		<th>Edit</th>
		<th>Delete</th>
		
		
		</tr>
		<% 
		 	String url="jdbc:mysql://localhost:3306/studentdb";
			String dbname="root";
			String dbpass="root";
			ResultSet rs;
			String query="select * from studentdb.records";
			    Class.forName("com.mysql.jdbc.Driver").newInstance(); ;
			   Connection con=DriverManager.getConnection(url,dbname,dbpass);
			   Statement sta=con.createStatement();
			   String squery=request.getParameter("q");
			   if(squery!=null)
			   {
				     query="select * from studentdb.records where fname like '%"+squery+"%' ";
			   }
			   else{
				   query="select * from studentdb.records";
				   
			   }
			   
			   
			   rs=sta.executeQuery(query);
			   while(rs.next())
			   {
				   int id=rs.getInt("id");
				   
		%>
		
		
		
		
		
		
		
		
		<tr>
		
		<td><%=rs.getString("fname") %></td>
		<td><%=rs.getString("lname") %></td>
		<td><%=rs.getString("address") %></td>
		<td><%=rs.getString("pno") %></td>
		<td><%=rs.getString("email") %></td>
		<td><%=rs.getString("pout") %></td>
		<td><%=rs.getString("pcom") %></td>
		<td><%=rs.getString("des") %></td>
		<td><a href="update.jsp?id=<%=id%>" class="btn1 btn--pill btn--orange btn-lg">Edit</a></td>
		<td><a href="delete.jsp?id=<%=id%>" class="btn1 btn--pill btn--red btn-lg ">Delete</a></td>
		
		
		</tr>
		<%
			   }
		
		%>
		
		
	</table>
	</div>
	</div>
    

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/js/bootstrap.min.js"></script>

	<script>
	</script>

</body>

</html>
