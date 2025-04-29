package com.ArtisanRoots3.model;

import java.sql.Date;
import java.time.LocalDate;





public class UserModel {
    private int userId;
    private String firstName;
    private String lastName;
    private String username;
    private String phone;
    private LocalDate dob;
    private String email;
    private String role;
    private String password;
    private String gender;

    // Constructor
    public UserModel(int userId, String firstName, String lastName, String username, String phone,
                LocalDate dob, String email, String role, String password, String gender) {
        this.userId = userId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.username = username;
        this.phone = phone;
        this.dob = dob;
        this.email = email;
        this.role = role;
        this.password = password;
        this.gender = gender;
    }

    public UserModel() {
		// TODO Auto-generated constructor stub
	}

	// Getters (you can also add setters if needed)
    public int getUserId() { return userId; }
    public String getFirstName() { return firstName; }
    public String getLastName() { return lastName; }
    public String getUsername() { return username; }
    public String getPhone() { return phone; }
    public LocalDate getDob() { return dob; }
    public String getEmail() { return email; }
    public String getRole() { return role; }
    public String getPassword() { return password; }
    public String getGender() { return gender; }
    public void setUserId(int userId) {
		this.userId = userId;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setDob(LocalDate dob) {
		this.dob = dob;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	
}
