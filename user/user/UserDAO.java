package user;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public UserDAO() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String dbURL = "jdbc:mysql://localhost:3306/yeonsung_id";
            String dbID = "ysmarket3a";
            String dbPassword = "ys080808!";

            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String nameset(String userID) {
        String userName = "SELECT username FROM USER WHERE userID = ?";
        return userName;
    }

    // 회원가입
    public int join(User user) {
        String SQL = "INSERT INTO USER (userID, userPW, userName, userEmail, photo) VALUES (?, ?, ?, ?, ?)";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, user.getUserID());
            pstmt.setString(2, user.getUserPW());
            pstmt.setString(3, user.getUserName());
            pstmt.setString(4, user.getUserEmail());
            pstmt.setNull(5, java.sql.Types.BLOB);

            return pstmt.executeUpdate();
        } catch (Exception e) {
            System.err.println("SQL error: " + e.getMessage());
            e.printStackTrace();
        }
        return -1;
    }

    // 아이디 중복확인
    public String idCheck(String id) {
        String result = "error"; // 오류발생
        String query = "SELECT userID from USER WHERE userID=?";
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                result = "DUPLICATE"; // 존재할 경우
            } else {
                result = "OK"; // 존재하지 않을 경우
            }
            rs.close();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    // 로그인
    public int login(String userID, String userPW) {
        String SQL = "SELECT userPW FROM USER WHERE userID = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                if (rs.getString(1).equals(userPW))
                    return 1; // 로그인 성공
                else
                    return 0; // 비밀번호 불일치
            }
            return -1; // 아이디 없음
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -2; // 데이터베이스 오류
    }

    // 아이디 찾기
    public String findUserID(String name, String email) {
        String userID = null;
        String SQL = "SELECT userID FROM USER WHERE userName = ? AND userEmail = ?";

        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                userID = rs.getString("userID");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return userID;
    }

    // 비밀번호 찾기
    public String findUserPW(String id, String name, String email) {
        String userPW = null;
        String SQL = "SELECT userPW FROM USER WHERE userID = ? AND userName = ? AND userEmail = ?";

        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, id);
            pstmt.setString(2, name);
            pstmt.setString(3, email);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                userPW = rs.getString("userPW");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userPW;
    }

    //조회
    public List<User> selectUser(User user) {
        List<User> membersList = new ArrayList<User>();
        String userID = user.getUserID();
        String userName = null;
        String SQL = "SELECT * FROM USER WHERE userID = ?";

        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                String id = rs.getString("UserID");
                String pw = rs.getString("UserPW");
                String name = rs.getString("UserName");
                String email = rs.getString("UserEmail");
                Blob photo = rs.getBlob("photo");

                User dto = new User();
                dto.setUserID(id);
                dto.setUserPW(pw);
                dto.setUserName(name);
                dto.setUserEmail(email);
                dto.setphoto(photo);
                
                membersList.add(dto);
            }
            rs.close();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return membersList;
    }
    
    //회원탈퇴
    public int deleteUser(String userID, String userPW) {
        int result = login(userID, userPW);
        if (result != 1){
            return result;
        }
        else{
            String SQL="delete from user where userID = ?"; 		
            try { 			
                PreparedStatement pstmt=conn.prepareStatement(SQL); 			
                pstmt.setString(1, userID); 			
                result=pstmt.executeUpdate();
                if (result == 1){
                    return result;
                } 		
            } catch(Exception e) { 			
            e.printStackTrace(); 		
            } 		
            return -2;//데이터베이스 오류
        }    	
    }
}

