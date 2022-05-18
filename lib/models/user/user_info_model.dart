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
  int? selectedId;
  List<Posts>? posts;
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
        this.selectedId,
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
    selectedId = json['selectedId'];
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
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
    data['selectedId'] = this.selectedId;
    if (this.posts != null) {
      data['posts'] = this.posts!.map((v) => v.toJson()).toList();
    }
    if (this.listAddress != null) {
      data['listAddress'] = this.listAddress!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class ListAddress {
  int? id;
  String? street;
  int? provinceId;
  String? province;
  int? districtId;
  String? district;
  int? wardId;
  String? ward;
  bool? isSelected;
  ListAddress(
      {this.id,
        this.street,
        this.provinceId,
        this.province,
        this.districtId,
        this.district,
        this.wardId,
        this.ward, this.isSelected
      });

  ListAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    street = json['street'];
    provinceId = json['provinceId'];
    province = json['province'];
    districtId = json['districtId'];
    district = json['district'];
    wardId = json['wardId'];
    ward = json['ward'];
    isSelected = false;
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
  ListAddress copyWith({
    int? id,
    String? street,
    int? provinceId,
    String? province,
    int? districtId,
    String? district,
    int? wardId,
    String? ward,
    bool? isSelected,
  }) =>
      ListAddress(
        id : id ?? this.id,
        street : street ?? this.street,
        provinceId : provinceId ?? this.provinceId,
        province : province ?? this.province,
        districtId : districtId ?? this.districtId,
        district : district ?? this.district,
        wardId: wardId ?? this.wardId,
        ward: ward ?? this.ward,
        isSelected: isSelected ?? this.isSelected,
      );
}



class Posts {
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
  List<Media>? media;
  List<dynamic>? likeUsers;
  List<dynamic>? watchUsers;

  Posts(
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
        this.media,
        this.likeUsers,
        this.watchUsers});

  Posts.fromJson(Map<String, dynamic> json) {
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
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(new Media.fromJson(v));
      });
    }
    if (json['likeUsers'] != null) {
      likeUsers = <Null>[];
      json['likeUsers'].forEach((v) {

      });
    }
    if (json['watchUsers'] != null) {
      watchUsers = <Null>[];
      json['watchUsers'].forEach((v) {

      });
    }
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
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
    if (this.likeUsers != null) {
      data['likeUsers'] = this.likeUsers!.map((v) => v.toJson()).toList();
    }
    if (this.watchUsers != null) {
      data['watchUsers'] = this.watchUsers!.map((v) => v.toJson()).toList();
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
    data['fileType'] = this.fileType;
    return data;
  }
}