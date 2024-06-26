import '../post/detail_post_model.dart';

class ChatRoomModel {
  int? id;
  String? createTime;
  int? idUser;
  int? idCustomer;
  String? avatarCustomer;
  String? nameCustomer;
  bool? isUserAddPost;
  String? tittlePost;
  String? avatarPost;
  LastMessage? lastMessage;
  int? countReadMessage;
  String? patternMessage;

  ChatRoomModel(
      {this.id,
        this.createTime,
        this.idUser,
        this.idCustomer,
        this.avatarCustomer,
        this.nameCustomer,
        this.isUserAddPost,
        this.tittlePost,
        this.avatarPost,
        this.lastMessage,
        this.countReadMessage,
        this.patternMessage
      });

  ChatRoomModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createTime = json['createTime'];
    idUser = json['idUser'];
    idCustomer = json['idCustomer'];
    avatarCustomer = json['avatarCustomer'];
    nameCustomer = json['nameCustomer'];
    isUserAddPost = json['isUserAddPost'];
    tittlePost = json['tittlePost'];
    avatarPost = json['avatarPost'];
    lastMessage = json['lastMessage'] != null
        ? new LastMessage.fromJson(json['lastMessage'])
        : null;
    countReadMessage = json['countReadMessage'];
    patternMessage = "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createTime'] = this.createTime;
    data['idUser'] = this.idUser;
    data['idCustomer'] = this.idCustomer;
    data['avatarCustomer'] = this.avatarCustomer;
    data['nameCustomer'] = this.nameCustomer;
    data['isUserAddPost'] = this.isUserAddPost;
    data['tittlePost'] = this.tittlePost;
    data['avatarPost'] = this.avatarPost;
    if (this.lastMessage != null) {
      data['lastMessage'] = this.lastMessage!.toJson();
    }
    data['countReadMessage'] = this.countReadMessage;
    return data;
  }
}

class LastMessage {
  int? id;
  String? message;
  String? dateTime;
  bool? isReading;
  String? type;
  int? idChatRoom;
  int? idUser;
  Media? media;

  LastMessage(
      {this.id,
        this.message,
        this.dateTime,
        this.isReading,
        this.type,
        this.idChatRoom,
        this.idUser,
        this.media});

  LastMessage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    dateTime = json['dateTime'];
    isReading = json['isReading'];
    type = json['type'];
    idChatRoom = json['idChatRoom'];
    idUser = json['idUser'];
    media = json['media'] != null ? new Media.fromJson(json['media']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['message'] = this.message;
    data['dateTime'] = this.dateTime;
    data['isReading'] = this.isReading;
    data['type'] = this.type;
    data['idChatRoom'] = this.idChatRoom;
    data['idUser'] = this.idUser;
    if (this.media != null) {
      data['media'] = this.media!.toJson();
    }
    return data;
  }
}
