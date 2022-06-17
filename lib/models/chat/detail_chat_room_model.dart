class DetailChatRoomModel {
  InfoPostChat? infoPostChat;
  InfoUserChat? infoUserChat;

  DetailChatRoomModel({this.infoPostChat, this.infoUserChat});

  DetailChatRoomModel.fromJson(Map<String, dynamic> json) {
    infoPostChat = json['infoPostChat'] != null
        ? new InfoPostChat.fromJson(json['infoPostChat'])
        : null;
    infoUserChat = json['infoUserChat'] != null
        ? new InfoUserChat.fromJson(json['infoUserChat'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.infoPostChat != null) {
      data['infoPostChat'] = this.infoPostChat!.toJson();
    }
    if (this.infoUserChat != null) {
      data['infoUserChat'] = this.infoUserChat!.toJson();
    }
    return data;
  }
}

class InfoPostChat {
  int? id;
  String? tittle;
  int? money;
  String? image;

  InfoPostChat({this.id, this.tittle, this.money, this.image});

  InfoPostChat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tittle = json['tittle'];
    money = json['money'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tittle'] = this.tittle;
    data['money'] = this.money;
    data['image'] = this.image;
    return data;
  }
}

class InfoUserChat {
  String? avatar;
  String? name;
  String? phoneNumber;

  InfoUserChat({this.avatar, this.name, this.phoneNumber});

  InfoUserChat.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    name = json['name'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar'] = this.avatar;
    data['name'] = this.name;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}