package cn.demo.utli.test;


import org.apache.log4j.Logger;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

@Service
public class PaperOffice {

	private static final Logger logger = Logger.getLogger(PaperOffice.class);


	//@Scheduled(fixedDelay = 3000)
	public void send() {
		logger.info("向所有读者发放杂志");
	}
}
