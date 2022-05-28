class DetailPostModel {
  Post? post;
  UserPostData? userPostData;

  DetailPostModel({this.post, this.userPostData});

  DetailPostModel.fromJson(Map<String, dynamic> json) {
    post = json['post'] != null ? new Post.fromJson(json['post']) : null;
    userPostData = json['userPostData'] != null
        ? new UserPostData.fromJson(json['userPostData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.post != null) {
      data['post'] = this.post!.toJson();
    }
    if (this.userPostData != null) {
      data['userPostData'] = this.userPostData!.toJson();
    }
    return data;
  }
}

class Post {
  int? id;
  String? createTime;
  int? liked;
  int? watch;
  String? editTime;
  String? conditionOfUse;
  String? formUse;
  int? money;
  String? tittle;
  String? content;
  int? idMainCategory;
  String? mainCategory;
  int? idSubCategory;
  String? subCategory;
  int? idAddress;
  String? address;
  bool? priority;
  List<Media>? media;
  bool? isLike;
  bool? isWatch;

  Post(
      {this.id,
        this.createTime,
        this.liked,
        this.watch,
        this.editTime,
        this.conditionOfUse,
        this.formUse,
        this.money,
        this.tittle,
        this.content,
        this.idMainCategory,
        this.mainCategory,
        this.idSubCategory,
        this.subCategory,
        this.idAddress,
        this.address,
        this.priority,
        this.media,
        this.isLike,
        this.isWatch});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createTime = json['createTime'];
    liked = json['liked'];
    watch = json['watch'];
    editTime = json['editTime'];
    conditionOfUse = json['conditionOfUse'];
    formUse = json['formUse'];
    money = json['money'];
    tittle = json['tittle'];
    content = json['content'];
    idMainCategory = json['idMainCategory'];
    mainCategory = json['mainCategory'];
    idSubCategory = json['idSubCategory'];
    subCategory = json['subCategory'];
    idAddress = json['idAddress'];
    address = json['address'];
    priority = json['priority'];
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(new Media.fromJson(v));
      });
    }
    isLike = json['isLike'];
    isWatch = json['isWatch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createTime'] = this.createTime;
    data['liked'] = this.liked;
    data['watch'] = this.watch;
    data['editTime'] = this.editTime;
    data['conditionOfUse'] = this.conditionOfUse;
    data['formUse'] = this.formUse;
    data['money'] = this.money;
    data['tittle'] = this.tittle;
    data['content'] = this.content;
    data['idMainCategory'] = this.idMainCategory;
    data['mainCategory'] = this.mainCategory;
    data['idSubCategory'] = this.idSubCategory;
    data['subCategory'] = this.subCategory;
    data['idAddress'] = this.idAddress;
    data['address'] = this.address;
    data['priority'] = this.priority;
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
    data['isLike'] = this.isLike;
    data['isWatch'] = this.isWatch;
    return data;
  }

  Post copyWith({
    int? id,
    String? createTime,
    int? liked,
    int? watch,
    String? editTime,
    String? conditionOfUse,
    String? formUse,
    int? money,
    String? tittle,
    String? content,
    int? idMainCategory,
    String? mainCategory,
    int? idSubCategory,
    String? subCategory,
    int? idAddress,
    String? address,
    bool? priority,
    List<Media>? media,
    bool? isLike,
    bool? isWatch,
  }) => Post(
      id: id ?? this.id,
      createTime: createTime ?? this.createTime,
      liked: liked ?? this.liked,
      watch: watch ?? this.watch,
      editTime: editTime ?? this.editTime,
      conditionOfUse: conditionOfUse ?? this.conditionOfUse,
      formUse: formUse ?? this.formUse,
      money: money ?? this.money,
      tittle: tittle ?? this.tittle,
      content: content ?? this.content,
      idMainCategory: idMainCategory ?? this.idMainCategory,
      mainCategory: mainCategory ?? this.mainCategory,
      idSubCategory: idSubCategory ?? this.idSubCategory,
      subCategory: subCategory ?? this.subCategory,
      idAddress: idAddress ?? this.idAddress,
      address: address ??  this.address,
      priority: priority ?? this.priority,
      media: media ?? this.media,
      isLike: isLike ?? this.isLike,
      isWatch: isWatch ?? this.isWatch
  );

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
    data['fileType'] = this.fileType;
    return data;
  }
}

class UserPostData {
  int? id;
  String? avatar;
  String? created;
  int? lengthOfPost;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;

  UserPostData(
      {this.id,
        this.avatar,
        this.created,
        this.lengthOfPost,
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.address
      });

  UserPostData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avatar = json['avatar'];
    created = json['created'];
    lengthOfPost = json['lengthOfPost'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['avatar'] = this.avatar;
    data['created'] = this.created;
    data['lengthOfPost'] = this.lengthOfPost;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phoneNumber'] = this.phoneNumber;
    data['address'] = this.address;
    return data;
  }
}