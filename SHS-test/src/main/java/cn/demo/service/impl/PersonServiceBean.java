package cn.demo.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.demo.model.Person;
import cn.demo.service.PersonService;


@Transactional @Service
public class PersonServiceBean implements PersonService {
	@Resource
	private SessionFactory sessionFactory;
	
	public void save(Person person) {
		sessionFactory.getCurrentSession().persist(person);
	}

	public void update(Person person) {
		sessionFactory.getCurrentSession().merge(person);
	}

	public void delete(int id) {
		sessionFactory.getCurrentSession().delete(
				sessionFactory.getCurrentSession().load(Person.class, id));
	}

	@Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)
	public Person getById(int id) {
		return (Person) sessionFactory.getCurrentSession().get(Person.class,id);
	}

	@Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)
	@SuppressWarnings("unchecked")
	public List<Person> findAll() {
		return sessionFactory.getCurrentSession().createQuery("from Person")
				.list();
	}

}
