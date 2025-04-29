<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Artisan Roots</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
</head>
<body>
<div class="nav-bar">
    <div class="logo1">
        <img class="logo" src="${pageContext.request.contextPath}/resource/images/system/logo4.png" width="120px" height="44px">
    </div>
    
    <div class="middle-nav">
        <%-- Show different links based on role --%>
        <c:choose>
            <%-- Admin links --%>
            <c:when test="${sessionScope.user.role == 'admin'}">
                <a href="/ArtisanRoots3/admin/dashboard">Dashboard</a>
                <a href="/ArtisanRoots3/admin/users">User Management</a>
                <a href="/ArtisanRoots3/admin/reports">Reports</a>
            </c:when>
            
            <%-- Customer links (default) --%>
            <c:otherwise>
                <a href="/ArtisanRoots3/home">HOME</a>
                <a href="/ArtisanRoots3/contactus">CONTACT US</a>
                <a href="/ArtisanRoots3/aboutus">ABOUT US</a>
                <a href="/ArtisanRoots3/portfolio">PORTFOLIO</a>
            </c:otherwise>
        </c:choose>
    </div>

    <div class="right-nav">
        <%-- Search bar (shown to all) --%>
        <div class="search">
            <span class="icon">
                <img src="${pageContext.request.contextPath}/resource/images/system/search.png" width="25px" height="25px">
            </span>
            <input type="text" placeholder="Search">
        </div>
        
        <%-- Shopping features (only for customers) --%>
        <c:if test="${sessionScope.user.role != 'admin'}">
            <div class="wishlist">
                <img src="${pageContext.request.contextPath}/resource/images/system/wishlist.png" width="25px" height="25px">
            </div>
            <div class="cart">
                <img src="${pageContext.request.contextPath}/resource/images/system/cart1.png" width="25px" height="25px">
            </div>
        </c:if>
        
        <%-- Simple logout button --%>
            <form action="${pageContext.request.contextPath}/logout" method="get">
                <button type="submit" class="logout-btn">Logout</button>
            </form>
    </div>
</div>
</body>
</html>