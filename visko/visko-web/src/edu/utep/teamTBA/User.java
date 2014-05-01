package edu.utep.teamTBA;

public class User {
	
	private String email;
	private String password;
	private String organization;
	private int priv;
	
	
	public User()
	{
		this.email = null;
		this.password = null;
		this.organization = null;
		this.priv = 1;
	}
	
	public User( String e, String p, String o, int pr )
	{
		this.email = e;
		this.password = p;
		this.organization = o;
		this.priv = pr;
	}
	
	public String getEmail()
	{
		return this.email;
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
	
	public void setEmail(String e)
	{
		this.email = e;
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
}
