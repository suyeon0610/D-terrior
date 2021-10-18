<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>1:1 상담하기</title>
<link
   href="${pageContext.request.contextPath}/resources/css/bootstrap.css"
   rel="stylesheet">
 

</head>
<body>
   <!-- 콘솔 메시지의 역할을 하는 로그 텍스트 에리어.(수신 메시지도 표시한다.) -->
   <textarea id="messageTextArea" rows="17" cols="50"></textarea>
   <br />
   <form>
      <!-- 유저 명을 입력하는 텍스트 박스(기본 값은 anonymous(익명)) -->
      <input id="user" type="text" value="${user.nickName }" style="display: none">
      <!-- 송신 메시지를 작성하는 텍스트 박스 -->
      <input size="40" id="textMessage" type="text" onKeypress="javascript:if(event.keyCode==13) {sendMessage()}">
      <!-- 메세지를 송신하는 버튼 -->
	<input class="btn btn-info" onclick="sendMessage()" type="button" value="입력">
      <!-- WebSocket 접속 종료하는 버튼 -->
      <!-- <input onclick="disconnect()" value="Disconnect" type="button"> -->
   </form>
   <script type="text/javascript">
      // 「WebSocketEx」는 프로젝트 명
      // 「broadsocket」는 호스트 명
      // WebSocket 오브젝트 생성 (자동으로 접속 시작한다. - onopen 함수 호출)
      var webSocket = new WebSocket(
            "ws://172.30.1.55:8081/myWeb/broadsocket");
      // 콘솔 텍스트 에리어 오브젝트
      var messageTextArea = document.getElementById("messageTextArea");
      // WebSocket 서버와 접속이 되면 호출되는 함수
      webSocket.onopen = function(message) {
         // 콘솔 텍스트에 메시지를 출력한다.
         messageTextArea.value += "채팅방 입장 \n";
      };
      // WebSocket 서버와 접속이 끊기면 호출되는 함수
      webSocket.onclose = function(message) {
         // 콘솔 텍스트에 메시지를 출력한다.
         messageTextArea.value += "Server Disconnect...\n";
      };
      // WebSocket 서버와 통신 중에 에러가 발생하면 요청되는 함수
      webSocket.onerror = function(message) {
         // 콘솔 텍스트에 메시지를 출력한다.
         messageTextArea.value += "error...\n";
      };
      /// WebSocket 서버로 부터 메시지가 오면 호출되는 함수
      webSocket.onmessage = function(message) {
         // 콘솔 텍스트에 메시지를 출력한다.
         messageTextArea.value +="관리자 :  " + message.data + "\n";
      };
      // Send 버튼을 누르면 호출되는 함수
      function sendMessage() {
         // 유저명 텍스트 박스 오브젝트를 취득
         var user = document.getElementById("user");
         // 송신 메시지를 작성하는 텍스트 박스 오브젝트를 취득
         var message = document.getElementById("textMessage");
         // 콘솔 텍스트에 메시지를 출력한다.
         messageTextArea.value +="(YOU) :  " + message.value
               + "\n";
         // WebSocket 서버에 메시지를 전송(형식 「{{유저명}}메시지」)
         webSocket.send("(" + user.value + ") :   " + message.value);
         // 송신 메시지를 작성한 텍스트 박스를 초기화한다.
         message.value = "";
      }
      // Disconnect 버튼을 누르면 호출되는 함수
      function disconnect() {
         // WebSocket 접속 해제
         webSocket.close();
      }
   </script>
</body>
</html>
