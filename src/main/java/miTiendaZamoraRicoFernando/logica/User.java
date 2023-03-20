package miTiendaZamoraRicoFernando.logica;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity(name = "Usuario")
public class User {
	
	@Id
	private String nameuser;
	private String password;
	private String name;
	private Date birthdate;
	private char sex;
	private boolean admin;
	@OneToMany(mappedBy = "user")
	private List<Purchase> purchase;
	
	public User() {
		super();
	}

	public User(String nameuser, String password, String name, Date birthdate, char sex, boolean admin) {
		super();
		this.nameuser = nameuser;
		this.password = password;
		this.name = name;
		this.birthdate = birthdate;
		this.sex = sex;
		this.admin = admin;
		this.purchase = null;
	}

	public String getNameuser() {
		return nameuser;
	}

	public void setNameuser(String nameuser) {
		this.nameuser = nameuser;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}
	
	public String getBirthdateString() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(birthdate);
	}

	public char getSex() {
		return sex;
	}

	public void setSex(char sex) {
		this.sex = sex;
	}

	public boolean isAdmin() {
		return admin;
	}

	public void setAdmin(boolean admin) {
		this.admin = admin;
	}

	public List<Purchase> getPurchase() {
		return purchase;
	}

	public void setPurchase(List<Purchase> purchase) {
		this.purchase = purchase;
	}

	@Override
	public int hashCode() {
		return Objects.hash(nameuser);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		return Objects.equals(nameuser, other.nameuser);
	}

	@Override
	public String toString() {
		return "User [nameuser=" + nameuser + ", password=" + password + ", name=" + name + ", birthdate=" + birthdate
				+ ", sex=" + sex + ", admin=" + admin + ", purchase=" + purchase + "]";
	}
	
	
}
