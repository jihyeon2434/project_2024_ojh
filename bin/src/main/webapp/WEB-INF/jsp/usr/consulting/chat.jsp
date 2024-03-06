<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="#{board.code } CONSULTING CHAT"></c:set>


<style>
.outer-box{
  border: 2px solid black;
  border-radius: 5px;
  position: absolute;
  height: 1000px;
  top: 5%;
  left: 50%;
  margin-top: 25%;
  transform: translate(-50%, -50%);
}


.call-off,
.sound,
.camera {
  
  width: 40px;
  height: 40px;
  float: right;
  margin-left: 10px; /* 각 요소들 사이에 10px의 마진 추가 */
  margin-top: 20px;
}

.call-off img,
.sound img,
.camera img {
  width: 50px; /* 너비 조정 */
  height: 50px; /* 높이 조정 */
}

.call-off {
  margin-right: 30px;
}
.Rectangle44 {
  width: 1440px;
  height: 86px;
  background: rgba(239, 231, 229, 0.7);
  display: flex;
  justify-content: flex-end;
}

.top-bar {
  border: 1px solid;
  width: 1440px;
}

.top-bar {
  border: 1px solid;
  width: 1440px;
}

.video-box {
  width: 1440px;
  height: 386px;
}

body,
html {
  margin: 0;
  padding: 0;
  height: 100%;
}

.video-chat {
  width: 900px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: 900px;
  background-color: white;
  margin: 10px;
}

.local-video,
.remote-video {
  width: 90%;
  height: auto;
  border-radius: 8px;
  max-width: 100%;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  background-color: #f2f2f2;
  margin: 10px;
}

video {
  width: 100%;
  height: auto;
}

.chat-box {
  width: 473px;
  height: 900px;
  left: 967px;
  top: 96px;
  position: absolute;
  background: rgba(255, 244, 226, 0.04);
  overflow-y: auto;
}

.message-box {
  border: 2px solid black;
  border-radius: 5px;
  height: 820px;
  width: 420px;
  margin-right: 10px;
  margin-left: 11px;
  margin-bottom: 20px;
  overflow-y: auto;
}

.message {
  overflow: hidden;
}

.message-bubble {
  max-width: 70%;
  padding: 10px;
  border-radius: 10px;
  border: 1px solid;
  background-color: white;
  margin-bottom: 10px;
}

.message-right .message-bubble {
  background-color: black;
  color: white;
}

.message-info {
  font-size: 12px;
  color: #666;
  clear: both;
}

.message-right .message-info {
  text-align: right;
}

.message-bubble.left {
  float: left;
}

.message-bubble.right {
  float: right;
}

.chat-input {
  left: 967px;
  width: 465px;
  display: inline-block;
}

.chat-input input[type="text"] {
  width: calc(100% - 80px);
  padding: 5px;
  border: 1px solid #ccc;
  border-radius: 5px;
  height: 30px;
}

.chat-input button {
  height: 30px;
  width: 50px;
  background-color: #4caf50;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}


</style>

<div class="outer-box"><div class="top-bar">
  <div class="Rectangle44">
    <div class="icon">
      <div class="call-off"><img src="//velog.velcdn.com/images/jihyeon2434/post/c61735e2-66ec-44c4-91fe-8899a1ca6a49/image.png" /></div>
      <div class="sound"><img src="//velog.velcdn.com/images/jihyeon2434/post/38defe2b-87f3-4095-8fa0-f8081721c986/image.png" /></div>
      <div class="camera"><img src="//velog.velcdn.com/images/jihyeon2434/post/6ae3f0a4-e77c-452f-aad1-93aeaa393e7a/image.png" /></div>
    </div>

  </div>
</div>

<div class="video-box">
  <div class="video-chat">
    <div class="local-video">
      <video id="localVideo" autoplay muted></video>
    </div>
    <div class="remote-video">
      <video id="remoteVideo" autoplay></video>
    </div>
  </div>
</div>

<div class="chat-box">
  <div class="message-box">
    <div class="message message-right">
      <div class="message-bubble right">
        This is a message from the right user.
      </div>
      <div class="message-info">12:30 PM</div>
    </div>
    <div class="message">
      <div class="message-bubble left">
        This is a message from the left user.
      </div>
      <div class="message-info">12:32 PM</div>
    </div>
    <div class="message message-right">
      <div class="message-bubble right">
        Another message from the right user.
      </div>
      <div class="message-info">12:35 PM</div>
    </div>
    <!-- More messages can be added here -->
  </div>
  <div class="chat-input">
    <input type="text" id="messageInput" placeholder="메시지 입력">
    <button onclick="sendMessage()">전송</button>
  </div>
</div></div>


<script>
//가짜 비디오 스트림 생성 (실제 WebRTC 연결이 아닙니다)
function addFakeVideoStream(videoElement, streamUrl) {
  const video = document.createElement("video");
  video.src = streamUrl;
  video.autoplay = true;
  videoElement.appendChild(video);
}

// 로컬 비디오에 가짜 스트림 추가
const localVideoElement = document.getElementById("localVideo");
addFakeVideoStream(
  localVideoElement,
  "https://dummyimage.com/640x360/cccccc/ffffff&text=Local+Video"
);

// 원격 비디오에 가짜 스트림 추가
const remoteVideoElement = document.getElementById("remoteVideo");
addFakeVideoStream(
  remoteVideoElement,
  "https://dummyimage.com/640x360/cccccc/ffffff&text=Remote+Video"
);

function sendMessage() {
  var input = document.getElementById("messageInput").value;
  var chatBox = document.querySelector(".message-box");
  var messageContainer = document.createElement("div");
  var messageBubble = document.createElement("div");
  var messageInfo = document.createElement("div");
  var user = document.createTextNode("사용자");
  var time = document.createTextNode(
    new Date().toLocaleTimeString([], { hour: "2-digit", minute: "2-digit" })
  );

  messageContainer.classList.add("message");
  messageBubble.classList.add("message-bubble");
  messageBubble.innerHTML = "<p>" + input + "</p>";
  messageInfo.classList.add("message-info");
  messageInfo.appendChild(user);
  messageInfo.appendChild(document.createElement("br"));
  messageInfo.appendChild(time);

  messageContainer.appendChild(messageBubble);
  messageContainer.appendChild(messageInfo);
  chatBox.appendChild(messageContainer); // 메시지를 맨 아래에 추가

  // 스크롤을 항상 아래로 이동시킴
  chatBox.scrollTop = chatBox.scrollHeight;

  document.getElementById("messageInput").value = "";
}

</script>


				<%@ include file="../common/foot.jspf"%>