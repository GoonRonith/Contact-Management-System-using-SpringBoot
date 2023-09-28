package com.example.demo.Entities;

import java.util.Arrays;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.Table;

@Entity
@Table(name="contact")
public class Contact {
	@Id
	@Column(name="ph_number")
	private long ph_number;
	
	@Column(name="name")
	private String name;
	
	@Lob
	@Column(name="image")
	private byte[] imageData;
	
	@Column(name="address")
	private String address;
	
	@Column(name="createremail")
	private String createrEmail;

	public Contact(long ph_number, String name, byte[] imageData, String address, String createrEmail) {
		super();
		this.ph_number = ph_number;
		this.name = name;
		this.imageData = imageData;
		this.address = address;
		this.createrEmail = createrEmail;
	}

	@Override
	public String toString() {
		return "Contact [ph_number=" + ph_number + ", name=" + name + ", imageData=" + Arrays.toString(imageData)
				+ ", address=" + address + ", createrEmail=" + createrEmail + "]";
	}

	public long getPh_number() {
		return ph_number;
	}

	public void setPh_number(long ph_number) {
		this.ph_number = ph_number;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public byte[] getImageData() {
		return imageData;
	}

	public void setImageData(byte[] imageData) {
		this.imageData = imageData;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCreaterEmail() {
		return createrEmail;
	}

	public void setCreaterEmail(String createrEmail) {
		this.createrEmail = createrEmail;
	}

	public Contact() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	

	
}
