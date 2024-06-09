package user.mail;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {
    final String ENCODING = "UTF-8";
    final String PORT = "465";
    final String SMTPHOST = "smtp.gmail.com";

    public Session setting(Properties props, String user_name, String password) {

        Session session = null;

        try {

            props.put("mail.transport.protocol", "smtp");
            props.put("mail.smtp.host", SMTPHOST);
            props.put("mail.smtp.port", PORT);
            props.put("mail.smtp.auth", true);
            props.put("mail.smtp.ssl.enable", true);
            props.put("mail.smtp.ssl.trust", SMTPHOST);
            props.put("mail.smtp.starttls.required", true);
            props.put("mail.smtp.starttls.enable", true);
            props.put("mail.smtp.ssl.protocols", "TLSv1.2");

            props.put("mail.smtp.quit-wait", "false");
            props.put("mail.smtp.socketFactory.port", PORT);
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.socketFactory.fallback", "false");

            session = Session.getInstance(props, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(user_name, password);
                }
            });
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Session setting 실패");
        }
        return session;
    }

    public String goMail(Session session, String title, String content, String to) {

        Message msg = new MimeMessage(session);

        try {
            msg.setFrom(new InternetAddress("ysmarket3a@gmail.com", "연성마켓", ENCODING));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            msg.setSubject(title);
            msg.setContent(content, "text/html; charset=utf-8");

            Transport.send(msg);

            System.out.println("메일 보내기 성공");
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("메일 보내기 실패");
            return "error";
        }
    }

    public String mail(String to, String code) {
        // RandomCode randomcode = new RandomCode();
        // String code = randomcode.generateAuthCode();
        String title = "연성마켓";
        String content = "요청하신 인증번호는 " + code + "입니다.";
        String user_name = "ysmarket3a@gmail.com"; // 보낼 메일 계정
        String password = "zbfn dulu wxoj sxcz"; // 보낼 메일 패스워드

        SendMail sendMail = new SendMail();
        String result = sendMail.goMail(sendMail.setting(new Properties(), user_name, password), title, content, to);
        System.out.println(result);
        if (result.equals("success")) {
            return code;
        } else {
            return result;
        }
    }

    public String findID_Email(String to, String id, String name) {
        String title = "연성마켓";
        String content = name + "님의 ID는 " + id + "입니다.";
        String user_name = "ysmarket3a@gmail.com"; // 보낼 메일 계정
        String password = "zbfn dulu wxoj sxcz"; // 보낼 메일 패스워드

        SendMail sendMail = new SendMail();
        String result = sendMail.goMail(sendMail.setting(new Properties(), user_name, password), title, content, to);
        System.out.println(result);
        return result;
    }

    public String findPW_Email(String to, String pw, String name) {
        String title = "연성마켓";
        String content = name + "님의 비밀번호는 " + pw + "입니다.";
        String user_name = "ysmarket3a@gmail.com"; // 보낼 메일 계정
        String password = "zbfn dulu wxoj sxcz"; // 보낼 메일 패스워드

        SendMail sendMail = new SendMail();
        String result = sendMail.goMail(sendMail.setting(new Properties(), user_name, password), title, content, to);
        System.out.println(result);
        return result;
    }
}