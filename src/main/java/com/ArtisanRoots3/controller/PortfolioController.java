package com.ArtisanRoots3.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

import com.ArtisanRoots3.model.UserModel;
import com.ArtisanRoots3.service.login;
import com.ArtisanRoots3.util.PasswordUtil;
import com.ArtisanRoots3.util.SessionUtil;
import com.ArtisanRoots3.util.ValidationUtil;

/**
 * Servlet implementation class PortfolioController
 */
@WebServlet("/portfolio")
public class PortfolioController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PortfolioController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("WEB-INF/pages/portfolio.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		getServletContext().log("Inside doPost");

	    HttpSession session = request.getSession();

	    // Check if the user is logged in
	    UserModel currentUser = (UserModel) session.getAttribute("user");
	    if (currentUser == null) {
	        response.sendRedirect("login");
	        return;
	    }

	    // Hardcoded values to update (this can be changed to dynamic values if needed)
		String username = request.getParameter("username");
	    String password = request.getParameter("password");
	    String firstName=request.getParameter("firstName");
	    String lastName=request.getParameter("lastName");
	    String phone=request.getParameter("phone");
	    LocalDate dob=LocalDate.parse(request.getParameter("dob"));
	    String email=request.getParameter("email");
	    String gender=request.getParameter("gender");
	    String retypePassword=request.getParameter("confirmPassword");
	    boolean hasError=false;
	    // Encrypt the password using AES
	    
	    
	    
	    
	    
	    
		
	    UserModel user = new UserModel(
	    		currentUser.getUserId(),
	        firstName,
	       lastName,
	        username,
	        currentUser.getPhone(),
	        currentUser.getDob(),
	        currentUser.getEmail(),
	        "customer",
	        currentUser.getPassword(), 
	        currentUser.getGender()
	    );

	    login dao = new login();
        boolean updated = false;

        try {
            updated = dao.updateUser(user);  // Update user in the database
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (updated) {
            // Update session with the updated user data
        	session.setAttribute("user", user);
            response.sendRedirect(request.getContextPath() + "/portfolio");
        } else {
            response.sendRedirect("error.jsp");
        }
	    }
	

}
