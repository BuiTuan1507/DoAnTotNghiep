
import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

class MyWebSocket extends GetxService {
  static const String url = "ws://10.0.2.2:5000/chat";
  static final streamChat = StreamController<dynamic>.broadcast();
  //static const String url = "ws://doanserver-env.eba-r5zsksr3.ap-southeast-1.elasticbeanstalk.com/chat";
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
    ),
  );




  // static const String url = "wss://4b96-42-113-220-12.ap.ngrok.io/chat";


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
