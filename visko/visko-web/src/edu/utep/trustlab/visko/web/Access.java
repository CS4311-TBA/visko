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
     * creates select statement: "SELECT "column" FROM "table";"
     * returns: String of result from select statement, or null if unsuccessful
     */
	public String selectDB(String table, String column){
	    
    	String result = null;
    	Connection con;
    	
    	try{
    		
    		Class.forName("com.mysql.jdbc.Driver");
    		con = DriverManager.getConnection("jdbc:mysql://earth.cs.utep.edu/cs4311team1sp14","cs4311team1sp14","teamTBA"); 

    		String queryString = "SELECT "+column+" FROM "+table+";";

    		Statement stmt = con.createStatement();
    		ResultSet rst = stmt.executeQuery(queryString);
    		
    		rst.next();
    		if(!rst.wasNull()){
    			result = rst.getString(column);
			}
    		
    		con.close();
        }
        catch(SQLException s){
        	System.out.println("Error connecting to SQL Database: "+ s.getMessage());
        }
    	catch(ClassNotFoundException cnfe)
        {
        	System.out.println("Class Not Found Error: " + cnfe.getMessage());
        }
        catch(Exception e){
        	System.out.println("Error: " + e.getMessage());
        }
        return result; 
	        
	}
	
	 /**
     * retrieve string column from the database
     * receives parameters:
     * table: String name of the database table to select from
     * column: String name of the column to select from
     * constraint: String containing value for select constraints
     * creates select statement: "SELECT "column" FROM "table" WHERE "constraint";"
     * returns: String of result from select statement, or null if unsuccessful
     */
	 public String selectDB(String table, String column, String constraint){
		    
    	String result = null;
    	Connection con;
    	
    	try{
    		
    		Class.forName("com.mysql.jdbc.Driver");
    		con = DriverManager.getConnection("jdbc:mysql://earth.cs.utep.edu/cs4311team1sp14","cs4311team1sp14","teamTBA"); 

    		String queryString = "SELECT "+column+" FROM "+table+" WHERE "+constraint+";";

    		Statement stmt = con.createStatement();
    		ResultSet rst = stmt.executeQuery(queryString);
    		
    		rst.next();
    		if(!rst.wasNull()){
    			result = rst.getString(column);
			}
    		
    		con.close();
        }
        catch(SQLException s){
        	System.out.println("Error connecting to SQL Database: "+ s.getMessage());
        }
    	catch(ClassNotFoundException cnfe)
        {
        	System.out.println("Class Not Found Error: " + cnfe.getMessage());
        }
        catch(Exception e){
        	System.out.println("Error: " + e.getMessage());
        }
        return result; 
	        
	}
	 
	 
	 /**
	     * retrieve maximum cell from column specified from the database
	     * receives parameters:
	     * table: String name of the database table to select from
	     * column: String name of the column to select from
	     * constraint: String containing value for select constraints
	     * creates select statement: "SELECT MAX("column") FROM "table" WHERE "constraint";"
	     * returns: String of result from select statement, or null if unsuccessful
	     */
	 public String selectMaxID(String table, String column, String constraint){
		    
    	String result = null;
    	Connection con;
    	
    	try{
    		
    		Class.forName("com.mysql.jdbc.Driver");
    		con = DriverManager.getConnection("jdbc:mysql://earth.cs.utep.edu/cs4311team1sp14","cs4311team1sp14","teamTBA"); 

    		String queryString = "SELECT MAX("+column+") FROM "+table+" WHERE "+constraint+";";

    		Statement stmt = con.createStatement();
    		ResultSet rst = stmt.executeQuery(queryString);
    		
    		rst.next();
    		if(!rst.wasNull()){
    			result = rst.getString("MAX("+column+")");
			}
    		
    		con.close();
        }
        catch(SQLException s){
        	System.out.println("Error connecting to SQL Database: "+ s.getMessage());
        }
    	catch(ClassNotFoundException cnfe)
        {
        	System.out.println("Class Not Found Error: " + cnfe.getMessage());
        }
        catch(Exception e){
        	System.out.println("Error: " + e.getMessage());
        }
        return result; 
	        
	}
	 
	 /**
	     * retrieve maximum cell from column specified from the database
	     * receives parameters:
	     * table: String name of the database table to select from
	     * column: String name of the column to select from
	     * creates select statement: "SELECT MAX("column") FROM "table";"
	     * returns: String of result from select statement, or null if unsuccessful
	     */
	 public String selectMaxID(String table, String column){
		    
	 	String result = null;
	 	Connection con;
	 	
	 	try{
	 		
	 		Class.forName("com.mysql.jdbc.Driver");
	 		con = DriverManager.getConnection("jdbc:mysql://earth.cs.utep.edu/cs4311team1sp14","cs4311team1sp14","teamTBA"); 
	
	 		String queryString = "SELECT MAX("+column+") FROM "+table+";";
	
	 		Statement stmt = con.createStatement();
	 		ResultSet rst = stmt.executeQuery(queryString);
	 		
	 		rst.next();
	 		if(!rst.wasNull()){
	 			result = rst.getString("MAX("+column+")");
				}
	 		
	 		con.close();
	     }
	     catch(SQLException s){
	     	System.out.println("Error connecting to SQL Database: "+ s.getMessage());
	     }
	 	catch(ClassNotFoundException cnfe)
	     {
	     	System.out.println("Class Not Found Error: " + cnfe.getMessage());
	     }
	     catch(Exception e){
	     	System.out.println("Error: " + e.getMessage());
	     }
	     return result; 
	        
	}
    
    
    public ResultSet selectResultSet( String table, String column, String constraint){
    	
    	ResultSet result = null;
    	Connection con;
    	
    	try{
    		
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://earth.cs.utep.edu/cs4311team1sp14","cs4311team1sp14","teamTBA"); 
			
			String queryString = "SELECT "+column+" FROM "+table+" WHERE "+constraint+";";
			
			System.out.println(":"+queryString+":");//testing
			
			Statement stmt = con.createStatement();
			result = stmt.executeQuery(queryString);
			
			con.commit();
			con.close();
    	}
    	catch(SQLException s){
        	System.out.println("Error connecting to SQL Database: "+ s.getMessage());
        }
    	catch(ClassNotFoundException cnfe)
        {
        	System.out.println("Class Not Found Error: " + cnfe.getMessage());
        }
        catch(Exception e){
        	System.out.println("Error: " + e.getMessage());
        }
 
		return result;
    }
    
    
    /**
     * Log to the database
     * receives parameters:
     * table: String name of the database table to insert to
     * columns: String containing names of the columns to insert to, separated by commas IE. "column1, column2, column3"
     * values: String containing values to insert, separated by commas IE. "value1, value2, value3"
     * creates insert statement: "INSERT INTO table (column1, column2, column3) VALUES ("value1", "value2", "value3");"
     */
    public boolean insertDB(String table, String columns, String value){
    	
    	String[] insertValues = explode(value);
    	int items = insertValues.length;
    	boolean success = false;
    	Connection con;
    	
    	try{
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
	        
	        //System.out.println(":"+queryString+":");//testing
	        
	        Statement call = con.createStatement();
	        call.execute(queryString);
	        success = true;
	        
	        con.close();
    	}
        catch(SQLException sqle)
        {
        	System.out.println("Database Error: " + sqle.getMessage());
        }
        catch(ClassNotFoundException cnfe)
        {
        	System.out.println("Class Not Found Error: " + cnfe.getMessage());
        }
        catch(Exception e){
        	System.out.println("Error: " + e.getMessage());
        }
    	
        return success;     
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
    
    /*
     * UPDATE table_name
SET column1=value1,column2=value2,...
WHERE some_column=some_value;
     */
	 /**
     * retrieve string column from the database
     * receives parameters:
     * table: String name of the database table to select from
     * Ucolumn: String name of the column to be updated
     * Uvalue: String value to be updated to
     * Ccolumn: String name of the constraint column to be checked
     * Cvalue: String value of the Ccolumn to checked for
     * creates update statement: "UPDATE "table" SET "Ucolumn"='"Uvalue"' WHERE "Ccolumn"='"Cvalue"';"
     */
	 public boolean updateDB(String table, String Ucolumn, String Uvalue, String Ccolumn, String Cvalue){
		    
    	boolean success = false;
    	Connection con;
    	
    	try{
    		
    		Class.forName("com.mysql.jdbc.Driver");
    		con = DriverManager.getConnection("jdbc:mysql://earth.cs.utep.edu/cs4311team1sp14","cs4311team1sp14","teamTBA"); 

    		String queryString = "UPDATE "+table+" SET "+Ucolumn+"='"+Uvalue+"' WHERE "+Ccolumn+"='"+Cvalue+"';";

    		Statement call = con.createStatement();
	        call.execute(queryString);
	        success = true;
	        
	        con.close();
        }
        catch(SQLException s){
        	System.out.println("Error connecting to SQL Database: "+ s.getMessage());
        }
    	catch(ClassNotFoundException cnfe)
        {
        	System.out.println("Class Not Found Error: " + cnfe.getMessage());
        }
        catch(Exception e){
        	System.out.println("Error: " + e.getMessage());
        }
        return success; 
	        
	}
	 
	 
    public void updateServiceDB() {
 	  	
    	
    }
    
	
}
