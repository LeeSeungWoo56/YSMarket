package chatting;

public class ChatDTO {
    private int chatroom_id;
    private String chatroom_name;
    
    private int message_id;
    private String sender_id;
    private String receiver_id;
    private String content;
    private String timestamp;

    public int getChatroom_id(){
        return chatroom_id;
    }

    public void setChatroom_id(int chatroom_id){
        this.chatroom_id = chatroom_id;
    }

    public String getChatroom_name(){
        return chatroom_name;
    }

    public void setChatroom_name(String chatroom_name){
        this.chatroom_name = chatroom_name;
    }

    public int getMessage_id(){
        return message_id;
    }

    public void setMessage_id(int message_id){
        this.message_id = message_id;
    }

    public String getSender_id(){
        return sender_id;
    }

    public void setSender_id(String sender_id){
        this.sender_id = sender_id;
    }

    public String getReceiver_id(){
        return receiver_id;
    }

    public void setReceiver_id(String receiver_id){
        this.receiver_id = receiver_id;
    }

    public String getContent(){
        return content;
    }

    public void setContent(String content){
        this.content = content;
    }

    public String getTimeStamp(){
        return timestamp;
    }
    
    public void setTimeStamp(String timestamp){
        this.timestamp = timestamp;
    }
}
