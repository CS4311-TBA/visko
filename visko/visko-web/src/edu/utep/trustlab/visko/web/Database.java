package edu.utep.trustlab.visko.web;


public class Database {
	private String url = "jdbc:mysql://earth.cs.utep.edu/cs4311team1sp14";
	private String user = "cs4311team1sp14";
	private String password = "teamTBA";
	
	public String getDatabaseUrl()
	{
		return url;
	}
	
	public String getDatabaseUser()
	{
		return user;
	}
	
	public String getDatabasePass()
	{
		return password;
	}
}
