package dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class BaseDAO<T> {
	public SessionFactory getSessionFactory() {
		Configuration config = new Configuration().configure();
		ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
				.applySettings(config.getProperties()).build();
		SessionFactory sf = config.buildSessionFactory(serviceRegistry);
		return sf;
	}

	/**
	 * 
	 * @param object
	 */
	public void create(T object) {
		SessionFactory sf = getSessionFactory();
		Session session = sf.openSession();
		try {
			session.beginTransaction();
			session.persist(object);
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
		} finally {
			session.close();
			sf.close();
		}
	}

	/**
	 * 
	 * @param object
	 */
	
	  public void update(T object) {
	  
	  SessionFactory sf = getSessionFactory(); Session session =
	  sf.openSession();
	  
	  try { session.beginTransaction(); session.update(object);
	  session.getTransaction().commit(); } 
	  catch (Exception e) {
		  session.getTransaction().rollback(); 
	  } 
	  finally { session.close(); } }
	 /**
	 * 
	 * @param object
	 */	
	public void delete(T object) {

		SessionFactory sf = getSessionFactory();
		Session session = sf.openSession();

		try {
			session.beginTransaction();
			session.delete(object);
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
	}
	
	 /**
	 * 
	 * @param clazz
	 * @param id
	 * @return
	 */
	public T find(Class<? extends T> clazz, Serializable id) {
		SessionFactory sf = getSessionFactory();
		Session session = sf.openSession();
		try {
			session.beginTransaction();
			return (T)session.get(clazz, id);
		} finally {
			session.getTransaction().commit();
			session.close();
			sf.close();
		}
	}

	 /**
	 * 
	 * @param hql
	 * @return
	 */
	
	public List<T> list(String hql) {
		SessionFactory sf = getSessionFactory();
		Session session = sf.openSession();
		try {
			session.beginTransaction();
			return session.createQuery(hql).list();
		} finally {
			session.getTransaction().commit();
			session.close();
			sf.close();
		}
	}
	 
}
