import 'dart:developer';
import 'dart:io';

import 'package:do_an/models/chat/chat_room_model.dart';
import 'package:do_an/models/chat/detail_chat_room_model.dart';
import 'package:do_an/models/models.dart';
import 'package:do_an/modules/chat/controller/chat_controller.dart';
import 'package:do_an/respository/chat_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../models/chat/chat_users_model.dart';
import '../../../models/chat/message_model.dart';
import '../../../service/service.dart';
import '../../../service/web_socket.dart';
import '../../../utils/common/common_util.dart';
import '../../../utils/constants/constant.dart';

class ChatDetailController extends GetxController {
  late ChatRoomModel chatRoomModel;

  final TextEditingController textEditingController = TextEditingController();

  List<File> fileImage = <File>[];

  Rx<DetailChatRoomModel> detailChatRoomModel = DetailChatRoomModel().obs;

  RxBool isLoading = false.obs;

  ChatRepository chatRepository = ChatRepository();

  RxList<MessageModel> listMessage = <MessageModel>[].obs;

  int page = 0;

  int pageSize = 6;

  bool isLoadMore = false;

  ScrollController scrollController = ScrollController();

  RxList<FileElementModel>? file = <FileElementModel>[].obs;

  var picker = ImagePicker();

  RxBool isShowSendButton = false.obs;

  @override
  void onInit() async {
    initScrollController();
    chatRoomModel = Get.arguments;
    await getDetailChatRoom();
    await getListMessage();

    onSocket();

    super.onInit();
  }

  openImage() async {
    if (file?.isEmpty == true) {
      file?.value = await takeFile(takeImage: true) ?? <FileElementModel>[];
    } else {
      List<FileElementModel>? selectedFile = await takeFile(takeImage: true);
      file?.addAll((selectedFile ?? []).toList());
    }
  }

  Future<List<FileElementModel>?> takeFile({required bool takeImage}) async {
    List<FileElementModel> fileElement = <FileElementModel>[];
    List<XFile>? pickedFiles;

    if (takeImage) {
      pickedFiles = await picker.pickMultiImage(imageQuality: 100);
      if (pickedFiles != null) {
        for (var element in pickedFiles) {
          FileElementModel fileElementModel = FileElementModel(type: "image", file: File(element.path));
          fileElement.add(fileElementModel);
        }
      } else {
        fileElement = <FileElementModel>[];

      }

    } else {
      pickedFiles?.first =
          (await picker.pickVideo(source: ImageSource.gallery))!;
      FileElementModel fileElementModel = FileElementModel(type: "video", file: File(pickedFiles?.first.path ?? ''));
      fileElement.add(fileElementModel);
    }


    return fileElement;
  }

  Future<String> getImageUrl(File file) async {
    String image = "";
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref =
        storage.ref().child("image/chat" + DateTime.now().toString());
    UploadTask uploadTask = ref.putFile(file);
    await uploadTask.whenComplete(() async {
      image = await ref.getDownloadURL();
    });
    return image;
  }

  Future<void> getDetailChatRoom() async {
    try {
      String token = GlobalData.getUserModel().token ?? "";
      int userId = GlobalData.getUserModel().id ?? 0;

      isLoading.value = true;
      Map<String, dynamic> param = {
        "token": token,
        "userId": userId,
        "chatRoomId": chatRoomModel.id,
        "idUserCustomer": chatRoomModel.idCustomer
      };

      ResponseModel responseModel =
          await chatRepository.apiGetDetailChatRoom(param: param, token: token);

      if (responseModel.status) {
        detailChatRoomModel.value =
            DetailChatRoomModel.fromJson(responseModel.data);
      } else {
        isLoading.value = false;
        CommonUtil.showToast(responseModel.message);
      }
    } catch (e) {
      isLoading.value = false;
      log(e.toString());
      CommonUtil.showToast("Lỗi lấy thông tin room chat");
    }
  }

  Future<void> getListMessage() async {
    String token = GlobalData.getUserModel().token ?? "";
    int userId = GlobalData.getUserModel().id ?? 0;
    if (page == 0) {
      listMessage.value = [];
    }
    try {
      isLoading.value = true;
      Map<String, dynamic> param = {
        "token": token,
        "userId": userId,
        "chatRoomId": chatRoomModel.id,
        "page": page,
        "size": pageSize,
        "sortBy": "id",
        "sortDir": "asc"
      };
      ResponseModel responseModel =
          await chatRepository.apiGetListMessage(param: param, token: token);
      if (responseModel.status) {
        dynamic _listData = responseModel.data;

        if (_listData.isEmpty == true) {
          isLoading.value = false;
          isLoadMore = false;
          return;
        }
        isLoadMore = true;

        for (var item in _listData) {
          listMessage.add(MessageModel.fromJson(item));
        }
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      log(e.toString());
      CommonUtil.showToast("Lỗi lấy room chat");
    }
  }

  Future<void> loadMorePost() async {
    if (isLoadMore) {
      page = page + 1;
      await getListMessage();
    }
  }

  _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      loadMorePost();
    }
  }

  void initScrollController() {
    scrollController.addListener(_scrollListener);
  }

  Future<void> sendTestMessage(BuildContext context,
      {bool resend = false, MessageModel? resendMessage}) async {
    String token = GlobalData.getUserModel().token ?? "";
    int userId = GlobalData.getUserModel().id ?? 0;
    FocusScope.of(context).unfocus();

    MessageModel? newMessage;
    if (resend) {
      newMessage = resendMessage;
      newMessage?.sendMessageStatus = Constants.commentIsSending;
      if (newMessage != null) {
        listMessage.insert(listMessage.indexOf(resendMessage), newMessage);
        listMessage.remove(resendMessage);
      }
    } else {
      String dateTime =
          DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now());
      MessageModel messageModel = MessageModel(
        message: textEditingController.text.trim(),
        dateTime: dateTime,
        isReading: true,
        type: "text",
        idChatRoom: chatRoomModel.id,
        idUser: userId,
        sendMessageStatus: Constants.commentIsSending,
      );
      listMessage.add(messageModel);
      textEditingController.text = '';
    }
    Map<String, dynamic> param = {
      "token": token,
      "userId": userId,
      "message": textEditingController.text.trim(),
      "dateTime": "",
      "isReading": false,
      "type": "text",
      "idChatRoom": chatRoomModel.id,
      "media": "",
      "userIdCustomer": chatRoomModel.idCustomer
    };

    MyWebSocket.sendMessage(param);
  }

  onSocket() {
    int userId = GlobalData.getUserModel().id ?? 0;
    MyWebSocket.streamChat.stream.listen((event) {
      MessageModel messageModel = MessageModel.fromJson(event);
      if (messageModel.idChatRoom == chatRoomModel.id &&
          messageModel.idUser == userId) {
        int index =
            listMessage.indexWhere((element) => element.id == messageModel.id);
        if (index != -1) {
          listMessage[index] = listMessage[index]
              .copyWith(sendMessageStatus: Constants.commentSendSuccess);
        } else {
          listMessage[index] = listMessage[index]
              .copyWith(sendMessageStatus: Constants.commentSendFailed);
        }
      }

      if (messageModel.idChatRoom == chatRoomModel.id &&
          messageModel.idUser != userId) {
        listMessage.insert(0, messageModel);
        listMessage.refresh();
      }
    });
  }

  Future<void> sendMediaMessage(BuildContext context,
      {bool resend = false, MessageModel? resendMessage}) async {
    String token = GlobalData.getUserModel().token ?? "";
    int userId = GlobalData.getUserModel().id ?? 0;

    if (file?.isNotEmpty == true) {
      file?.forEach((element) async {
        double? fileSizeByte =
            element.file?.readAsBytesSync().lengthInBytes.toDouble() ?? 0.0;
        double fileSize = fileSizeByte / (1024 * 1024);
        if (fileSize < 10) {
          String imageUrl = await getImageUrl(element.file!);
          bool uploadFileSuccess = !CommonUtil.isEmpty(imageUrl);
          if (uploadFileSuccess) {
            Map<String, dynamic> param = {
              "token": token,
              "userId": userId,
              "message": "",
              "dateTime": "",
              "isReading": false,
              "type": element.type ?? "",
              "idChatRoom": chatRoomModel.id,
              "media": imageUrl,
              "userIdCustomer": chatRoomModel.idCustomer
            };

            MessageModel? newMessage;
            if (resend) {
              newMessage = resendMessage;
              newMessage?.sendMessageStatus = Constants.commentIsSending;
              if (newMessage != null) {
                listMessage.insert(
                    listMessage.indexOf(resendMessage), newMessage);
                listMessage.remove(resendMessage);
              }
            } else {
              String dateTime =
                  DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now());
              MessageModel messageModel = MessageModel(
                message: "",
                dateTime: dateTime,
                isReading: true,
                type: element.type ?? "",
                idChatRoom: chatRoomModel.id,
                idUser: userId,
                sendMessageStatus: Constants.commentIsSending,
              );
              listMessage.add(messageModel);
              textEditingController.text = '';
            }

            MyWebSocket.sendMessage(param);
          }
        }
      });

      file?.clear();
    }
  }

  Future<void> deleteChatRoom() async {
    String token = GlobalData.getUserModel().token ?? "";
    int userId = GlobalData.getUserModel().id ?? 0;
    Map<String, dynamic> param = {
      "token": token,
      "userId": userId,
      "idChatRoom": chatRoomModel.id
    };
    try {
      ResponseModel responseModel =
          await chatRepository.apiDeleteChatRoom(param: param, token: token);
      if (responseModel.status) {
        ChatController chatController = Get.find();
        chatController.listChatRoomModel.remove(chatRoomModel);
        chatController.refresh();
        Get.back();
      } else {
        CommonUtil.showToast(responseModel.message);
      }
    } catch (e) {
      CommonUtil.showToast("Lỗi khi xoá room chat");
    }
  }
}
