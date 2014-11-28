package cn.demo.utli.test;

class Test{
	public static void main(String[] args){   
        //这个类主要是设置邮件   
     MailSenderInfo mailInfo = new MailSenderInfo();    
     mailInfo.setMailServerHost("smtp.163.com");    
     mailInfo.setMailServerPort("25");    
     mailInfo.setValidate(true);    
     mailInfo.setUserName("chen_jc1025@163.com");    
     mailInfo.setPassword("cjc20531025");//您的邮箱密码    
     mailInfo.setFromAddress("chen_jc1025@163.com");    
     mailInfo.setToAddress("429138287@qq.com");    
     mailInfo.setSubject("啊实打实大");    
     mailInfo.setContent("啊实打实大请问亲");    
        //这个类主要来发送邮件   
     SimpleMailSender sms = new SimpleMailSender();   
         sms.sendTextMail(mailInfo);//发送文体格式    
         sms.sendHtmlMail(mailInfo);//发送html格式   
   } 
}
