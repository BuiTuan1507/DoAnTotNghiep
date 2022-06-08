class ListPostModel {
  List<Posts>? posts;
  List<Posts>? priorityPosts;
  int? pageNo;
  int? pageSize;

  ListPostModel({this.posts, this.priorityPosts, this.pageNo, this.pageSize});

  ListPostModel.fromJson(Map<String, dynamic> json) {
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
    if (json['priorityPosts'] != null) {
      priorityPosts = <Posts>[];
      json['priorityPosts'].forEach((v) {
        priorityPosts!.add(new Posts.fromJson(v));
      });
    }
    pageNo = json['pageNo'];
    pageSize = json['pageSize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.posts != null) {
      data['posts'] = this.posts!.map((v) => v.toJson()).toList();
    }
    if (this.priorityPosts != null) {
      data['priorityPosts'] =
          this.priorityPosts!.map((v) => v.toJson()).toList();
    }
    data['pageNo'] = this.pageNo;
    data['pageSize'] = this.pageSize;
    return data;
  }
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
  String? address;
  bool? priority;
  List<Media>? media;
  bool? isLike;
  bool? isWatch;
  int? state;
  bool? isExpired;
  double? rating;
  String? textRating;

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
        this.address,
        this.priority,
        this.media,
        this.isLike,
        this.isWatch,
        this.state,
        this.isExpired,
        this.rating,
        this.textRating});

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
    address = json['address'];
    priority = json['priority'];
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(new Media.fromJson(v));
      });
    }
    isLike = json['isLike'] ?? false;
    isWatch = json['isWatch'] ?? false;
    state = json['state'];
    isExpired = json['isExpired'];
    rating = json['rating'] ?? 0.0;
    textRating = json['textRating'] ?? "";
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
    data['state'] = this.state;
    data['isExpired'] = this.isExpired;
    data['rating'] = this.rating;
    data['textRating'] = this.textRating;
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