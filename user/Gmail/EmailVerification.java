package user.Gmail;

import java.util.Random;
import java.util.Scanner;

public class EmailVerification {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // 랜덤으로 6자리 인증번호 생성
        String authCode = generateAuthCode();

        System.out.print("이메일 주소를 입력하세요: ");
        String userEmail = scanner.nextLine();

        // 이메일로 인증번호 발송
        sendAuthCode(userEmail, authCode);

        System.out.print("인증번호를 입력하세요: ");
        String userEnteredCode = scanner.nextLine();

        // 사용자가 입력한 인증번호와 발송한 인증번호 비교
        if (userEnteredCode.equals(authCode)) {
            System.out.println("인증 성공! 통과하세요.");
        } else {
            System.out.println("인증 실패! 다시 시도하세요.");
        }
    }

    // 랜덤으로 6자리 인증번호 생성
    public static String generateAuthCode() {
        Random random = new Random();
        int code = random.nextInt(900000) + 100000; // 100000 ~ 999999
        return String.valueOf(code);
    }

    // 이메일로 인증번호 발송
    public static void sendAuthCode(String email, String authCode) {
        // 이 부분에서 이메일 발송 로직을 구현하세요.
        // 실제로는 메일 서버를 사용하거나, Gmail API를 활용하여 이메일을 발송할 수 있습니다.
        // 여기서는 단순히 콘솔에 출력하는 예시를 보여드립니다.
        System.out.println("인증번호 " + authCode + "를 " + email + "로 발송했습니다.");
    }
}
