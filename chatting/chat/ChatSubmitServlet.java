package chat;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;

@WebServlet("/ChatSubmitServlet")
public class ChatSubmitServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String sender_id = request.getParameter("sender_id");
        String receiver_id = request.getParameter("receiver_id");
        String content = request.getParameter("content");
        if(sender_id == null || sender_id.equals("") || receiver_id == null || receiver_id.equals("") || content == null || content.equals("")){
            response.getWriter().write("0");
        } else {
            sender_id = URLDecoder.decode(sender_id, "UTF-8");
            receiver_id = URLDecoder.decode(receiver_id, "UTF-8");
            content = URLDecoder.decode(content, "UTF-8");
            ChatDAO chatDAO = new ChatDAO();
            response.getWriter().write(chatDAO.submit(sender_id, receiver_id, content) + "");
            //response.getWriter().write(new ChatDAO().submit(sender_id, receiver_id, content) + "");
        }
    }
}
