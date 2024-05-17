<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="#{board.code } ARTICLE LIST"></c:set>
<%@ include file="../common/head.jspf"%>

<!DOCTYPE html>
<html>
<head>
    <title>Simple Video Chat</title>
</head>
<body>
    <video id="localVideo" autoplay muted></video>
    <video id="remoteVideo" autoplay></video>
    <button id="startButton">Start</button>
    <button id="callButton">Call</button>
    <button id="hangupButton">Hang Up</button>

    <script src="js/video_chat.js"></script>
</body>
</html>



<script>
var localVideo = document.getElementById('localVideo');
var remoteVideo = document.getElementById('remoteVideo');

var localStream;
var remoteStream;
var peerConnection;

var startButton = document.getElementById('startButton');
var callButton = document.getElementById('callButton');
var hangupButton = document.getElementById('hangupButton');

startButton.onclick = start;
callButton.onclick = call;
hangupButton.onclick = hangup;

function start() {
    navigator.mediaDevices.getUserMedia({video: true, audio: true})
        .then(gotStream)
        .catch(function(e) {
            alert('getUserMedia() error: ' + e.name);
        });
}

function gotStream(stream) {
    localVideo.srcObject = stream;
    localStream = stream;
}

function call() {
    peerConnection = new RTCPeerConnection();
    peerConnection.addStream(localStream);
    peerConnection.onaddstream = function(e) {
        remoteVideo.srcObject = e.stream;
        remoteStream = e.stream;
    };
    peerConnection.createOffer()
        .then(setLocalAndSendMessage)
        .catch(handleCreateOfferError);
}

function setLocalAndSendMessage(sessionDescription) {
    peerConnection.setLocalDescription(sessionDescription);
    console.log('Offer from localPeerConnection: \n' + sessionDescription.sdp);
    // 여기서는 예시로 로컬에서만 처리하고 있으나, 실제 구현에서는 시그널링 서버를 통해 원격 피어에 SDP를 전송해야 합니다.
}

function handleCreateOfferError(event) {
    console.log('createOffer() error: ', event);
}

function hangup() {
    peerConnection.close();
    peerConnection = null;
    alert('Call ended.');
}


</script>



<%@ include file="../common/foot.jspf"%>