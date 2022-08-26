package be;

// model/ business/ entity/ Plain Old Java Object class
public class Candidate {

	@Override
	public String toString() {
		return "Student [cname=" + cname + ", address=" + address + ", email=" + email + ", gender=" + gender
				+ ", pname=" + pname + ", regno=" + regno + ", contact=" + contact + ", age=" + age + "]";
	}

	public Candidate(String cname, String address, String email, String gender, String pname, long regno, long contact,
			long age) {
		super();
		this.cname = cname;
		this.address = address;
		this.email = email;
		this.gender = gender;
		this.pname = pname;
		this.regno = regno;
		this.contact = contact;
		this.age = age;
	}

	public Candidate() {
		super();
		// TODO Auto-generated constructor stub
	}

	private String cname, address, email, gender, pname;
	private long regno, contact, age;

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public long getRegno() {
		return regno;
	}

	public void setRegno(long regno) {
		this.regno = regno;
	}

	public long getContact() {
		return contact;
	}

	public void setContact(long contact) {
		this.contact = contact;
	}

	public long getAge() {
		return age;
	}

	public void setAge(long age) {
		this.age = age;
	}

}
