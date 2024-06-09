package user.mail;

import java.util.Random;

public class RandomCode {
    // 랜덤으로 4자리 인증번호 생성
    public static String generateAuthCode() {
        Random random = new Random();
        int code = random.nextInt(10000); // 0~9999
        return String.valueOf(code);
    }
}
