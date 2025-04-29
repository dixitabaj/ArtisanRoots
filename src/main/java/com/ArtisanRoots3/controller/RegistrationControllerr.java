package com.ArtisanRoots3.controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

import com.ArtisanRoots3.model.UserModel;
import com.ArtisanRoots3.service.login;
import com.ArtisanRoots3.util.PasswordUtil;
import com.ArtisanRoots3.util.SessionUtil;
import com.ArtisanRoots3.util.ValidationUtil;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class RegistrationController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/registration2"})
public class RegistrationControllerr extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationControllerr() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("WEB-INF/pages/Registration.jsp").forward(request, response);
	}
	
	private boolean validateAlphabeticField(HttpServletRequest request, String paramName, String errorAttributeName) {
	    String value = request.getParameter(paramName);
	    if (!ValidationUtil.isValidFirstName(value)) {
	        request.setAttribute(errorAttributeName, paramName + " must contain only letters.");
	        return false;
	    }
	    return true;
	}
	
	private boolean validateUsername(HttpServletRequest request, String paramName, String errorAttributeName) {
	    String value = request.getParameter(paramName);
	    if (!ValidationUtil.isValidUsername(value)) {
	        request.setAttribute(errorAttributeName, paramName + " must contain only letters.");
	        return false;
	    }
	    return true;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
	    
	    
	    
	    hasError |= !validateAlphabeticField(request, "firstName", "firstNameError");
	    hasError |= !validateUsername(request, "lastName", "lastNameError");
	    hasError |= !validateUsername(request, "username", "usernameError");

	    
	    // DEBUG print (server logs)
	    if (!ValidationUtil.isValidPassword(password)) {
	    	request.setAttribute("passwordError", "you password must contain atleast one number, one uppercase, one lowercase and one speacial character");
	    	hasError=true;
	    }
	    
	    if(!ValidationUtil.isValidAge(dob)) {
	    	request.setAttribute("dobError", "You should be above 18 to enter");
	    	hasError=true;
	    }
	    if(!ValidationUtil.isValidDate(dob)) {
	    	request.setAttribute("dobError", "Please enter a valid date");
	    	hasError=true;
	    }
	    
	    if (!ValidationUtil.isValidEmail(email)) {
	    	request.setAttribute("emailError", "Please enter a valid email");
	    	hasError=true;
	    }
	    
	    if(!ValidationUtil.isValidPhoneNumber(phone)) {
	    	request.setAttribute("phoneError", "Please enter a valid phone number");
	    	hasError=true;
	    }
	    
	    if(!ValidationUtil.matchesPassword(password, retypePassword)) {
	    	request.setAttribute("confirmPasswordError", "Mismatched password");
	    	hasError=true;
	    }
	    
	    
System.out.print(hasError);
	    if(!hasError) {
	    String encryptedPassword=null;
		try {
			encryptedPassword = PasswordUtil.encrypt(email, password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    System.out.println("Encrypted password: " + encryptedPassword);
	    
	    System.out.println("Reached here after encryption");
	    UserModel user = new UserModel(
	        0,
	        firstName,
	       lastName,
	        username,
	        phone,
	        dob,
	        email,
	        "customer",
	        encryptedPassword,  // Save encrypted password
	        gender
	    );

	    login dao = new login();
	    boolean inserted = false;

	        try {
				inserted = dao.insert(user);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        System.out.println("Encrypted password: " + encryptedPassword);
	        System.out.println("User inserted: " + inserted);
	   

	    if (inserted) {
	    	SessionUtil.setAttribute(request, "loggedInUser", user);
	    	response.sendRedirect(request.getContextPath() + "/login");
	    } else {
	        response.sendRedirect("error.jsp");
	    }
	}
	    else {
	    	 request.getRequestDispatcher("WEB-INF/pages/Registration.jsp").forward(request, response);      
		        return;
	    }
	}
	}



