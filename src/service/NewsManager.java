package service;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

import Bean.News;

public class NewsManager {
	public static void main(String[] args) throws Exception{
		Configuration config =new Configuration().configure();
        ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(
        		config.getProperties()).build();
        SessionFactory sf = config.buildSessionFactory(serviceRegistry);
		Session sess=sf.openSession();
		Transaction tx=sess.beginTransaction();
		
		News n=new News();
		n.setTitle("hahah");
		n.setContent("wuwuwu");
		sess.save(n);
		tx.commit();
		sess.close();
		sf.close();
	}
}
