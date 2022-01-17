package com.example.storehouse;

import java.util.Random;

public class Expedition{
	private static int count = 0;
	private int id;
	private String startDate;
	private String endDate;
	private Geologist geologists;
	private Sample samples;
	private String gatheringPlace;
	
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
	
	public Expedition(String startDate,String endDate,Geologist[] geologists,Sample[] samples,String gatheringPlace){
		this.id=++count;
		this.startDate=startDate;
		this.endDate=endDate;
		this.geologists=geologists;
		this.samples=samples;
		this.gatheringPlace=gatheringPlace;
	}
	
	public Expedition(){
		id=++count;
		startDate="16.01.2022";
		endDate="17.01.2022";
		gatheringPlace=randomSymbols();
	}
	
	
	
}
