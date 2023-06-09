package miTiendaZamoraRicoFernando.accesoDatos;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.query.Query;

import miTiendaZamoraRicoFernando.logica.Product;
import miTiendaZamoraRicoFernando.logica.Purchase;
import miTiendaZamoraRicoFernando.logica.User;


public class PurchaseDAO {

	private StandardServiceRegistry sr;
	private SessionFactory sf;
	private Session session;
	
	public PurchaseDAO() {
		sr = new StandardServiceRegistryBuilder().configure().build();
		sf = new MetadataSources(sr).buildMetadata().buildSessionFactory();
		session = sf.openSession();
	}
	
	public Purchase findPurchase(int code) throws Exception {
		Purchase p = null;
		try {
			p = session.get(Purchase.class, code);
		}
		catch (Exception e) {
			throw new Exception("No se encuentra la compra");
		}
		return p;
	}
	
	public boolean addPurchase(Purchase p) throws Exception {
		boolean add = false;

		// Voy a asegurarme que el usuario ya está en base de datos
		
		UserDAO userDao = new UserDAO();
		try {
			User comprobarUser = userDao.findUser(p.getUser().getNameuser());
		} catch(Exception e) {
			throw new Exception("No se encuentra el usuario");
		}
		
		// Comprobar que el artículo existe
		ProductDAO productDao = new ProductDAO();
		try {
			Product comprobacionProduct = productDao.findProduct(p.getProduct().getCode());
			
		}catch (Exception e) {
			throw new Exception("Producto no existente");
		}
		
		// Comprobar que el stock es mayor que el stock que quiera comprar
		if (p.getAmount() > p.getProduct().getStock()) {
			throw new Exception("No hay suficiente stock");
		}
		try {
			session.getTransaction().begin();
			session.saveOrUpdate(p);
			session.getTransaction().commit();
			add = true;
		}
		catch (Exception e) {
			throw new Exception("Es imposible añadir la compra");
		}
		return add;
	}
	
	public List<Purchase> returnPurchase() {
		Query query = session.createQuery("SELECT p FROM miTiendaZamoraRicoFernando.logica.Purchase p");
		List<Purchase> products = (List<Purchase>) query.getResultList();
		return products;
	}
}
