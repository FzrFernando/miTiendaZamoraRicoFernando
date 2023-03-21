package miTiendaZamoraRicoFernando.logica;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

public class PurchaseId implements Serializable{

	private String user;
	private int product;
	private Date datePurchase;
	
	public PurchaseId() {
		super();
	}

	public PurchaseId(String user, int product, Date datePurchase) {
		super();
		this.user = user;
		this.product = product;
		this.datePurchase = datePurchase;
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

	public Date getDatePurchase() {
		return datePurchase;
	}

	public void setDatePurchase(Date datePurchase) {
		this.datePurchase = datePurchase;
	}

	@Override
	public int hashCode() {
		return Objects.hash(datePurchase, product, user);
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
		return Objects.equals(datePurchase, other.datePurchase) && product == other.product
				&& Objects.equals(user, other.user);
	}

}
