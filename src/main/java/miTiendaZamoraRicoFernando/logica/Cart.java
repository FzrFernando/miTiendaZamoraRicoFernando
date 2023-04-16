package miTiendaZamoraRicoFernando.logica;

import java.util.HashMap;
import java.util.Objects;
import java.util.Set;

public class Cart {
	private  HashMap<Product, Integer> listCart;

	public Cart() {
		super();
		this.listCart = new  HashMap<Product, Integer>();
	}

	public HashMap<Product, Integer> getListCart() {
		return listCart;
	}

	public Set<Product> getKeyCart() {
		return this.listCart.keySet();
	}
	
	public int getUnit(Product a) {
		return this.listCart.get(a);
	}
	
	public void setListCart(HashMap<Product, Integer> listCart) {
		this.listCart = listCart;
	}

	@Override
	public int hashCode() {
		return Objects.hash(listCart);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Cart other = (Cart) obj;
		return Objects.equals(listCart, other.listCart);
	}

	public void clearCart() {
		this.listCart.clear();
	}
	
	public void addCart(Product product, Integer stock)  throws Exception {
		
		 if(this.listCart.containsKey(product)) {
				if(this.listCart.get(product)+stock > product.getStock()) {
					throw new Exception("No hay stock suficiente");
				}else {
					this.listCart.put(product, this.listCart.get(product)+stock);
				}
			}else {
				if(stock> product.getStock()) {
					throw new Exception("No hay stock suficiente");
				}else {
					this.listCart.put(product, stock);
				}
				
			}
	}
	
	public void removeProduct(Product product) {
		if(this.listCart.containsKey(product)) {
			this.listCart.remove(product);
		}
	}
	
	public int sizeCart() {
		if(this.listCart==null) {
			return 0;
		}else {
			return this.listCart.size();
		}
		
	}
}
