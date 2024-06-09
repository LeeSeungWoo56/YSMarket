package user;

import org.springframework.web.bind.annotation;
import javax.mail.internet;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;

public class Controller {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public Controller() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String dbURL = "jdbc:mysql://localhost:3306/bbs";
            String dbID = "bban";
            String dbPassword = "1234";

            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // A_idoverlap : 아이디 중복 검사
    @RequestMapping(value = "/A_idoverlap", method = RequestMapping.POST)
    public @ResponseBody String idOverlap(@RequestParam("userID") String userID) {
        System.out.println("===========A_idoverlap ============");
        System.out.println("[1]controller : userID -> " + userID);
        String result = msvc.idOverlap(userID);
        System.out.println("[5]controller : result -> " + result);
        return result;
    }

    // A_emailConfirm : 이메일 인증번호 발송
    @RequestMapping(value = "/A_emailConfirm", method = RequestMapping.GET)
    public @ResponseBody String emailConfirm(@RequestParam("userEmail") String userEmail) {
        String emailKey = emailKey(false, 7);

        MimeMessage mail = mailsender.createMimeMessage();

        String massage = "<h2>안녕하세요. 연성마켓입니다.</h2>"
                + "<br/><p>인증번호는" + emailKey + "입니다.</p>"
                + "<p>d=인증번호를 인증번호 입력란에 입력해주세요</p>";
        try {
            mail.setSubject("[본인인증] 연성마켓 인증메일입니다.", "utf-8");
            mail.setText(massage, "utf-8", "html");
            mail.addRecipient(RecipientType.TO, new InternetAddress(userEmail));
            mailsender.send(mail);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return emailKey;
    }

    // 난수를 이용한 키 생성
    private boolean lowerCheck;
    private int size;

    public String emailKey(boolean lowerCheck, int size) {
        this.lowerCheck = lowerCheck;
        this.size = size;

        return init();
    }

    // 난수를 만드는 메소드
    private String init() {
        Random ran = new Random();
        StringBuffer sb = new StringBuffer();

        int num = 0;

        do {
            num = ran.nextInt(75) + 48;

            if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
                sb.append((char) num);
            } else {
                continue;
            }
        } while (sb.length() < size);

        if (lowerCheck) {
            return sb.toString().toLowerCase();
        }
        return sb.toString();
    }
}
