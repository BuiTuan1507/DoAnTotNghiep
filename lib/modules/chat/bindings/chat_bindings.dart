
import 'package:get/get.dart';

import '../../modules.dart';

class ChatBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(() => ChatController());
    Get.lazyPut<ChatPage>(() => const ChatPage());
  }

}