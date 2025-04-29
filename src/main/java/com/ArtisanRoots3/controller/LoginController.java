package com.ArtisanRoots3.controller;

import java.io.IOException;

import com.ArtisanRoots3.model.UserModel;
import com.ArtisanRoots3.service.login;
import com.ArtisanRoots3.util.PasswordUtil;
import com.ArtisanRoots3.util.SessionUtil;
import com.ArtisanRoots3.util.ValidationUtil;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * @author dixitabajracharya
 * Servlet implementation class Login
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/login" , "/" })
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }
   
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("WEB-INF/pages/Login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		

		login obj=new login();
		String encrypted=obj.getEncryptedPassword(email);
		
			 String decrypted = PasswordUtil.decrypt(encrypted, email);
		

		
		boolean emailAvailable=true;
		emailAvailable=obj.check(email);
		System.out.println("the encrypted"+encrypted);
		System.out.println("password entered by the user " + password);
		System.out.println("decrypted password " + decrypted);
		System.out.println("email entered by the user:" + email);
		String passwordCheck=obj.getEncryptedPassword(email);
		System.out.println(passwordCheck);
		
		 if (emailAvailable) {
			if (password.equals(decrypted)) {
				System.out.println("Login successful");

                UserModel loggedInUser = obj.getUserByEmail(email);
                SessionUtil.setAttribute(request, "user", loggedInUser);
                String role = loggedInUser.getRole();
                // Set role cookie
                Cookie roleCookie = new Cookie("role", "user"); // Or "admin" depending on role
                roleCookie.setMaxAge(60 * 60); // 1 hour
                roleCookie.setPath("/");
                response.addCookie(roleCookie);

                if ("admin".equalsIgnoreCase(role)) {
    				response.sendRedirect(request.getContextPath() + "/productmanage");
    			} else {
    				response.sendRedirect(request.getContextPath() + "/home");
    			}

			}
			else {
				System.out.println(decrypted);
				System.out.println("password isnt correct");
				
				request.setAttribute("loginError", "Invalid email or password");
				request.getRequestDispatcher("WEB-INF/pages/Login.jsp").forward(request, response);
				return;
			}
		}
		else {
			request.setAttribute("loginError", "Invalid email or password");
			request.getRequestDispatcher("WEB-INF/pages/Login.jsp").forward(request, response);

			System.out.println("email isnt correct");
			return;
		}
		
    }
			

}
