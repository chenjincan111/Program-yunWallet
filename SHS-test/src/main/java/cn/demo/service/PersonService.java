package cn.demo.service;

import java.util.List;

import cn.demo.model.Person;

public interface PersonService {

	public abstract void save(Person person);

	public abstract void update(Person person);

	public abstract void delete(int id);

	public abstract Person getById(int id);

	public abstract List<Person> findAll();

}