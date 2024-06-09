package user.Gmail;

import java.security.MessageDigest;

public class SHA256 {
    public static String getEncrypt(String rawPassword, String salt) {
        String result = "";
        byte[] b = (rawPassword + salt).getBytes();

        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(b);
            byte[] bResult = md.digest();

            StringBuffer sb = new StringBuffer();
            for (byte data : bResult) {
                sb.append(Integer.toString(data & 0xff, 16));
            }
            result = sb.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
