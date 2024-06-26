
<%@ page import="DBconnetion.DBconnection"%>
<%@ page import="jakarta.servlet.RequestDispatcher"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!-- Boxicons -->
	<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
	<!-- My CSS -->
	<link rel="stylesheet" href="adminstyle.css">

	<title>AdminHub</title>
</head>
<body>


	<!-- SIDEBAR -->
	<section id="sidebar">
		<a href="adminorders.jsp" class="brand">
			<i class='bx bxs-smile'></i>
			<span class="text">GearUp</span>
		</a>
		<ul class="side-menu top">
			<li class="active">
				<a href="adminorders.jsp">
					<i class='bx bxs-dashboard' ></i>
					<span class="text">Dashboard</span>
				</a>
			</li>
			
			<li>
				<a href="admin.inventory.jsp">
					<i class='bx bxs-doughnut-chart' ></i>
					<span class="text">Our Stocks</span>
				</a>
			</li>
			<li>
				<a href="#">
					<i class='bx bxs-message-dots' ></i>
					<span class="text">Message</span>
				</a>
			</li>
			<li>
				<a href="admincustomer.jsp">
					<i class='bx bxs-group' ></i>
					<span class="text">Users</span>
				</a>
			</li>
		</ul>
		
	</section>
	<!-- SIDEBAR -->



	<!-- CONTENT -->
	<section id="content">
		<!-- NAVBAR -->
		
		<!-- NAVBAR -->

		<!-- MAIN -->
		<main>
			<div class="head-title">
				<div class="left">
					<h1>Dashboard</h1>
					<ul class="breadcrumb">
						<li>
							<a href="#">Dashboard</a>
						</li>
						<li><i class='bx bx-chevron-right' ></i></li>
						<li>
							<a class="active" href="#">Home</a>
						</li>
					</ul>
				</div>
				<a href="admin.addinventory.jsp" class="btn-download">
					<i class='bx bxs-cloud-download' ></i>
					<span class="text">Add Stocks</span>
				</a>
			</div>

			<ul class="box-info">
			


			<div class="table-data">
				<div class="order">
					<div class="head">
						<h3>Recent Orders</h3>
						<i class='bx bx-search' ></i>
						<i class='bx bx-filter' ></i>
					</div>
					<table>
						<thead>
							<tr>
								<th>OrderID</th>
								<th>Itemname</th>
								<th>Total</th>
								<th>Order Date</th>
								<th>ItemID</th>
								<th>quantity</th>
								<th>CudID</th>
								<th>cancel</th>
							</tr>
						</thead>
						
						
						
								<%



 int x=0;


try {

	DBconnection db = DBconnection.getInstance();
	   Connection	con = db.getCon();
	   PreparedStatement pst = con.prepareStatement("SELECT * FROM customer");


	ResultSet rs = pst.executeQuery();
	while (rs.next()) {
		
		
		x=x+1;
			

	}

} catch (Exception e) {

	e.printStackTrace();
}


   
    
    
%>




							<%



							  double tot=0;
					int i=0;


try {

	DBconnection db = DBconnection.getInstance();
	   Connection	con = db.getCon();
	   PreparedStatement pst = con.prepareStatement("SELECT * FROM Iorders");
     
	 

	ResultSet rs = pst.executeQuery();
	
	while (rs.next()) {
		
		String price=rs.getString("total");
		double totp=Double.parseDouble(price);
		tot=tot+totp;
		
		
		%>		
	
						<tbody>
							<tr>
								
								<td><%=rs.getInt("orderId")%></td>
								<td><%=rs.getString("Itemname")%></td>
								<td><%=rs.getString("total")%></td>
								<td><%=rs.getString("orderdate")%></td>
								<td><%=rs.getString("itemID")%></td>
								<td><%=rs.getString("quantity")%></td>
								<td><%=rs.getString("cusid")%></td>
							
								
												
					<td><form action="<%= request.getContextPath() %>/cancelorder" method="post">
						
							 <input type="hidden" name="id" id="lname" value="<%=rs.getInt("orderId") %>" readonly />
									<button type="submit" class="status completed">Cancel</button>
								
										</form></td>
							</tr>
							
						</tbody>
						
								<%		
								
								i=i+1;

	}

} catch (Exception e) {

	e.printStackTrace();
}


   
    
    
%>



<ul class="box-info">
				<li>
					<i class='bx bxs-calendar-check' ></i>
					<span class="text">
						<h3><%= i %></h3>
						<p>New Order</p>
					</span>
				</li>
				<li>
					<i class='bx bxs-group' ></i>
					<span class="text">
						<h3><%= x %></h3>
						<p>Customers</p>
					</span>
				</li>
				<li>
					<i class='bx bxs-dollar-circle' ></i>
					<span class="text">
						<h3>$<%= tot %></h3>
						<p>Total Sales</p>
					</span>
				</li>
			</ul>
					</table>
				</div>
				
			</div>
		</main>
		<!-- MAIN -->
	</section>
	<!-- CONTENT -->
	

	<script src="script.js"></script>
</body>
</html>