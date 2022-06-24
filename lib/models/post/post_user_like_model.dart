class PostUserLikeModel {
  int? id;
  String? tittle;
  String? imagePost;
  String? editTime;
  bool? isLike;

  PostUserLikeModel(
      {this.id, this.tittle, this.imagePost, this.editTime, this.isLike});

  PostUserLikeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tittle = json['tittle'];
    imagePost = json['imagePost'];
    editTime = json['editTime'];
    isLike = true;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['tittle'] = tittle;
    data['imagePost'] = imagePost;
    data['editTime'] = editTime;
    return data;
  }

  PostUserLikeModel copyWith(
          {int? id,
          String? tittle,
          String? imagePost,
          String? editTime,
          bool? isLike}) =>
      PostUserLikeModel(
        id: id ?? this.id,
        tittle: tittle ?? this.tittle,
        imagePost: imagePost ?? this.imagePost,
        editTime: editTime ?? this.editTime,
        isLike: isLike ?? this.isLike,
      );
}
