import 'package:get/get.dart';

class PostController extends GetxController{
  RxInt currentIndex = 0.obs;
  int countPost = 1;
  int pendingPost = 0;
  int expirePost = 1;
  int notApprovePost = 0;
  int hiddenPost = 0;
}