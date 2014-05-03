package edu.utep.trustlab.visko.web;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.StringTokenizer;

public class Access {

	public Access()
	{
	}
	
	
	 /**
     * retrieve string column from the database
     * receives parameters:
     * table: String name of the database table to select from
     * column: String name of the column to select from
     * constraint: String containing value for select constraints
     * creates select statement: "SELECT "column" FROM "table" WHERE "constraint";"
     * returns: String of result from select statement, or null if unsuccessful
	 * @throws ClassNotFoundException 
	 * @throws SQLException 
     */
    public String selectDB(String table, String column, String constraint) throws ClassNotFoundException, SQLException {
    
    	String result = null;
    	Connection con;
    	
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://earth.cs.utep.edu/cs4311team1sp14","cs4311team1sp14","teamTBA"); 
		
		String queryString = "SELECT "+column+" FROM "+table+" WHERE "+constraint+";";
				   
		Statement stmt = con.createStatement();
		ResultSet rst = stmt.executeQuery(queryString);
		
		rst.next();
		if(!rst.wasNull()){
			result = rst.getString(column);
		}
		return result; 
    }
    
    
    public ResultSet selectResultSet( String table, String column, String constraint) throws ClassNotFoundException, SQLException
    {
    	String result = null;
    	Connection con;
    	
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://earth.cs.utep.edu/cs4311team1sp14","cs4311team1sp14","teamTBA"); 
		
		String queryString = "SELECT "+column+" FROM "+table+" WHERE "+constraint+";";
		
		Statement stmt = con.createStatement();
		ResultSet rst = stmt.executeQuery(queryString);
		
		return rst;
    }
    
    
    /**
     * Log to the database
     * receives parameters:
     * table: String name of the database table to insert to
     * columns: String containing names of the columns to insert to, separated by commas IE. "column1, column2, column3"
     * values: String containing values to insert, separated by commas IE. "value1, value2, value3"
     * creates insert statement: "INSERT INTO table (column1, column2, column3) VALUES ("value1", "value2", "value3");"
     * @throws ClassNotFoundException 
     * @throws SQLException 
     */
    public boolean insertDB(String table, String columns, String value) throws ClassNotFoundException, SQLException {
    	
    	String[] insertValues = explode(value);
    	int items = insertValues.length;
    	boolean warning = false;
    	Connection con;
    	
     
    	// set connection
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://earth.cs.utep.edu/cs4311team1sp14","cs4311team1sp14","teamTBA"); 
        
        String queryString = "INSERT INTO "+table+" ("+columns+") VALUES (\""+insertValues[0]+"\"";
        if(items>1){
        	for (int i=1; i<items; i++){
        		if( insertValues[i].equalsIgnoreCase("NOW()") )
        		{
        			queryString += ", " + insertValues[i];
        		}
        		else
        		{
        		
        			queryString += ", \""+insertValues[i]+"\"";
        		}
        	}
        }
        queryString += ");";
        
        Statement call = con.createStatement();
        call.execute(queryString);
        warning = true;
        return warning;
        
    }
    
  //receives a comma delimited string and returns a string array of the input string split by the commas
    private static String[] explode(String value) {
    	 	  	
    	StringTokenizer st = new StringTokenizer(value, ",");
    	String[] values = new String[st.countTokens()];
    	int i = 0;
    	while (st.hasMoreElements()){
        	values[i] = (String) st.nextElement();
    		i++;
        }
    	
    	return values;
    }
	
}
