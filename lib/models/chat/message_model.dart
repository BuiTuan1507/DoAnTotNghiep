import 'dart:io';

class MessageModel {
  int? id;
  String? message;
  String? dateTime;
  bool? isReading;
  String? type;
  int? idChatRoom;
  int? idUser;
  Media? media;
  bool? sendMessageStatus;
  FileElementModel? fileElement;

  MessageModel(
      {this.id,
        this.message,
        this.dateTime,
        this.isReading,
        this.type,
        this.idChatRoom,
        this.idUser,
        this.media,
        this.sendMessageStatus
      });

  MessageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    dateTime = json['dateTime'];
    isReading = json['isReading'];
    type = json['type'];
    idChatRoom = json['idChatRoom'];
    idUser = json['idUser'];
    media = json['media'] != null ? new Media.fromJson(json['media']) : null;
    sendMessageStatus = false;
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

class Media {
  int? id;
  String? fileName;
  String? fileDownloadUri;
  String? fileType;

  Media({this.id, this.fileName, this.fileDownloadUri, this.fileType});

  Media.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fileName = json['fileName'];
    fileDownloadUri = json['fileDownloadUri'];
    fileType = json['fileType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fileName'] = this.fileName;
    data['fileDownloadUri'] = this.fileDownloadUri;
    data['fileType'] = fileType;
    return data;
  }
}
class FileElementModel {
  FileElementModel({
    this.linkFile,
    this.name,
    this.type,
    this.file,
  });

  final String? linkFile;
  final String? name;
  final String? type;
  final File? file;

  factory FileElementModel.fromJson(Map<String, dynamic> json) => FileElementModel(
    linkFile: json["link_file"],
    name: json["name"],
    type: json["type"] ?? null,
  );

  Map<String, dynamic> toJson() => {
    "link_file": linkFile,
    "name": name,
    "type": type,
  };
}
