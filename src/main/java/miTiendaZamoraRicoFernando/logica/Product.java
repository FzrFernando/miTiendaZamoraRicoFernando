package miTiendaZamoraRicoFernando.logica;

import java.util.Date;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity(name = "Producto")
public class Product {
	@Id
	@Column(name = "codProduct")
	private int code;
	private String name;
	private String description;
	private int stock;
	private double price;
	@ManyToOne
	@JoinColumn(name = "category") // Nombre de la columna en la BBDD, que es FK
	private Category category;
	@OneToMany(mappedBy = "product")
	private List<Purchase> purchase;
	
	public Product() {
		super();
	}

	public Product(int code, String name, String description, int stock, double price, Category category) {
		super();
		this.code = code;
		this.name = name;
		this.description = description;
		this.stock = stock;
		this.price = price;
		this.category = category;
		this.purchase = null;
	}

	public Product(String name, String description, int stock, double price, Category category) {
		super();
		this.name = name;
		this.description = description;
		this.stock = stock;
		this.price = price;
		this.category = category;
		this.purchase = null;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public List<Purchase> getPurchase() {
		return purchase;
	}

	public void setPurchase(List<Purchase> purchase) {
		this.purchase = purchase;
	}

	@Override
	public int hashCode() {
		return Objects.hash(code);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Product other = (Product) obj;
		return code == other.code;
	}

	@Override
	public String toString() {
		return "Product [code=" + code + ", name=" + name + ", description=" + description + ", stock=" + stock
				+ ", price=" + price + ", category=" + category + ", purchase=" + purchase + "]";
	}
	
	
}
