class PostUserDataModel {
  int? id;
  String? tittle;
  String? imagePost;
  String? editTime;
  double? rating;
  String? textRating;
  int? idUser;
  String? nameUser;
  String? avatarUser;

  PostUserDataModel(
      {this.id,
        this.tittle,
        this.imagePost,
        this.editTime,
        this.rating,
        this.textRating,
        this.idUser,
        this.nameUser,
        this.avatarUser});

  PostUserDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tittle = json['tittle'];
    imagePost = json['imagePost'];
    editTime = json['editTime'];
    rating = json['rating'];
    textRating = json['textRating'];
    idUser = json['idUser'];
    nameUser = json['nameUser'];
    avatarUser = json['avatarUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tittle'] = this.tittle;
    data['imagePost'] = this.imagePost;
    data['editTime'] = this.editTime;
    data['rating'] = this.rating;
    data['textRating'] = this.textRating;
    data['idUser'] = this.idUser;
    data['nameUser'] = this.nameUser;
    data['avatarUser'] = this.avatarUser;
    return data;
  }
}