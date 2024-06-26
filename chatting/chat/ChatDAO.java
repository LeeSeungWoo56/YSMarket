package chat;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
//import java.util.List;
import javax.sql.DataSource;

public class ChatDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    DataSource dataSource; //커넥션풀을 사용하기 위해 dataSource선언

    public ChatDAO() {
        /* 
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String dbURL = "jdbc:mysql://localhost:3306/yeonsung_id";
            String dbID = "ysmarket3a";
            String dbPassword = "ys080808!";

            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }*/      
        try{
            InitialContext initialContext = new InitialContext();
            Context envContext = (Context) initialContext.lookup("java:/comp/env");
            dataSource = (DataSource) envContext.lookup("jdbc/yeonsung_id");
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public ArrayList<ChatDTO> getmessage(String sender_id, String receiver_id){
        ArrayList<ChatDTO> messages = new ArrayList<ChatDTO>();
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
    public ArrayList<ChatDTO> getChatListByID(String sender_id, String receiver_id, String message_id){
        ArrayList<ChatDTO> chatList = null;
        conn = null;
        pstmt = null;
        rs = null;
        String SQL = "SELECT * FROM message WHERE ((sender_id = ? AND receiver_id = ?) OR (sender_id = ? AND receiver_id = ?)) AND message_id > ? ORDER BY timestamp";
        try{
            conn = dataSource.getConnection();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, sender_id);
            pstmt.setString(2, receiver_id);
            pstmt.setString(3, receiver_id);
            pstmt.setString(4, sender_id);
            pstmt.setInt(5, Integer.parseInt(message_id));
            rs = pstmt.executeQuery();
            chatList = new ArrayList<ChatDTO>();
            while (rs.next()){
                ChatDTO chat = new ChatDTO();
                chat.setMessage_id(rs.getInt("message_id"));
                chat.setSender_id(rs.getString("sender_id").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
                chat.setReceiver_id(rs.getString("receiver_id").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
                chat.setContent(rs.getString("content").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
                int timestamp = Integer.parseInt(rs.getString("timestamp").substring(11, 13));
                String timeType = "오전";
                if( timestamp >= 12){
                    timeType = "오후";
                    timestamp -= 12;
                }
                chat.setTimeStamp(rs.getString("timestamp").substring(0, 11) + " " + timeType + " " + timestamp + ":" + rs.getString("timestamp").substring(14, 16)+ "");
                chatList.add(chat);
            }
        } catch(Exception e){
            e.printStackTrace();
        } finally {
            try {
                if(rs != null) rs.close();
                if(pstmt != null) pstmt.close();
                if(conn != null) conn.close();
            } catch(Exception e){
                e.printStackTrace();
            }
        }
        return chatList; //리스트 반환
    }

    public ArrayList<ChatDTO> getChatListByRecent(String sender_id, String receiver_id, int number){
        ArrayList<ChatDTO> chatList = null;
        conn = null;
        pstmt = null;
        rs = null;
        //String SQL = "SELECT * FROM message WHERE ((sender_id = ? AND receiver_id = ?) OR (sender_id = ? AND receiver_id = ?)) AND message_id > (SELECT MAX(message_id) - ? FROM MESSAGE) ORDER BY timestamp";
        String SQL = "SELECT * FROM message WHERE ((sender_id = ? AND receiver_id = ?) OR (sender_id = ? AND receiver_id = ?)) ORDER BY timestamp";
        try{
            conn = dataSource.getConnection();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, sender_id);
            pstmt.setString(2, receiver_id);
            pstmt.setString(3, receiver_id);
            pstmt.setString(4, sender_id);
            //pstmt.setInt(5, number);
            rs = pstmt.executeQuery();
            chatList = new ArrayList<ChatDTO>();
            while (rs.next()){
                ChatDTO chat = new ChatDTO();
                chat.setMessage_id(rs.getInt("message_id"));
                chat.setSender_id(rs.getString("sender_id").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
                chat.setReceiver_id(rs.getString("receiver_id").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
                chat.setContent(rs.getString("content").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
                int timestamp = Integer.parseInt(rs.getString("timestamp").substring(11, 13));
                String timeType = "오전";
                if( timestamp >= 12){
                    timeType = "오후";
                    timestamp -= 12;
                }
                chat.setTimeStamp(rs.getString("timestamp").substring(0, 11) + " " + timeType + " " + timestamp + ":" + rs.getString("timestamp").substring(14, 16)+ "");
                chatList.add(chat);
            }
        } catch(Exception e){
            e.printStackTrace();
        } finally {
            try {
                if(rs != null) rs.close();
                if(pstmt != null) pstmt.close();
                if(conn != null) conn.close();
            } catch(Exception e){
                e.printStackTrace();
            }
        }
        return chatList; //리스트 반환
    }
    
    //메시지 목록 불러오기
    public ArrayList<ChatDTO> getBox(String userID){
        ArrayList<ChatDTO> chatList = null;
        conn = null;
        pstmt = null;
        rs = null;
        String SQL = "WITH LatestMessages AS (SELECT *, ROW_NUMBER() OVER (PARTITION BY CASE WHEN sender_id < receiver_id THEN sender_id ELSE receiver_id END, CASE WHEN sender_id < receiver_id THEN receiver_id ELSE sender_id END ORDER BY timestamp DESC) AS rn FROM message WHERE sender_id = ? OR receiver_id = ? ) SELECT message_id, sender_id, receiver_id, content, timestamp FROM LatestMessages WHERE rn = 1 ORDER BY timestamp DESC";
        try{
            conn = dataSource.getConnection();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            pstmt.setString(2, userID);
            //pstmt.setInt(5, number);
            rs = pstmt.executeQuery();
            chatList = new ArrayList<ChatDTO>();
            while (rs.next()){
                ChatDTO chat = new ChatDTO();
                chat.setMessage_id(rs.getInt("message_id"));
                chat.setSender_id(rs.getString("sender_id").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
                chat.setReceiver_id(rs.getString("receiver_id").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
                chat.setContent(rs.getString("content").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
                int timestamp = Integer.parseInt(rs.getString("timestamp").substring(11, 13));
                String timeType = "오전";
                if( timestamp >= 12){
                    timeType = "오후";
                    timestamp -= 12;
                }
                chat.setTimeStamp(rs.getString("timestamp").substring(0, 11) + " " + timeType + " " + timestamp + ":" + rs.getString("timestamp").substring(14, 16)+ "");
                chatList.add(chat);
            }
        } catch(Exception e){
            e.printStackTrace();
        } finally {
            try {
                if(rs != null) rs.close();
                if(pstmt != null) pstmt.close();
                if(conn != null) conn.close();
            } catch(Exception e){
                e.printStackTrace();
            }
        }
        return chatList; //리스트 반환
    }

    public int submit(String sender_id, String receiver_id, String content){
        conn = null;
        pstmt = null;
        rs = null;
        String SQL = "INSERT INTO MESSAGE VALUES (NULL, ?, ?, ?, NOW(), 0)";
        try{
            conn = dataSource.getConnection();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, sender_id);
            pstmt.setString(2, receiver_id);
            pstmt.setString(3, content);
            return pstmt.executeUpdate(); // 실행 결과 반환 
        } catch(Exception e){
            e.printStackTrace();
        } finally {
            try {
                if(rs != null) rs.close();
                if(pstmt != null) pstmt.close();
                if(conn != null) conn.close();
            } catch(Exception e){
                e.printStackTrace();
            }
        }
        return -1; //데이터베이스 오류
    }
    //메시지를 읽었다고 처리하는 부분
    public int readChat(String sender_id, String receiver_id) {
        conn = null;
        pstmt = null;
        rs = null;
        String SQL = "UPDATE message SET messageread = 1 WHERE (sender_id = ? AND receiver_id = ?)";
        try {
            conn = dataSource.getConnection();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, receiver_id);
            pstmt.setString(2, sender_id);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return -1; //데이터베이스 오류
    }

    //읽지 않은 메시지의 개수 가져오기
    public int getAllUnreadChat(String userID) {
        conn = null;
        pstmt = null;
        rs = null;
        String SQL = "SELECT COUNT(message_id) FROM message WHERE sender_id = ? AND messageread =0";
        try {
            conn = dataSource.getConnection();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                return rs.getInt("COUNT(messageID)");
            }
            return 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return -1; //데이터베이스 오류
    }
}
