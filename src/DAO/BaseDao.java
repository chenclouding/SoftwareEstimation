package DAO;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;

public interface BaseDao<T> {
	T get(Session sess, Class<T> clazz, Serializable id);
	Serializable save(Session sess, T entity)throws Exception;
	void delete(Session sess, T entity);
	void delete(Session sess, Class<T> clazz, Serializable id);
	void update(Session sess, T entity);
	List<T> findAll(Session sess, Class<T> clazz);
}
