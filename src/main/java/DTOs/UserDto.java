package DTOs;

public class UserDto 
{
	private int uId;
	private String uName;
	private long uContact;
	private String uEmail;
	private String uPassword;
	public int getuId() {
		return uId;
	}
	public void setuId(int uId) {
		this.uId = uId;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public long getuContact() {
		return uContact;
	}
	public void setuContact(long uContact) {
		this.uContact = uContact;
	}
	public String getuEmail() {
		return uEmail;
	}
	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}
	public String getuPassword() {
		return uPassword;
	}
	public void setuPassword(String uPassword) {
		this.uPassword = uPassword;
	}
	
	

}
