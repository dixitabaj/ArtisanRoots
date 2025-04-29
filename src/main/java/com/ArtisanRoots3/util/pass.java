package com.ArtisanRoots3.util;

public class pass {
public static void main(String[] args) {
	String a="hi";
	char[] b=a.toCharArray();
	System.out.println(b);
	for (char c:b) {
		c+=4;
		System.out.print(c);
	}
}
}
