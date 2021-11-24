import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  // const MainTitle({Key? key}) : super(key: key);
  final String name;
  final String catchP;

  MainTitle(this.name, this.catchP);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 0.0)),
          Text(
            name,
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 0.0)),
          Text(
            catchP,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
