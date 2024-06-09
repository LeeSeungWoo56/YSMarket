package user;

import java.sql.Blob;

public class User {
    private String userID;
    private String userPW;
    private String userName;
    private String userEmail;
    private Blob photo;

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getUserPW() {
        return userPW;
    }

    public void setUserPW(String userPW) {
        this.userPW = userPW;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }
    public Blob getphoto(){
        return photo;
    }
    public void setphoto(Blob photo) {
        this.photo = photo;
    }

}
