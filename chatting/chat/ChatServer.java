package chat;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import jakarta.websocket.OnClose;
import jakarta.websocket.OnError;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import jakarta.websocket.server.ServerEndpoint;

@ServerEndpoint("/ChatingServer")
public class ChatServer {
	//Collections클래스 synchronizedSet() 멀티스레드 환경에서 안전한 Set컬렉션을 생성
	//Set은 순서를 유지하지않고 저장하며 중복저장이 불가능 
	private static Set<Session> clients = 
			Collections.synchronizedSet(new HashSet<>());
	
	@OnOpen  //클라이언트 접속 시 실행
	public void onOpen(Session session) {
		clients.add(session);   //세션추가
		System.out.println("웹소켓 연결 : " + session.getId());
	}
	@OnMessage //메시지를 받으면 실행
	public void onMessage(String message, Session session) throws IOException {
		System.out.println("메시지 전송: " + session.getId() + " : " + message);
		//동기화 블럭
		synchronized (clients) {
			for(Session client : clients) {
				if(!client.equals(session)) {
					client.getBasicRemote().sendText(message);
				}
			}
		}
	}
	@OnClose  //클라이언트와 연결이 끊기면 실행
	public void onClose(Session session) {
		clients.remove(session);
		System.out.println("웹소켓 종료 : " + session.getId());
	}
	@OnError
	public void onError(Throwable e) {
		System.out.println("에러발생");
		e.printStackTrace();
	}
}