package cn.demo.test;

import static org.junit.Assert.*;

import java.util.Date;
import java.util.List;

import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.demo.dao.WalletDao;
import cn.demo.dao.WalletLogOutDao;
import cn.demo.model.Wallet;
import cn.demo.util.IDGenerator;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class WalletDaoTest {

	@Autowired
	private WalletDao walletDao;
	@Autowired
	private WalletLogOutDao wlo;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@Test
	public void testSave() {
		Wallet wallet = new Wallet();
		wallet.setAddressId(IDGenerator.generatorIdHex());
		wallet.setAmount(0.00);
		wallet.setMemId(976);
		wallet.setGenTime(new Date());
		walletDao.save(wallet);
	}
	
	@Test
	public void testFind() {
		String v = "69";
		String x="0";
		List l = walletDao.find1("FROM Wallet  WHERE addressId LIKE  '%"+ v +"%' and locked = "+x);
		System.out.println(l);
	}
	
	@Test
	public void testCount() {
		Integer c = wlo.getCount("from WalletLogOut where finish = 0");
		List l = wlo.find1("from WalletLogOut where finish = 0");
		
		System.out.println(l);
	}
	
	

}
