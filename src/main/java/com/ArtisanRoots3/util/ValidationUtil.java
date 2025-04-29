package com.ArtisanRoots3.util;

import java.sql.Date;
import java.time.LocalDate;

public class ValidationUtil {


	   public static boolean isNull(String value) {
		   return value==null || value.isEmpty();
	    }

	   public static boolean isValidFirstName(String value) {
		   return value.matches("^[a-zA-Z]+$");
	   }
	   
	   public static boolean isValidUsername(String value) {
		   return value.matches("^[a-zA-Z//s]+$");
	   }

	   public static boolean isValidEmail(String value) {
		    return value.matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$");
		}

	   public static boolean isValidPhoneNumber(String number) {
		   return number.matches("^[9][0-9]{9}$");
	   }
	   public static boolean isValidPassword(String password) {
		   return password.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*()]).+$");
 }
	   
	   public static boolean isValidDate(LocalDate dob) {
		   LocalDate today = LocalDate.now();
		   if (dob.isAfter(today)) {
		        return false;
		    }
		   else {
		return true;
		   }
	   }
	   public static boolean matchesPassword(String password, String retypePassword) {
		   return password.equals(retypePassword);
	   }
	   public static boolean isValidAge(LocalDate dob) {
		   LocalDate today = LocalDate.now();
		    int age = today.getYear() - dob.getYear();
		    if (dob.plusYears(age).isAfter(today)) {
		        age--;
		    }

		    return age >= 18;
	   }
	}

