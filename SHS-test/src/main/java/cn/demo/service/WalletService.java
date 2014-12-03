package cn.demo.service;

import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.demo.common.PageConstants;
import cn.demo.common.PageRequest;
import cn.demo.common.PageResult;
import cn.demo.dao.WalletDao;
import cn.demo.model.Wallet;
import cn.demo.util.IDGenerator;


@Service
public class WalletService {
	private static Logger logger = Logger.getLogger(WalletService.class);

	@Autowired
	private WalletDao walletDao;
//	@Autowired
//	private PageConstants constants;

	public PageResult<Wallet> pageResault(Wallet search, int currentPage) {
		if (search == null) {
			search = new Wallet();
		}

		if (currentPage == 0) {
			currentPage = 1;
		}

		PageRequest<Wallet> request = new PageRequest<Wallet>(search,
				currentPage, 5);
		List<Wallet> list = walletDao.find(request.getHql(),
				request.getOffset(), request.getMax());
		int allPage = walletDao.getCount(request.getHql());
		System.out.println(allPage);
		PageResult<Wallet> result = new PageResult<Wallet>(list, allPage,
				currentPage, request.getMax());
		return result;
	}
	
	/**
	 * 新建钱包
	 * 
	 * @param memId
	 */
	public void newWallet(int memId) {
		List<Wallet> list = walletDao.find("from Wallet where memId=?", memId);
//		if (list.size() >= 5) {
//			return;
//		}
		Wallet wallet = new Wallet();
		wallet.setAddressId(IDGenerator.generatorIdHex());
		wallet.setAmount(0.00);
		wallet.setMemId(memId);
		wallet.setGenTime(new Date());
		walletDao.save(wallet);
		System.out.println("save wallet");
		//logger.info("ID:" + memId + ",新建立钱包地址");
	}
	
	/**
	 * 模糊查询
	 * 
	 * @param memId
	 */
	public void getWallet(int memId) {
		List<Wallet> list = walletDao.find("from Wallet where memId=?", memId);
//		if (list.size() >= 5) {
//			return;
//		}
		Wallet wallet = new Wallet();
		wallet.setAddressId(IDGenerator.generatorIdHex());
		wallet.setAmount(0.00);
		wallet.setMemId(memId);
		wallet.setGenTime(new Date());
		walletDao.save(wallet);
		System.out.println("save wallet");
		//logger.info("ID:" + memId + ",新建立钱包地址");
	}

	/**
	 * 获取钱包
	 * 
	 * @param addressId
	 * @return
	 */
	public Wallet getWallet(String addressId) {
		return walletDao.get(addressId);
	}
	
	public void deleteWallet(Wallet entity){
		walletDao.delete(entity);
	}
	
	public void updateWallet(Wallet entity){
		walletDao.update(entity);
	}
	
}
