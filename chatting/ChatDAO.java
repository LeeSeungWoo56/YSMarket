package chatting;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ChatDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public ChatDAO() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String dbURL = "jdbc:mysql://localhost:3306/yeonsung_id";
            String dbID = "ysmarket3a";
            String dbPassword = "ys080808!";

            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    List<ChatDTO> getmessage(String sender_id, String receiver_id){
        List<ChatDTO> messages = new ArrayList<>();
        String query = "SELECT * from message WHERE (sender_id=? AND receiver_id=?) OR (sender_id=? AND receiver_id=?)";
        try {
            pstmt= conn.prepareStatement(query);
            pstmt.setString(1, sender_id);
            pstmt.setString(2, receiver_id);
            pstmt.setString(3, receiver_id);
            pstmt.setString(4, sender_id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                ChatDTO message = new ChatDTO();
                // 메시지 정보를 message 객체에 설정
                messages.add(message);
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return messages;
    }
}
