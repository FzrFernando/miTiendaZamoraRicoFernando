package miTiendaZamoraRicoFernando.logica;

import java.io.Serializable;
import java.util.Objects;

public class PurchaseId implements Serializable{

	private String user;
	private int product;
	
	public PurchaseId() {
		super();
	}

	public PurchaseId(String user, int product) {
		super();
		this.user = user;
		this.product = product;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public int getProduct() {
		return product;
	}

	public void setProduct(int product) {
		this.product = product;
	}

	@Override
	public int hashCode() {
		return Objects.hash(product, user);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PurchaseId other = (PurchaseId) obj;
		return product == other.product && Objects.equals(user, other.user);
	}
	
	
}
