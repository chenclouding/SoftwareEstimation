package dao;

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
	 * 插入数据
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
	 * 更新数据库
	 * 
	 * @param object
	 */
	/*
	 * public void update(T object) {
	 * 
	 * SessionFactory sf = getSessionFactory(); Session session =
	 * sf.openSession();
	 * 
	 * try { session.beginTransaction(); session.update(object);
	 * session.getTransaction().commit(); } catch (Exception e) {
	 * session.getTransaction().rollback(); } finally { session.close(); } }
	 *//**
	 * 从数据库中删除
	 * 
	 * @param object
	 */
	/*
	 * public void delete(T object) {
	 * 
	 * SessionFactory sf = getSessionFactory(); Session session =
	 * sf.openSession();
	 * 
	 * try { session.beginTransaction(); session.delete(object);
	 * session.getTransaction().commit(); } catch (Exception e) {
	 * session.getTransaction().rollback(); } finally { session.close(); } }
	 *//**
	 * 查找单个Entity Bean
	 * 
	 * @param clazz
	 * @param id
	 * @return
	 */
	/*
	 * @SuppressWarnings("unchecked") public T find(Class<? extends T> clazz,
	 * Serializable id) {
	 * 
	 * Session session = HibernateSessionFactory.getSessionFactory()
	 * .openSession(); try { session.beginTransaction(); return (T)
	 * session.get(clazz, id); } finally { session.getTransaction().commit();
	 * session.close(); } }
	 *//**
	 * 查找多个Entity Bean
	 * 
	 * @param hql
	 * @return
	 */
	/*
	 * @SuppressWarnings("unchecked") public List<T> list(String hql) {
	 * 
	 * Session session = HibernateSessionFactory.getSessionFactory()
	 * .openSession(); try { session.beginTransaction(); return
	 * session.createQuery(hql).list(); } finally {
	 * session.getTransaction().commit(); session.close(); } }
	 */
}
