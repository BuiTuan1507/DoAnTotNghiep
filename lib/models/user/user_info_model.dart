class UserInfoModel {
  int? id;
  String? avatar;
  String? uuid;
  bool? isBlocked;
  bool? online;
  String? created;
  int? latitude;
  int? longitude;
  String? description;
  String? address;
  String? city;
  String? country;
  String? coverImage;
  String? link;
  int? sex;
  String? firstName;
  String? lastName;
  String? birthDay;
  String? phoneNumber;
  int? followingUser;
  int? followers;
  double? rating;
  String? email;
  int? point;
  List<dynamic>? posts;
  List<ListAddress>? listAddress;

  UserInfoModel(
      {this.id,
        this.avatar,
        this.uuid,
        this.isBlocked,
        this.online,
        this.created,
        this.latitude,
        this.longitude,
        this.description,
        this.address,
        this.city,
        this.country,
        this.coverImage,
        this.link,
        this.sex,
        this.firstName,
        this.lastName,
        this.birthDay,
        this.phoneNumber,
        this.followingUser,
        this.followers,
        this.rating,
        this.email,
        this.point,
        this.posts,
        this.listAddress});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avatar = json['avatar'];
    uuid = json['uuid'];
    isBlocked = json['isBlocked'];
    online = json['online'];
    created = json['created'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    description = json['description'];
    address = json['address'];
    city = json['city'];
    country = json['country'];
    coverImage = json['cover_image'];
    link = json['link'];
    sex = json['sex'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    birthDay = json['birth_day'];
    phoneNumber = json['phoneNumber'];
    followingUser = json['followingUser'];
    followers = json['followers'];
    rating = json['rating'];
    email = json['email'];
    point = json['point'];
    if (json['posts'] != null) {
      posts = <Null>[];
      json['posts'].forEach((v) {
        posts!.add(v);
      });
    }
    if (json['listAddress'] != null) {
      listAddress = <ListAddress>[];
      json['listAddress'].forEach((v) {
        listAddress!.add(new ListAddress.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['avatar'] = this.avatar;
    data['uuid'] = this.uuid;
    data['isBlocked'] = this.isBlocked;
    data['online'] = this.online;
    data['created'] = this.created;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['description'] = this.description;
    data['address'] = this.address;
    data['city'] = this.city;
    data['country'] = this.country;
    data['cover_image'] = this.coverImage;
    data['link'] = this.link;
    data['sex'] = this.sex;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['birth_day'] = this.birthDay;
    data['phoneNumber'] = this.phoneNumber;
    data['followingUser'] = this.followingUser;
    data['followers'] = this.followers;
    data['rating'] = this.rating;
    data['email'] = this.email;
    data['point'] = this.point;
    if (this.posts != null) {
      data['posts'] = this.posts!.map((v) => v?.toJson()).toList();
    }
    if (this.listAddress != null) {
      data['listAddress'] = this.listAddress!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListAddress {
  int? id;
  String? address;
  bool? isSelected;

  ListAddress({this.id, this.address, this.isSelected });

  ListAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    isSelected = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['address'] = this.address;
    return data;
  }
}