package cn.demo.service;

import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import cn.demo.common.PageConstants;
import cn.demo.common.PageRequest;
import cn.demo.common.PageResult;
import cn.demo.dao.MemberDao;
import cn.demo.dao.WalletDao;
import cn.demo.dao.WalletLogInDao;
import cn.demo.dao.WalletLogOutDao;
import cn.demo.model.Member;
import cn.demo.model.Wallet;
import cn.demo.model.WalletLogIn;
import cn.demo.model.WalletLogOut;


@Service
public class WalletLogService {

	public static Logger logger = Logger.getLogger(WalletLogService.class);

	@Autowired
	private WalletLogOutDao logOutDao;
	@Autowired
	private WalletLogInDao logInDao;
	@Autowired
	private PageConstants constants;
	@Autowired
	private WalletDao walletDao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private MemberService memberService;

	/**
	 * 汇出记录
	 * 
	 * @param logout
	 */
	public void outLog(WalletLogOut logout) {
		logOutDao.save(logout);
	}

	/**
	 * 批量做汇入
	 */
	@Scheduled(fixedDelay = 120000)
	public void inLog() {
		List<WalletLogOut> outLogs = logOutDao.find(
				"from WalletLogOut where finish = ?", false);
		logger.info("检索转账");
		if (null == outLogs)
			return;
		for (WalletLogOut outLog : outLogs) {
			Wallet walletFrom = walletDao.get(outLog.getAddress());
			if (walletFrom == null) {
				// 无此地址
				continue;
			}
			Wallet walletTo = walletDao.get(outLog.getToAddress());
			if (null == walletTo) {
				// 无此地址
				continue;
			}
			Member member = memberDao.get(walletTo.getMemId());
			if (null == member) {
				// 无此用户
				continue;
			}
			WalletLogIn inLog = new WalletLogIn();
			inLog.setAddress(outLog.getToAddress());
			inLog.setAmount(outLog.getAmount());
			inLog.setFromAddress(outLog.getAddress());
			inLog.setGenTime(new Date());
			inLog.setMemId(member.getmId());
			logger.info("向"+outLog.getToAddress()+"转入"+outLog.getAmount());
			logInDao.save(inLog);
			logOutAccount(outLog);
			logInAccount(inLog);
			outLog.setFinish(true);
			logOutDao.update(outLog);
		}

	}
	/*
	 * 从address转出amount到
	 */
	public void logOutAccount(WalletLogOut outLog){
		Wallet wallet = walletDao.get(outLog.getAddress());
		wallet.setAmount(wallet.getAmount()-outLog.getAmount());
		walletDao.update(wallet);
		memberService.sendAmountOutMail(wallet, outLog);
		logger.info("已转出");
		
	}
	/*
	 * 传入amount到address
	 */
	public void logInAccount(WalletLogIn inLog){
		Wallet wallet = walletDao.get(inLog.getAddress());
		wallet.setAmount(wallet.getAmount()+inLog.getAmount());
		walletDao.update(wallet);	
		memberService.sendAmountInMail(wallet, inLog);
		logger.info("已转入");
	}
	
	

	/**
	 * 汇出记录结果集
	 * 
	 * @param search
	 * @param currentPage
	 * @return
	 */
	public PageResult<WalletLogOut> logOutPageResult(WalletLogOut search,
			int currentPage) {
		if (search == null) {
			search = new WalletLogOut();
		}

		if (currentPage == 0) {
			currentPage = 1;
		}

		PageRequest<WalletLogOut> request = new PageRequest<WalletLogOut>(
				search, currentPage, 5);
		List<WalletLogOut> list = logOutDao.find(request.getHql(),
				request.getOffset(), request.getMax());
		int allPage = logOutDao.getCount(request.getHql());
		PageResult<WalletLogOut> result = new PageResult<WalletLogOut>(list,
				allPage, currentPage, request.getMax());
		return result;
	}
	
	public int getCount(){
		return logOutDao.getCount("from WalletLogOut where finish = 0");
	}
	public List getUnfinish(){
		return logOutDao.find1("from WalletLogOut where finish = 0");
	}

	/**
	 * 汇入记录结果集
	 * 
	 * @param search
	 * @param currentPage
	 * @return
	 */
	public PageResult<WalletLogIn> logInPageResult(WalletLogIn search,
			int currentPage) {
		if (search == null) {
			search = new WalletLogIn();
		}

		if (currentPage == 0) {
			currentPage = 1;
		}

		PageRequest<WalletLogIn> request = new PageRequest<WalletLogIn>(search,
				currentPage, 5);
		List<WalletLogIn> list = logInDao.find(request.getHql(),
				request.getOffset(), request.getMax());
		int allPage = logInDao.getCount(request.getHql());
		PageResult<WalletLogIn> result = new PageResult<WalletLogIn>(list,
				allPage, currentPage, request.getMax());
		return result;
	}

}
