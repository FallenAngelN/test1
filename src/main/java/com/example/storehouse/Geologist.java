package com.example.storehouse;

import java.util.Random;

public class Geologist{
	private static int count = 0;
	private int id;
	private String name;
	private String address;
	private String phone;
	private String email;
	public Expedition expeditions;
	
	private String randomSymbols()
	{
		int leftLimit = 97;
        int rightLimit = 123;
        Random randStr = new Random();
        return randStr.ints(leftLimit, rightLimit)
                .limit(15)
                .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
                .toString();
	}
	
	public Geologist (String name,String address,String phone,String email,Expedition expeditions){
		this.id=++count;
		this.name=name;
		this.address=address;
		this.phone=phone;
		this.email=email;
		this.expeditions=expeditions;
	}
	
	public Geologist()
	{
		id=++count;
		name=randomSymbols();
		address=randomSymbols();
		phone="81234567891";
		email=randomSymbols()+"@mail.ru";
	}
	
	public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getAddress() {
        return address;
    }

    public String getPhone() {
        return phone;
    }

    public String getEmail() {
        return email;
    }
	
	public Expedition getExpedition()
	{
		return expeditions;
	}		
}

