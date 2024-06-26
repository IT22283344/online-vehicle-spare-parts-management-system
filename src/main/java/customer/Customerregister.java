package customer;

import jakarta.servlet.RequestDispatcher;



import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import customer.customerDBUtill;

import DBconnetion.DBconnection;

import customer.customer;

@WebServlet("/Customerregisters")
public class Customerregister extends HttpServlet {
	private static final long serialVersionUID = 1L;

   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String C_fname = request.getParameter("fname");
		String C_lname = request.getParameter("lname");
		String C_email = request.getParameter("email");
		String C_contactNo = request.getParameter("contact");
		String C_address = request.getParameter("address");
		String C_password = request.getParameter("pwd");
		//Connection con= null;
		

/*	try{ 
		
		
		
		
		
		//Class.forName("com.mysql.cj.jdbc.Driver");
		//Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","12345678");
		DBconnection db = DBconnection.getInstance();
	Connection	con = db.getCon();
	//	stmt = ((Connection) con).createStatement();
		
		PreparedStatement pst=con.prepareStatement("insert into customer(fname,lname,email,contactno,address,password) values (?,?,?,?,?,?)");
		
		pst.setString(1, C_fname);
		pst.setString(2, C_lname);
		pst.setString(3, C_email);
		pst.setString(4, C_contactNo);
		pst.setString(5, C_address);
		pst.setString(6, C_password);
		
		ArrayList<customer> cus = new ArrayList<> ();
		customer c = new customer ();
		c.setC_address(C_address);
		c.setC_contactNo(C_contactNo);
		c.setC_fname(C_fname);
		c.setC_password(C_password);
		c.setC_lname(C_lname);
		cus.add(c);
		
		int row=pst.executeUpdate();
		if (row>0) {
			// navigate to another jsp page
			RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
			request.setAttribute("status", "done");
		dis.forward(request, response);
		} else {
			RequestDispatcher dis2 = request.getRequestDispatcher("index.jsp");
			dis2.forward(request, response);
		}
		
	}catch (Exception e) {
		
		
		e.printStackTrace();
		
		
	}finally{
	}*/
		
		boolean isTrue;
		// calling insertMethod in customerDButil n assign this
		isTrue = customerDBUtill.insertCustomer(C_fname, C_lname, C_email, C_contactNo, C_address, C_password);

		if (isTrue == true) {
			// navigate to another jsp page
			RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
			request.setAttribute("status", "done");
			dis.forward(request, response);
		} else {
			RequestDispatcher dis2 = request.getRequestDispatcher("index.jsp");
			dis2.forward(request, response);
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
