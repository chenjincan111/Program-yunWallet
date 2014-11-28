package cn.demo.test;

import static org.junit.Assert.*;

import java.util.List;



import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.demo.model.Person;
import cn.demo.service.PersonService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class PersonServiceBeanTest {

	@Autowired
	private PersonService personService;
	
//private static PersonService personService;
//	
//	@BeforeClass
//	public static void setUpBeforeClass() throws Exception {
//		try {
//			ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
//			personService = (PersonService) ctx.getBean("personServiceBean");
//		} catch (Exception e) {
//			System.out.println("erro");
//			e.printStackTrace();
//		}
//	}

	@Test
	public void testSave() {
		personService.save(new Person("dd1"));
	}

	@Test
	public void testUpdate() {
		Person person = personService.getById(720);
		person.setName("oorr11");
		personService.update(person);
	}

	@Test
	public void testDelete() {
		personService.delete(700);
	}

	@Test
	public void testGetById() {
		Person person = personService.getById(720);
		System.out.println(person.getName());
	}

	@Test
	public void testFindAll() {
		List<Person> list = personService.findAll();
		System.out.println(list);
	}

}
