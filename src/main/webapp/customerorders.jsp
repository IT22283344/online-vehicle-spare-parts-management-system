

<%@ page import="DBconnetion.DBconnection"%>
<%@ page import="jakarta.servlet.RequestDispatcher"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <title>GearUp</title>
    <meta content="" name="description" />
    <meta content="" name="keywords" />

    <!-- Favicons -->
    <link href="img/favicon.png" rel="icon" />
    <link href="img/apple-touch-icon.png" rel="apple-touch-icon" />

    <!-- Vendor CSS Linkks -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.min.css" rel="stylesheet">

    <!-- Vendor Script Linkks -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;0,700;0,900;1,300;1,400;1,500&display=swap"
      rel="stylesheet" />

    <!-- Main CSS Files -->
    <link href="css2/bootstrap.min.css" rel="stylesheet" />
    <link href="css2/style.css" rel="stylesheet" />
    <link href="css2/styleprofile.css" rel="stylesheet" />
    	<link rel="stylesheet" href="adminstyle.css">

  </head>

  <body>
    <!-- ======= Header ======= -->
    <header id="header" class="fixed-top d-flex align-items-center">
      <div class="container d-flex align-items-center justify-content-between">
        <div class="logo">
          <!--<h1 id="logo">
            <a href="index.html"><span style="color: black; font-family: 'Roboto', sans-serif">Gear</span><span
                style="color: #3498db">Up</span></a>
          </h1>
          <p>Revving your vehicle solutions</p>
         Uncomment below if you prefer to use an image logo -->
          <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
        </div>

        <nav id="navbar" class="navbar">
          <ul>
            <li><a class="nav-link scrollto" href="indexlogin.jsp">Home</a></li>
            <li>
              <a class="nav-link scrollto" href="forms/product.html">Products</a>
            </li>
            <li>
              <a class="nav-link scrollto" href="#about">About</a>
            </li>
            <li>
              <a class="nav-link scrollto" href="#services">Services</a>
            </li>
            <li>
              <a class="nav-link scrollto" href="#contact">Contact</a>
            </li>
           
            <li><a class="getstarted scrollto" href="postadd.jsp">Post Add</a></li>
          </ul>
        </nav>
        <!-- .navbar -->
      </div>
    </header>
    <!-- End Header -->

    <main id="main">
    <input type="hidden"  id="status" value="<%= request.getAttribute("status")%>">
        
        <div class="d-flex flex-column ">

            <div class="profile pt-5 mt-5">
              
              <h1 class="text-black mt-5"><a href="#">hi <%=session.getAttribute("name1") %></a></h1>
              <div class="social-links mt-3 text-center pt-5">
                <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
                <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
              </div>
            </div>
      
            <nav id="navbar" class="nav-menu ">
                <button class=" mt-5" id="btn-prof">Home</button><br>
                <button class=" mt-5" id="btn-prof">Profile</button>
                <button class=" mt-5" id="btn-prof">Orders</button>
           <form action="<%= request.getContextPath() %>/changepass.jsp" method="post">  <button class=" mt-5" id="btn-prof">Change password  </button></form>
         <form action="<%= request.getContextPath() %>/Deletacc.jsp" method="post"> <button class=" mt-5" id="btn-prof">Delete Account</button>
        <form action="<%= request.getContextPath() %>/customerlogout1" method="post"> <button class=" mt-5" id="btn-prof">Log out</button>
       </form>     </nav><!-- .nav-menu -->

          </div>
        </main>
    <!-- End #main -->



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
								<th>ItemId</th>
								<th>Title</th>
								<th>cat</th>
								<th>description</th>
								<th>quantity</th>
								<th>postdate</th>
								<th>image</th>
								<th>price</th>
								
								<th>update</th>
								<th>delete</th>
							</tr>
						</thead>
						
			<%



		session.getAttribute("cusID") ;


try {

	DBconnection db = DBconnection.getInstance();
	   Connection	con = db.getCon();
	   PreparedStatement pst = con.prepareStatement("SELECT * FROM Iorders where cusid='"+session.getAttribute("cusID")+"'");


	ResultSet rs = pst.executeQuery();
	while (rs.next()) {
		
		
		
		%>		
	
				 		<tbody>
							<tr>
								<td>
									
								<p><%=rs.getInt("orderId") %></p>
								</td>
								<td><%=rs.getString("title")%></td>
								<td><%=rs.getString("Itemname")%></td>
								<td><%=rs.getString("total")%></td>
								<td><%=rs.getString("orderdate")%></td>
								<td><%=rs.getString("itemID")%></td>
								<td><%=rs.getString("quantity")%></td>
								<td><%=rs.getString("cusid")%></td>
								
					<td><form action="<%= request.getContextPath() %>/admin.customerdelete" method="post">
						<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="id" id="lname" value="<%=rs.getInt("ID") %>" readonly />
									<span ><button type="submit" class="status completed">Remove</button></span>
									
						
							</tr>
							
						</tbody>    
						
						
						
						
						
						
						
						
						
								<%		

	}

} catch (Exception e) {

	e.printStackTrace();
}


   
    
    
%>
    
        


    <!-- ======= Footer ======= -->
    <footer id="footer">
      <div class="container">
        <div class="row d-flex align-items-center">
          <div class="col-lg-6 text-lg-left text-center">
            <div class="copyright">
              &copy; Copyright
              <strong>
                <h1>
                  <a href="index.html"><span style="color: black; font-family: 'Roboto', sans-serif">Gear</span><span
                      style="color: #3498db">Up</span></a>
                </h1>
              </strong>
              <p style="
                  color: black;
                  font-family: 'Roboto', sans-serif;
                  margin-top: -1.2%;
                ">
                Revving your vehicle solutions
              </p>
              All Rights Reserved
            </div>
            <div class="credits">Designed by <a href="">S2/MLB/WD/G28</a></div>
          </div>
          <div class="col-lg-6">
            <nav class="footer-links text-lg-right text-center pt-2 pt-lg-0">
              <a href="#index.jsp" class="scrollto">Home</a>
              <a href="#about" class="scrollto">About</a>
              <a href="#">Privacy Policy</a>
              <a href="#">Terms of Use</a>
            </nav>
          </div>
        </div>
      </div>
    </footer>
    <!-- End Footer -->

    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
        class="bi bi-arrow-up-short"></i></a>

    
    <!-- Template Main JS File -->
    <script src="assets/js/main.js"></script>
    <script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
	
	var status= document.getElementById("status").value;
		if(status=="failed"){
		swal("Error", "Details update failed");
	
		}
		if(status=="done"){
			swal({
				  title: "Good job!",
				  text: "Your details has been successfully updated",
				  icon: "success",
				  button: "ok",
				});
	
		}
		if(status=="done1"){
			swal({
				  title: "Good job!",
				  text: "Your passwords has been successfully updated",
				  icon: "success",
				  button: "ok",
				});
	
		}
		if(status=="adddone"){
			swal({
				  title: "Good job!",
				  text: "Your add has been successfully posted",
				  icon: "success",
				  button: "ok",
				});
	
		}
	
	
	
	
	
	
	</script>
  </body>

  </html>