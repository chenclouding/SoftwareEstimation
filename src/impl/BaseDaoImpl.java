package impl;

import java.io.Serializable;
import java.lang.reflect.Method;
import java.util.List;

import org.hibernate.Session;

import DAO.BaseDao;

public class BaseDaoImpl<T> implements BaseDao<T> {
	public T get(Session sess, Class<T> clazz, Serializable id){
		return (T)sess.get(clazz, id);
	}
	public Serializable save(Session sess, T entity)throws Exception{
		sess.save(entity);
		Method getId = entity.getClass().getMethod("getId");
		return (Serializable)getId.invoke(entity);
	}
	public void delete(Session sess, T entity){
		sess.delete(entity);
	}
	public void delete(Session sess, Class<T> clazz, Serializable id){
		sess.delete(get(sess,clazz,id));
	}
	public void update(Session sess, T entity){
		sess.saveOrUpdate(entity);
	}
	public List<T> findAll(Session sess, Class<T> clazz){
		return sess.createQuery("select en from "+clazz.getSimpleName() + " en").list();
	}
}
