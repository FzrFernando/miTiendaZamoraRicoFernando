package miTiendaZamoraRicoFernando.accesoDatos;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.query.Query;

import miTiendaZamoraRicoFernando.logica.Category;


public class CategoryDAO {

	private StandardServiceRegistry sr;
	private SessionFactory sf;
	private Session session;
	
	public CategoryDAO() {
		sr = new StandardServiceRegistryBuilder().configure().build();
		sf = new MetadataSources(sr).buildMetadata().buildSessionFactory();
		session = sf.openSession();
	}
	
	public boolean addAndEditCategory(Category c) throws Exception {
		boolean add = false;
		try {
			session.getTransaction().begin();
			session.saveOrUpdate(c);
			session.getTransaction().commit();
			add = true;
		}
		catch (Exception e) {
			throw new Exception("Es imposible añadir o editar la categoría");
		}
		return add;
	}
	
	public boolean deleteCategory(Category c) throws Exception {
		boolean del = false;
		try {
			session.getTransaction().begin();
			session.delete(c);
			session.getTransaction().commit();
			del = true;
		}
		catch (Exception e) {
			throw new Exception("Es imposible borrar la categoría");
		}
		return del;
	}
	
	public Category findCategory(int code) throws Exception {
		Category c = null;
		try {
			c = session.get(Category.class, code);
		}
		catch (Exception e) {
			throw new Exception("No es posible encontrar la categoría");
		}
		return c;
	}
	
	public List<Category> returnCategory() {
		Query query = session.createQuery("SELECT c FROM miTiendaZamoraRicoFernando.logica.Category c");
		List<Category> products = (List<Category>) query.getResultList();
		return products;
	}
}
