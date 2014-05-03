package edu.utep.trustlab.visko.web;

import java.sql.ResultSet;
import java.sql.SQLException;

public class User {
	
	private String email;
	private String password;
	private String organization;
	private int priv;
	private String firstname;
	private String lastname;
	private int status;
	
	
	public User()
	{
	}
	
	public User( String e, String p, String o, int pr , String f, String l , int s)
	{
		this.email = e.toLowerCase();
		this.password = p;
		this.organization = o;
		this.priv = pr;
		this.firstname = f;
		this.lastname = l;
		this.status = s;
	}
	
	public User( ResultSet rs ) throws SQLException
	{
		rs.next();
		this.email = rs.getString("Uemail").toLowerCase();
		this.password = rs.getString("Upassword");
		this.organization = rs.getString("Uorganization");
		this.priv = rs.getInt("Upriv");
		this.firstname = rs.getString("Ufirstname");
		this.lastname = rs.getString("Ulastname");
		this.status = rs.getInt("Ustatus");
	}
	
	public String getEmail()
	{
		return this.email.toLowerCase();
	}
	
	public String getPass()
	{
		return this.password;
	}
	
	public String getOrg()
	{
		return this.organization;
	}
	
	public int getPriv()
	{
		return this.priv;
	}
	
	public String getFirstName()
	{
		return this.firstname;
	}
	
	public String getLastName()
	{
		return this.lastname;
	}
	
	public int getStatus()
	{
		return this.status;
	}
	
	public void setEmail(String e)
	{
		this.email = e.toLowerCase();
	}
	

	public void setPass( String p )
	{
		this.password = p;
	}
	
	public void setOrg( String o )
	{
		this.organization = o;
	}
	
	public void setPriv( int p )
	{
		this.priv = p;
	}
	
	public void setFirstName( String f )
	{
		this.firstname = f;
	}
	
	public void setLastName( String l )
	{
		this.lastname = l;
	}
	
	public void setStatus( int s )
	{
		this.status = s;
	}
}
