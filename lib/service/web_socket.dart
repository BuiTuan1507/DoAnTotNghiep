
import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

class MyWebSocket extends GetxService {

  static final streamChat = StreamController<dynamic>();
 //static const String url = "wss://7682-42-115-113-236.ap.ngrok.io/chat";
  static const String url = "ws://10.0.2.2:8088/chat";
  static final stompClient = StompClient(
    config: StompConfig(
      url: url,
      onConnect: (StompFrame frame){
        stompClient.subscribe(
          destination: '/topic/messages',
          callback: (frame) {
            try{
              var data = json.decode(frame.body!);
              streamChat.sink.add(data['data']);
            }
            catch(e){
              log(e.toString());
            }

          },
        );
      },
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






  @override
  void onInit() {
    connectSocket();
    super.onInit();
  }

  void connectSocket() async {
    stompClient.activate();
  }

  static Future<void> sendMessage(Map<String,dynamic> param) async {
     stompClient.send(
      destination: '/app/chat',
      body: json.encode(param),
    );
  }

}
