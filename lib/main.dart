import 'package:fb_clone_tuto/post.dart';
import 'package:flutter/material.dart';
import 'post.dart';
import 'main_title.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FakeBook tuto',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Profil(),
    );
  }
}

class Profil extends StatelessWidget {
  // const Profil({Key? key}) : super(key: key);

  List<Post> posts = [
    Post(
        name: "Squall LeonHart",
        photo: "assets/squall.png",
        time: 1,
        image: "assets/gunblade.png",
        legend: "GunBlade",
        likes: 12,
        comments: 2),
    Post(
        name: "Linoa Heartilly",
        photo: "assets/linoa.png",
        time: 3,
        image: "assets/bgu.png",
        legend:
            "No. I just want you to show me around. You know, to get acquainted with the place. Please?",
        likes: 56,
        comments: 23),
    Post(
        name: "Zell Dincht",
        photo: "assets/zell.png",
        time: 5,
        image: "assets/balamb.png",
        legend: "Balamb Town",
        likes: 12,
        comments: 1)
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('FakeBook'),
      ),
      body: SingleChildScrollView(
        child: Container(
          // height: size.height,
          width: size.width,
          color: Colors.white,
          child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Image.asset(
                        "assets/space.jpeg",
                        width: size.width,
                        height: 170,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 120),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue,
                                offset: Offset(3, 3),
                              ),
                            ],
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            radius: 55,
                            backgroundColor: Colors.white,
                            foregroundImage: AssetImage("assets/squall.png"),
                          ),
                        ),
                      )
                    ],
                  ),
                  MainTitle("Squall Leonhart",
                      "Right and wrong are not what separate us and our enemies. It's our different standpoints, our perspectives that separate us."),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 25, 20, 25),
                        alignment: Alignment.center,
                        height: 35,
                        width: 280,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.blue,
                        ),
                        child: Text(
                          'Modifier le Profil',
                          // textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      // Spacer(),
                      Container(
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Colors.blue,
                        ),
                        child: IconButton(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 2),
                          onPressed: () {},
                          icon: Icon(Icons.edit_outlined),
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    width: size.width,
                    child: Column(
                        // mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Text(
                              "A propos de moi",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 5),
                                child: Icon(
                                  Icons.home,
                                  color: Colors.blue,
                                ),
                              ),
                              Text("Balamb")
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 5),
                                child: Icon(
                                  Icons.work,
                                  color: Colors.blue,
                                ),
                              ),
                              Text("Seed")
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 5),
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.blue,
                                ),
                              ),
                              Text("C'est Compliqué")
                            ],
                          )
                        ]),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  Container(
                    width: size.width,
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: const Text(
                      "Amis",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  friendList([
                    "assets/linoa.png",
                    "assets/seifer.png",
                    "assets/laguna.png",
                  ], [
                    "Linoa",
                    "Seifer",
                    "Laguna"
                  ]),
                  friendList([
                    "assets/irvine.png",
                    "assets/zell.png",
                    "assets/selphie.png",
                  ], [
                    "Irvine",
                    "Zell",
                    "Selphie"
                  ]),
                  const Divider(
                    thickness: 2,
                  ),
                  //Post
                  Container(
                    width: size.width,
                    color: Colors.grey[200],
                    child: Padding(
                        padding: const EdgeInsets.all(8.0), child: allPosts()),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Column allPosts() {
    List<Widget> postToAdd = [];
    posts.forEach((element) {
      postToAdd.add(post(post: element));
    });
    return Column(
      children: postToAdd,
    );
  }

  Column friendCard(String photo, String nom) {
    return Column(
      children: [
        Card(
          child: Image.asset(
            photo,
            width: 94,
            height: 80,
          ),
          elevation: 8,
        ),
        Text(nom)
      ],
    );
  }

  Row friendList(List photo, List nom) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        friendCard(photo[0], nom[0]),
        friendCard(photo[1], nom[1]),
        friendCard(photo[2], nom[2]),
      ],
    );
  }

  Row postTitle(String photo, String nom, int heure) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
          foregroundImage: AssetImage(photo),
        ),
        Text(nom),
        Spacer(),
        Text(heure <= 1 ? 'Il y a $heure heure' : 'Il y a $heure heures')
      ],
    );
  }

  Image imgAssets(String image) {
    return Image(
      image: AssetImage(image),
    );
  }

  Padding post({required Post post}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: postTitle(post.photo, post.name, post.time),
          ),
          imgAssets(post.image),
          Text(
            post.legend,
            style: TextStyle(color: Colors.grey[600]),
          ),
          Divider(),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              Text(post.setLikes()),
              Icon(
                Icons.message,
                color: Colors.blue,
              ),
              Text(post.setComments())
            ],
          )
        ],
      ),
    );
  }
}
