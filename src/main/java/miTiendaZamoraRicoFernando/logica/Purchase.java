package miTiendaZamoraRicoFernando.logica;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity(name="Compra")
@IdClass(PurchaseId.class)
public class Purchase {
	
	@Id
	@ManyToOne
	@JoinColumn(name="idUsuario")
	private User user;

	@Id
	@ManyToOne
	@JoinColumn(name="codProduct")
	private Product product;
	
	private int amount;
	private double price;
	private LocalDate datePurchase;
	
	public Purchase() {
		super();
	}

	public Purchase(User user, Product product, int amount, double price, LocalDate datePurchase) {
		super();
		this.user = user;
		this.product = product;
		this.amount = amount;
		this.price = price;
		this.datePurchase = datePurchase;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public LocalDate getDatePurchase() {
		return datePurchase;
	}
	
	public String getDatePurchaseString() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(datePurchase);
	}

	public void setDatePurchase(LocalDate datePurchase) {
		this.datePurchase = datePurchase;
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
		Purchase other = (Purchase) obj;
		return Objects.equals(product, other.product) && Objects.equals(user, other.user);
	}

	@Override
	public String toString() {
		return "Purchase [user=" + user + ", product=" + product + ", amount=" + amount + ", price=" + price
				+ ", datePurchase=" + datePurchase + "]";
	}
	
	
}
