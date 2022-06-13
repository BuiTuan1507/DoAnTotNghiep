import 'dart:async';
import 'dart:convert';

import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;
void onConnect(StompFrame frame) {
  stompClient.subscribe(
    destination: '/topic/messages',
    callback: (frame) {
    //  List<dynamic>? result = json.decode(frame.body!);
      print(frame.body ?? "1");
    },
  );
// send message

  Timer.periodic(Duration(seconds: 10), (_) {
    stompClient.send(
      destination: '/app/chat',
      body: json.encode({
        "token":"",
        "userId":77,
        "message":"d l nh li",
        "dateTime":"",
        "isReading":false,
        "type": "text",
        "idChatRoom": 172,
        "media":""
      }),
    );
  });




}

final stompClient = StompClient(
  config: StompConfig(
    url: 'ws://localhost:8088/chat',
    onConnect: onConnect,
    beforeConnect: () async {
      print('waiting to connect...');
      await Future.delayed(Duration(milliseconds: 200));
      print('connecting...');
    },
    onWebSocketError: (dynamic error) => print(error.toString()),
  //  stompConnectHeaders: {'Authorization': 'Bearer yourToken'},
 //   webSocketConnectHeaders: {'Authorization': 'Bearer yourToken'},
  ),
);

void connectSocket(){
  IO.Socket socket = IO.io('ws://localhost:8088/chat');
  socket.onConnect((_) {
    print('connect');
    socket.emit('msg', 'test');
  });
  socket.on('event', (data) => print(data));
  socket.onDisconnect((_) => print('disconnect'));
  socket.on('fromServer', (_) => print(_));
}


void main() {
  stompClient.activate();
//  connectSocket();
}