package chat;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;

import chat.ChatDAO;

@WebServlet("/ChatListServlet")
public class ChatListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String sender_id = request.getParameter("sender_id");
        String receiver_id = request.getParameter("receiver_id");
        String listType = request.getParameter("listType");
        if(sender_id == null || sender_id.equals("") || receiver_id == null || receiver_id.equals("") || listType == null || listType.equals("")){
            response.getWriter().write("");
        } else if (listType.equals("ten")){
            response.getWriter().write(getTen(URLDecoder.decode(sender_id,"UTF-8"),URLDecoder.decode(receiver_id,"UTF-8")));
        }
        else {
            try{
                response.getWriter().write(getID(URLDecoder.decode(sender_id,"UTF-8"), URLDecoder.decode(receiver_id,"UTF-8"),URLDecoder.decode(listType,"UTF-8")));
            } catch(Exception e){
                response.getWriter().write(""); //공백문자열 출력
            }
        }
    }
    public String getTen(String sender_id, String receiver_id){
        StringBuffer result = new StringBuffer("");
        result.append("{\"result\":[");
        ChatDAO chatDAO = new ChatDAO();
        ArrayList<ChatDTO> chatList = chatDAO.getChatListByRecent(sender_id, receiver_id, 10);
        if (chatList.size() ==0) return "";  //chatList가 비어있는 상태라면  공백문자 반환
        //그렇지 않은 경우 실제 대화 정보 출력
        for(int i=0; i < chatList.size(); i++){
            result.append("[{\"value\": \"" + chatList.get(i).getSender_id() + "\"},");
            result.append("{\"value\": \"" + chatList.get(i).getReceiver_id() + "\"},");
            result.append("{\"value\": \"" + chatList.get(i).getContent() + "\"},");
            result.append("{\"value\": \"" + chatList.get(i).getTimeStamp() + "\"}]");
            //만약에 마지막 원소가 아니라면
            if(i != chatList.size() -1) result.append(","); //다음원소가 존재한다는 것을 알려주기 위해 ,를 찍어주고
        }
        result.append("], \"last\":\"" + chatList.get(chatList.size() -1 ).getMessage_id() + "\"}");
        chatDAO.readChat(sender_id, receiver_id); //메시지를 읽었다고 처리
        return result.toString();
    }

    public String getID(String sender_id, String receiver_id, String message_id){
        StringBuffer result = new StringBuffer("");
        result.append("{\"result\":[");
        ChatDAO chatDAO = new ChatDAO();
        ArrayList<ChatDTO> chatList = chatDAO.getChatListByID(sender_id, receiver_id, message_id);
        if (chatList.size() ==0) return "";  //chatList가 비어있는 상태라면  공백문자 반환
        //그렇지 않은 경우 실제 대화 정보 출력
        for(int i=0; i < chatList.size(); i++){
            result.append("[{\"value\": \"" + chatList.get(i).getSender_id() + "\"},");
            result.append("{\"value\": \"" + chatList.get(i).getReceiver_id() + "\"},");
            result.append("{\"value\": \"" + chatList.get(i).getContent() + "\"},");
            result.append("{\"value\": \"" + chatList.get(i).getTimeStamp() + "\"}]");
            //만약에 마지막 원소가 아니라면
            if(i != chatList.size() -1) result.append(","); //다음원소가 존재한다는 것을 알려주기 위해 ,를 찍어주고
        }
        result.append("], \"last\":\"" + chatList.get(chatList.size() -1 ).getMessage_id() + "\"}");
        chatDAO.readChat(sender_id, receiver_id); //메시지를 읽었다고 처리
        return result.toString();
    }
}
