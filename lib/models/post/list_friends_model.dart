class ListFriendsModel {
  List<Follower>? follower;
  List<Follower>? followerOf;

  ListFriendsModel({this.follower, this.followerOf});

  ListFriendsModel.fromJson(Map<String, dynamic> json) {
    if (json['follower'] != null) {
      follower = <Follower>[];
      json['follower'].forEach((v) {
        follower!.add(new Follower.fromJson(v));
      });
    }
    if (json['followerOf'] != null) {
      followerOf = <Follower>[];
      json['followerOf'].forEach((v) {
        followerOf!.add(new Follower.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.follower != null) {
      data['follower'] = this.follower!.map((v) => v.toJson()).toList();
    }
    if (this.followerOf != null) {
      data['followerOf'] = this.followerOf!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Follower {
  int? id;
  String? avatar;
  String? created;
  int? lengthOfPost;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;

  Follower(
      {this.id,
        this.avatar,
        this.created,
        this.lengthOfPost,
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.address});

  Follower.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
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