import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'dart_notification_center.dart';


class MyWebSocket extends GetxService {
  var nodeSocket = 0;
  late WebSocketChannel _channel;

  void connectSocket() async {
    log('node socket $nodeSocket');
    _channel = IOWebSocketChannel.connect('ws://localhost:8088/hello');
    _channel.stream.listen(
          (message) {
            _channel.sink.add('received!');
        log('$message');
        String event = "event is null";
        var data = {};
        try {
          data = json.decode(message);
          event = data['event_name'] ?? "event is null";
        } catch (ex, trace) {
          log(ex.toString());
          print(trace);
        }
            switch (event) {
              case "/topic/messages":
                DartNotificationCenter.post(
                    channel: '/topic/messages', options: data);
                break;
              default:
                break;
            }

        log('event name: $event');
      },
      // onDone: () {
      //   Logger.info('onDone');
      //   nodeSocket = (nodeSocket + 1) % currentSockets.length;
      //   connectSocket();
      // },
      // onError: (error) {
      //   Logger.info('onError $error');
      //   nodeSocket = (nodeSocket + 1) % currentSockets.length;
      //   connectSocket();
      // },
    );
  }


  @override
  Future<void> onClose() async {
    closeSocket();
    super.onClose();
  }

  void closeSocket() {
  }
}
