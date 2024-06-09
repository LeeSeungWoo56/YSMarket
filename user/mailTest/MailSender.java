package user.mailTest;

public class MailSender {
    public void mail(String to) {
        RandomCode randomcode = new RandomCode();
        String code = randomcode.generateAuthCode();
        String title = "연성마켓";
        String content = "요청하신 인증번호는 " + code + "입니다.";
        String user_name = "ysmarket3a@gmail.com"; // 보낼 메일 계정
        String password = "zbfn dulu wxoj sxcz"; // 보낼 메일 패스워드

        SendMail sendMail = new SendMail();
        sendMail.goMail(sendMail.setting(new Properties(), user_name, password), title, content, to);
    }
}
