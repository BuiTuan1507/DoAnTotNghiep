import 'package:get/get.dart';
import '../../modules.dart';

class ChatDetailBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ChatDetailController>(() => ChatDetailController());
    Get.lazyPut<ChatDetailPage>(() => const ChatDetailPage());
  }
}