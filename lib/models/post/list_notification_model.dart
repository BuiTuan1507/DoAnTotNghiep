class ListNotificationModel {
  List<ListNotification>? listNotification;

  ListNotificationModel({this.listNotification});

  ListNotificationModel.fromJson(Map<String, dynamic> json) {
    if (json['listNotification'] != null) {
      listNotification = <ListNotification>[];
      json['listNotification'].forEach((v) {
        listNotification!.add(new ListNotification.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.listNotification != null) {
      data['listNotification'] =
          this.listNotification!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListNotification {
  int? id;
  bool? isNotificationUser;
  int? typeNotification;
  String? avatarUser;
  String? name;
  String? tittlePost;
  String? dateTime;
  int? userId;
  int? idPost;
  bool? isReading;

  ListNotification(
      {this.id,
        this.isNotificationUser,
        this.typeNotification,
        this.avatarUser,
        this.name,
        this.tittlePost,
        this.dateTime,
        this.userId,
        this.idPost,
        this.isReading
      });

  ListNotification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isNotificationUser = json['isNotificationUser'];
    typeNotification = json['typeNotification'];
    avatarUser = json['avatarUser'];
    name = json['name'];
    tittlePost = json['tittlePost'];
    dateTime = json['dateTime'];
    userId = json['userId'];
    idPost = json['idPost'];
    isReading = json['isReading'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['isNotificationUser'] = this.isNotificationUser;
    data['typeNotification'] = this.typeNotification;
    data['avatarUser'] = this.avatarUser;
    data['name'] = this.name;
    data['tittlePost'] = this.tittlePost;
    data['dateTime'] = this.dateTime;
    data['userId'] = this.userId;
    data['idPost'] = this.idPost;
    data['isReading'] = this.isReading;
    return data;
  }
}