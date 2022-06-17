class PostUserLikeModel {
  int? id;
  String? tittle;
  String? imagePost;
  String? editTime;

  PostUserLikeModel({this.id, this.tittle, this.imagePost, this.editTime});

  PostUserLikeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tittle = json['tittle'];
    imagePost = json['imagePost'];
    editTime = json['editTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tittle'] = this.tittle;
    data['imagePost'] = this.imagePost;
    data['editTime'] = this.editTime;
    return data;
  }
}