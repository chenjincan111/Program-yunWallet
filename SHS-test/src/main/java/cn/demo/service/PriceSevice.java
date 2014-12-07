package cn.demo.service;

import java.util.Date;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import cn.demo.util.HttpTookit;


@Service
public class PriceSevice {

	private static final Logger logger = Logger.getLogger(PriceSevice.class);
	
	public String getPriceFromNet() {
		logger.info("开始向BTCWTO取当前比特币价格" + new Date().getTime());
		String html = HttpTookit.doGet("http://www.btcwto.com/", null, "utf-8",
				true);
		Document doc = Jsoup.parse(html);
		
		Element price = doc.getElementsByClass("col-lg-12").get(0);
		Element price1 = doc.getElementsByClass("col-lg-12").get(2);
		
		//Element price = doc.getElementById("bit-last");
		
		if (null == price||null==price1) {
			logger.error("Price is null...");
			return null;
		}
		System.out.println(price.toString());
		//float result = 0.0f;

//		try {
//			result = Float.parseFloat(price.html());
//		} catch (NumberFormatException ex) {
//			logger.error(ex);
//		}

		logger.info("向BTCWTO取当前比特币价格结束" + new Date().getTime());
	//	logger.info("当前比特币价格：" + result);
		
		return price.toString()+price1;
	}

	/*@Scheduled(fixedDelay = 5000)
	public void getPriceFromNet() {

		logger.info("开始向BTCWTO取当前比特币价格" + new Date().getTime());
		String html = HttpTookit.doGet("http://www.btcwto.com/", null, "utf-8",
				true);

		Document doc = Jsoup.parse(html);
		Element price = doc.getElementById("price_current");

		if (null == price) {
			logger.error("Price is null...");
			return;
		}

		float result = 0.0f;

		try {
			result = Float.parseFloat(price.html());
		} catch (NumberFormatException ex) {
			logger.error(ex);
		}

		logger.info("向BTCWTO取当前比特币价格结束" + new Date().getTime());
		logger.info("当前比特币价格：" + result);
	}*/
}
