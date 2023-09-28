package com.example.demo.Entities;

import java.util.Arrays;

import jakarta.persistence.Column;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.Table;

@Entity
@Table(name="user")
public class User {
@Id
@Column(name="email")
private String Email;

@Lob
@Column(name="image")
private byte[] imageData;

@Column(name="name")
private String name; 

@Column(name="address")
private String address;
@Column(name="password")
private String password;
public User() {
	super();
	// TODO Auto-generated constructor stub
}
public User(String email, byte[] imageData, String name, String address, String password) {
	super();
	Email = email;
	this.imageData = imageData;
	this.name = name;
	this.address = address;
	this.password = password;
}
public String getEmail() {
	return Email;
}
public void setEmail(String email) {
	Email = email;
}
public byte[] getImageData() {
	return imageData;
}
public void setImageData(byte[] imageData) {
	this.imageData = imageData;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
@Override
public String toString() {
	return "User [Email=" + Email + ", imageData=" + Arrays.toString(imageData) + ", name=" + name + ", address="
			+ address + ", password=" + password + "]";
}










}
