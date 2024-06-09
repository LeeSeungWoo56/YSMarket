<script type="text/javascript">
$(document.ready(function({
     // 웹 소켓 초기화
   	webSocketInit();
});

//웹소켓 생성
var webSocket;

function webSocketInit()
{
    webSocket = new WebSocket("ws://localhost:8080/websocket");
	webSocket.onopen = function(event) { socketOpen(event);};
	webSocket.onclose = function(event) { socketClose(event);};
	webSocket.onmessage = function(event) { socketMessage(event);};
	webSocket.onerror = function(event) { socketError(event);};
}  
  //웹소켓 연결
  function socketOpen(event){
     console.log("연결 완료");
  }
  
  //웹소켓 닫힘
  function socketClose(event){
  	 console.log("웹소켓이 닫혔습니다.");
  	 
     // 웹소켓이 닫혀있으면 재연결을 시도합니다.
     // webSocket이 close되면 오브젝트의 속성, 메서드가 사라지기 때문에,
     // 해당 함수를 호출하여 초기화하여 줍니다.
     webSocketInit(); 
  }
  
  //메시지를 송신할 때 사용
  function socketMsgSend(){
     // 메시지 포맷
     var msg = {
     	type : "message",
        value : "메시지입니다.",
        seq : $("#seq").val();
     }
     
     // 세션리스트에 메시지를 송신한다.
     webSocket.send(msg)
  }
  
  //웹소켓 메시지 수신
  function socketMessage(event){
  	  var receiveData = event.data; // 수신 data
      alert("수신된 msg : " + receiveData);
  }
  
  //웹소켓 에러
  function socketError(event){
  	alert("에러가 발생하였습니다.");
  }
  
  //웹소켓 종료
  function disconnect(){
  	webSocket.close();
  }
</script>