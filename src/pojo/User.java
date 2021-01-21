package pojo;

public class User {

		private String fname;
	    private String lname;
	    private String username;
	    private String password;
	    private String email;
	    private String contact;
	    
	    public String getFname() {
	        return fname;
	    }
	    public void setFname(String firstname) {
	        this.fname = firstname;
	    }
	    
	    public String getLname() {
	        return lname;
	    }
	    public void setLname(String lastname) {
	        this.lname = lastname;
	    }
	    
	    public String getUsername() {
	        return username;
	    }
	    public void setUsername(String username) {
	        this.username = username;
	    }
	    
	    public String getPassword() {
	        return password;
	    }
	    public void setPassword(String password) {
	        this.password = password;
	    }
	    
	    public String getEmail() {
	        return email;
	    }
	    public void setEmail(String address) {
	        this.email = address;
	    }
	    
	    public String getContact() {
	        return contact;
	    }
	    public void setContact(String contact) {
	        this.contact = contact;
	    }
}
