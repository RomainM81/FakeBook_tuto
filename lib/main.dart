import 'package:flutter/material.dart';

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
  const Profil({Key? key}) : super(key: key);

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
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Squall Leonhart',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                Text(
                  "Right and wrong are not what separate us and our enemies. It's our different standpoints, our perspectives that separate us.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
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
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        post("assets/squall.png", "Squall LeonHart", 1,
                            "assets/gunblade.png", "GunBlade"),
                        post(
                            "assets/linoa.png",
                            "Linoa Heartilly",
                            3,
                            "assets/bgu.png",
                            "No. I just want you to show me around. You know, to get acquainted with the place. Please?"),
                        post("assets/zell.png", "Zell", 12, "assets/balamb.png",
                            "Balamb Town")
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
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

Padding post(String photo, String nom, int heure, String image, String legend) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: postTitle(photo, nom, heure),
        ),
        imgAssets(image),
        Text(
          legend,
          style: TextStyle(color: Colors.grey[600]),
        )
      ],
    ),
  );
}
