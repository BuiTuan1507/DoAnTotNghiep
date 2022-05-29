
import 'detail_post_model.dart';

class AnotherUserInfoModel {
  UserInfo? userInfo;
  List<PostData>? postData;

  AnotherUserInfoModel({this.userInfo, this.postData});

  AnotherUserInfoModel.fromJson(Map<String, dynamic> json) {
    userInfo = json['userInfo'] != null
        ? new UserInfo.fromJson(json['userInfo'])
        : null;
    if (json['postData'] != null) {
      postData = <PostData>[];
      json['postData'].forEach((v) {
        postData!.add(new PostData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userInfo != null) {
      data['userInfo'] = this.userInfo!.toJson();
    }
    if (this.postData != null) {
      data['postData'] = this.postData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserInfo {
  int? id;
  String? avatar;
  String? created;
  int? lengthOfPost;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  int? followingUser;
  int? followers;
  double? rating;
  Address? address;
  bool? follower;

  UserInfo(
      {this.id,
        this.avatar,
        this.created,
        this.lengthOfPost,
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.followingUser,
        this.followers,
        this.rating,
        this.address,
        this.follower});

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avatar = json['avatar'];
    created = json['created'];
    lengthOfPost = json['lengthOfPost'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    followingUser = json['followingUser'];
    followers = json['followers'];
    rating = json['rating'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    follower = json['follower'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['avatar'] = this.avatar;
    data['created'] = this.created;
    data['lengthOfPost'] = this.lengthOfPost;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phoneNumber'] = this.phoneNumber;
    data['followingUser'] = this.followingUser;
    data['followers'] = this.followers;
    data['rating'] = this.rating;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['follower'] = this.follower;
    return data;
  }

  UserInfo copyWith({
    int? id,
    String? avatar,
    String? created,
    int? lengthOfPost,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    int? followingUser,
    int? followers,
    double? rating,
    Address? address,
    bool? follower,
  }) => UserInfo(
      id: id ?? this.id,
      avatar: avatar ?? this.avatar,
      created: created ?? this.created,
      lengthOfPost: lengthOfPost ?? this.lengthOfPost,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      followingUser: followingUser ?? this.followingUser,
      followers: followers ?? this.followers,
      rating: rating ?? this.rating,
      address: address ?? this.address,
      follower: follower ?? this.follower
  );
}

class Address {
  int? id;
  String? street;
  int? provinceId;
  String? province;
  int? districtId;
  String? district;
  int? wardId;
  String? ward;

  Address(
      {this.id,
        this.street,
        this.provinceId,
        this.province,
        this.districtId,
        this.district,
        this.wardId,
        this.ward});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    street = json['street'];
    provinceId = json['provinceId'];
    province = json['province'];
    districtId = json['districtId'];
    district = json['district'];
    wardId = json['wardId'];
    ward = json['ward'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['street'] = this.street;
    data['provinceId'] = this.provinceId;
    data['province'] = this.province;
    data['districtId'] = this.districtId;
    data['district'] = this.district;
    data['wardId'] = this.wardId;
    data['ward'] = this.ward;
    return data;
  }
}

class PostData {
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

  PostData(
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

  PostData.fromJson(Map<String, dynamic> json) {
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
}

