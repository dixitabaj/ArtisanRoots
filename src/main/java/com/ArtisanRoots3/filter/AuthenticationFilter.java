package com.ArtisanRoots3.filter;


import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.ArtisanRoots3.util.CookieUtil;
import com.ArtisanRoots3.util.SessionUtil;

@WebFilter(asyncSupported = true, urlPatterns = "/*")
public class AuthenticationFilter implements Filter {

	private static final String LOGIN = "/login";
	private static final String REGISTER = "/registration2";
	private static final String HOME = "/home";
	private static final String ROOT = "/";
	private static final String DASHBOARD = "/dashboard";
	private static final String MODIFY_STUDENTS = "/modifyStudents";
	private static final String STUDENT_UPDATE = "/studentUpdate";
	private static final String ADMIN_ORDER = "/adminOrder";
	private static final String ABOUT = "/aboutus";
	private static final String PORTFOLIO = "/portfolio";
	private static final String CONTACT = "/contactus";
	private static final String ORDER_LIST = "/orderlist";
	private static final String CART_LIST = "/cartlist";

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// Initialization logic, if required
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
	        throws IOException, ServletException {

	    HttpServletRequest req = (HttpServletRequest) request;
	    HttpServletResponse res = (HttpServletResponse) response;

	    String uri = req.getRequestURI();

	    // Allow access to static resources
	    if (uri.endsWith(".png") || uri.endsWith(".jpg") || uri.endsWith(".css")) {
	        chain.doFilter(request, response);
	        return;
	    }

	    HttpSession session = req.getSession(false);
	    boolean isLoggedIn = session != null && session.getAttribute("user") != null;
	    String userRole = CookieUtil.getCookie(req, "role") != null ? CookieUtil.getCookie(req, "role").getValue() : null;

	    System.out.println("User Role: " + userRole); // Debugging line
	    System.out.println("Session Active: " + isLoggedIn); // Debugging line

	    if (isLoggedIn && userRole != null) {
	        if ("admin".equals(userRole)) {
	            if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER)) {
	                res.sendRedirect(req.getContextPath() + DASHBOARD);
	            } else {
	                chain.doFilter(request, response);
	            }
	        } else if ("user".equals(userRole)) {
	            if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER)) {
	                res.sendRedirect(req.getContextPath() + HOME);
	            } else {
	                chain.doFilter(request, response);
	            }
	        }
	    } else {
	        if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER) || uri.endsWith(HOME) || uri.endsWith(ROOT)) {
	            chain.doFilter(request, response);
	        } else {
	            res.sendRedirect(req.getContextPath() + LOGIN);
	        }
	    }
	}

	

	@Override
	public void destroy() {
		// Cleanup logic, if required
	}
}
