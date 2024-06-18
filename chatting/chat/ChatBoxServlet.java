package chat;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/ChatBoxServlet")
public class ChatBoxServlet extends HttpServlet{
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String userID = request.getParameter("userID");
        if(userID == null || userID.equals("")) {
            response.getWriter().write("");
        } else {
            try {
                userID =URLDecoder.decode(userID, "UTF-8");
                response.getWriter().write(getBox(userID));
            } catch(Exception e) {
                response.getWriter().write("");
            }
        }
    }
    public String getBox(String userID){
        StringBuffer result = new StringBuffer("");
        result.append("{\"result\":[");
        ChatDAO chatDAO = new ChatDAO();
        ArrayList<ChatDTO> chatList = chatDAO.getBox(userID);
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
        return result.toString();
    }
}
