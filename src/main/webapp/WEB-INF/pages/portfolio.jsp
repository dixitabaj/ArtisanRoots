<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ArtisanRoots3.model.UserModel" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
<style>
body {
    font-family: 'Poppins', sans-serif;
    background-color: #f8f5f0;
    margin: 0;
    padding: 0;
}

.main-container {
    display: flex;
    max-width: 1200px;
    margin: 20px auto;
    padding: 20px;
    gap: 30px;
}

.profile-section {
    flex: 1;
    background: white;
    border-radius: 10px;
    padding: 20px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}

.profile-picture {
    width: 150px;
    height: 150px;
    margin: 0 auto 20px;
    border-radius: 50%;
    overflow: hidden;
    border: 5px solid #d4c2ab;
}

.profile-picture img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.profile-info {
    text-align: center;
}

.profile-info h2 {
    color: #5d6b7a;
    margin-bottom: 10px;
}

.profile-info p {
    margin: 8px 0;
    color: #555;
}

.form-section {
    flex: 2;
    background: white;
    border-radius: 10px;
    padding: 20px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}

.tabs {
    display: flex;
    margin-bottom: 20px;
    border-bottom: 2px solid #eee;
}

.tab-btn {
    padding: 10px 20px;
    background: none;
    border: none;
    cursor: pointer;
    font-weight: 500;
    color: #777;
}

.tab-btn.active {
    color: #5d6b7a;
    border-bottom: 2px solid #5d6b7a;
}

.form-content {
    display: none;
}

.form-content.active {
    display: block;
}

.form-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 20px;
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    margin-bottom: 5px;
    font-weight: 500;
    color: #5d6b7a;
}

.form-group input {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
}

.form-actions {
    margin-top: 20px;
    text-align: right;
}

.btn {
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-weight: 500;
}

.btn-primary {
    background: #5d6b7a;
    color: white;
}

.btn-secondary {
    background: #e0e0e0;
    color: #333;
    margin-right: 10px;
}

@media (max-width: 768px) {
    .main-container {
        flex-direction: column;
    }
    
    .profile-section,
    .form-section {
        width: 100%;
    }
}
</style>
</head>
<body>

<jsp:include page="header.jsp" />

<div class="main-container">
    <!-- Profile Section -->
    <div class="profile-section">
        <div class="profile-picture">
            <img src="${pageContext.request.contextPath}/images/face.png" alt="Profile Picture">
        </div>
        
        <% UserModel loggedInUser = (UserModel) session.getAttribute("user"); %>
        <div class="profile-info">
            <h2><%= loggedInUser.getFirstName() %> <%= loggedInUser.getLastName() %></h2>
            <p><strong>Email:</strong> <%= loggedInUser.getEmail() %></p>
            <p><strong>Phone:</strong> <%= loggedInUser.getPhone() %></p>
            <p><strong>Date of Birth:</strong> <%= loggedInUser.getDob() %></p>
            <p><strong>Gender:</strong> <%= loggedInUser.getGender() %></p>
        </div>
    </div>

    <!-- Form Section -->
    <div class="form-section">
     <div class="settings-header">
            <h2>Account Settings</h2>
           <div class="tabs">
            <button class="tab-btn active" onclick="showTab('account')">Account</button>
            <button class="tab-btn" onclick="showTab('password')">Password</button>
        </div>
        </div>
        
        
        <!-- Account Form -->
        <div id="accountForm" class="form-content active">
            <form method="post" action="${pageContext.request.contextPath}/portfolio">
                <div class="form-grid">
                    <div class="form-group">
                        <label for="firstName">First Name</label>
                        <input type="text" id="firstName" name="firstName" value="<%= loggedInUser.getFirstName() %>" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="lastName">Last Name</label>
                        <input type="text" id="lastName" name="lastName" value="<%= loggedInUser.getLastName() %>" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" id="username" name="username" value="<%= loggedInUser.getUsername() %>" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="phone">Phone Number</label>
                        <input type="tel" id="phone" name="phone" value="<%= loggedInUser.getPhone() %>">
                    </div>
                    
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" value="<%= loggedInUser.getEmail() %>" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="dob">Date of Birth</label>
                        <input type="date" id="dob" name="dob" value="<%= loggedInUser.getDob() %>">
                    </div>
                </div>
                
                <div class="form-actions">
                    <button type="reset" class="btn btn-secondary">Reset</button>
                    <button type="submit" class="btn btn-primary">Save Changes</button>
                </div>
            </form>
        </div>
        
        <!-- Password Form -->
        <div id="passwordForm" class="form-content">
            <form action="${pageContext.request.contextPath}/update-password" method="post">
                <div class="form-grid">
                    <div class="form-group">
                        <label for="currentPassword">Current Password</label>
                        <input type="password" id="currentPassword" name="currentPassword" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="newPassword">New Password</label>
                        <input type="password" id="newPassword" name="newPassword" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="confirmPassword">Confirm Password</label>
                        <input type="password" id="confirmPassword" name="confirmPassword" required>
                    </div>
                </div>
                
                <div class="form-actions">
                    <button type="submit" class="btn btn-primary">Update Password</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
function showTab(tabName) {
    // Hide all form contents
    document.querySelectorAll('.form-content').forEach(content => {
        content.classList.remove('active');
    });
    
    // Deactivate all tabs
    document.querySelectorAll('.tab-btn').forEach(btn => {
        btn.classList.remove('active');
    });
    
    // Show selected tab content
    document.getElementById(tabName + 'Form').classList.add('active');
    
    // Activate clicked tab
    event.currentTarget.classList.add('active');
}
</script>

</body>
</html>