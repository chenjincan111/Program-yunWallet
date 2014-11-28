package cn.demo.dao;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;



@Transactional @Service
public abstract class BaseDao<T,PK extends Serializable>{

	private Class<T> entityClass;
	
	@SuppressWarnings("unchecked")
	public BaseDao() {
//		entityClass = (Class<T>) ((ParameterizedType) getClass()
//				.getGenericSuperclass()).getActualTypeArguments()[0];
	}
	
	@Resource
	private SessionFactory sessionFactory;
	
	public void save(T entity) {
		sessionFactory.getCurrentSession().persist(entity);
	}

	public void update(T entity) {
		sessionFactory.getCurrentSession().merge(entity);
	}

	public void delete(PK id) {
		sessionFactory.getCurrentSession().delete(
				sessionFactory.getCurrentSession().load(entityClass, id));
	}

	@Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)
	public T getById(PK id) {
		return (T) sessionFactory.getCurrentSession().get(entityClass,id);
	}

	@Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)
	@SuppressWarnings("unchecked")
	public List<T> findAll() {
		return sessionFactory.getCurrentSession().createQuery("from"+entityClass.getSimpleName())
				.list();
	}
	
}
