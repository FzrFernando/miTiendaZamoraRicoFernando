package miTiendaZamoraRicoFernando.accesoDatos;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.query.Query;

import miTiendaZamoraRicoFernando.logica.Purchase;


public class PurchaseDAO {

	private StandardServiceRegistry sr;
	private SessionFactory sf;
	private Session session;
	
	public PurchaseDAO() {
		sr = new StandardServiceRegistryBuilder().configure().build();
		sf = new MetadataSources(sr).buildMetadata().buildSessionFactory();
		session = sf.openSession();
	}
	
	public Purchase findPurchase(int code) {
		Purchase p = null;
		try {
			p = session.get(Purchase.class, code);
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return p;
	}
	
	public boolean addPurchase(Purchase p) {
		boolean add = false;
		try {
			session.getTransaction().begin();
			session.saveOrUpdate(p);
			session.getTransaction().commit();
			add = true;
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return add;
	}
	
	public List<Purchase> returnPurchase() {
		Query query = session.createQuery("SELECT p FROM proyectoJPA.logica.Purchase p");
		List<Purchase> products = (List<Purchase>) query.getResultList();
		return products;
	}
}
