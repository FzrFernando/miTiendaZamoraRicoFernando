package miTiendaZamoraRicoFernando.accesoDatos;

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
			throw new Exception("Es imposible añadir o editar el producto");
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
