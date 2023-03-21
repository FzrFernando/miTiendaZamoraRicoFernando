package miTiendaZamoraRicoFernando.accesoDatos;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

import miTiendaZamoraRicoFernando.logica.User;


public class UserDAO {

	StandardServiceRegistry sr;
	SessionFactory sf;
	Session session;
	
	public UserDAO() {
		super();
		this.sr = new StandardServiceRegistryBuilder().configure().build();
		this.sf = new MetadataSources(sr).buildMetadata().buildSessionFactory();
		this.session = sf.openSession();
	}
	
	public boolean validateUser(String login, String password) {
		boolean valid = false;
		User u = (User) session.get(User.class,login);
		if (u != null) {
			if (u.getPassword().equals(password)) {
				valid = true;
			}
		}
		return valid;
	}
	
	public boolean addUser(User u) throws Exception {
		boolean add = false;
		try {
			session.getTransaction().begin();
			session.saveOrUpdate(u);
			session.getTransaction().commit();
			add = true;
		}
		catch (Exception e) {
			throw new Exception("Es imposible añadir el usuario");
		}
		return add;
	}
	
	public User findUser(String nameuser) throws Exception {
		User u = null;
		try {
			u = session.get(User.class, nameuser);
		}
		catch (Exception e) {
			throw new Exception("Es imposible encontrar el usuario");
		}
		return u;
	}
}
