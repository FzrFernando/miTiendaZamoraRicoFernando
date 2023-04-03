package miTiendaZamoraRicoFernando.accesoDatos;

import java.sql.Connection;
import java.sql.Statement;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.query.Query;

import miTiendaZamoraRicoFernando.logica.Product;

public class ProductDAO {
	
	private StandardServiceRegistry sr;
	private SessionFactory sf;
	private Session session;
	
	private Connection conexion;

	public ProductDAO() {
		sr = new StandardServiceRegistryBuilder().configure().build();
		sf = new MetadataSources(sr).buildMetadata().buildSessionFactory();
		session = sf.openSession();
	}
	
	public boolean addAndEditProduct(Product p) throws Exception {
		boolean add = false;
		try {
			session.getTransaction().begin();
			session.saveOrUpdate(p);
			session.getTransaction().commit();
			add = true;
		}
		catch (Exception e) {
			throw new Exception("Es imposible aÃ±adir o editar el producto");
		}
		return add;
	}
	
	public boolean deleteProduct(Product p) throws Exception {
		boolean del = false;
		try {
			session.getTransaction().begin();
			session.delete(p);
			session.getTransaction().commit();
			del = true;
		}
		catch (Exception e) {
			throw new Exception("Es imposible borrar el producto");
		}
		return del;
	}
	
	public Product findProduct(int code) throws Exception {
		Product p = null;
		try {
			p = session.get(Product.class, code);
		}
		catch (Exception e) {
			throw new Exception("No ha sido posible encontrar el producto");
		}
		return p;
	}
	
	public boolean updateProduct(Product p, int code) throws Exception {
		boolean result = true;
		Statement insert = (Statement) conexion.createStatement();
		// Se crea un objeto Product igual al que nos pasan
		Product aux = findProduct(code);
		String cadena = "UPDATE PRODUCT SET ";
		boolean coma = false;
		// La coma es falsa para empezar, cuando se cambie un campo se pone a true y se añade la coma
		if (!p.getName().equals(aux.getName())) {
			cadena = cadena + "name='" + p.getName() + "'";
			coma = true;
		}
		// Ahora compararemos si se cambia en la base de datos, por si se cambia que se añada la sentencia
		if (p.getStock() != aux.getStock()) {
			if (coma) {
				cadena += ",";
			}
			cadena = cadena + "stock='" + p.getStock() + "'";
			coma = true;
		}
		if (p.getPrice() != aux.getPrice()) {
			if (coma) {
				cadena += ",";
			}
			cadena = cadena + "price='" + p.getPrice() + "'";
			coma = true;
		}
		if (!p.getDescription().equals(aux.getDescription())) {
			if (coma) {
				cadena += ",";
			}
			cadena = cadena + "disponibility='" + p.getDescription() + "'";
			coma = true;
		}
		if (!p.getCategory().equals(aux.getCategory())) {
			if (coma) {
				cadena += ",";
			}
			cadena = cadena + "category='" + p.getCategory() + "'";
			coma = true;
		}
		
		cadena += "WHERE codProduct='" + code + "';";
		
		System.out.println(cadena);
		if (insert.executeUpdate(cadena) == 0) {
			result = false;
		}
		return result;
	}
	
	public List<Product> returnProduct() {
		Query query = session.createQuery("SELECT p FROM miTiendaZamoraRicoFernando.logica.Product p");
		List<Product> products = (List<Product>) query.getResultList();
		return products;
	}
	
	public List<Product> returnProductCategory(int category) {
		Query query = session.createQuery("SELECT p FROM miTiendaZamoraRicoFernando.logica.Product p WHERE category =" + category );
		List<Product> products = (List<Product>) query.getResultList();
		return products;
	}
}
