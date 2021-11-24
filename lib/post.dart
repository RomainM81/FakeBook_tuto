class Post {
  String name;
  String photo;
  int time;
  String image;
  String legend;
  int likes = 0;
  int comments = 0;

  Post(
      {required this.name,
      required this.photo,
      required this.time,
      required this.image,
      required this.legend,
      required this.likes,
      required this.comments});

  String setTime() {
    return "Il y a $time";
  }

  String setLikes() {
    return "$likes j'aime";
  }

  String setComments() {
    return comments > 1 ? "$comments commentaires" : "$comments commentaire";
  }
}
