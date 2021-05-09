import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_2/widgets/ajout.dart';
import 'CategorieScroller.dart';
import 'Meuble_Data.dart';
import 'annonce.dart';
import 'profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'TripleString.dart';

class Meuble extends StatefulWidget {
  @override
  _MeubleState createState() => new _MeubleState();
}

class _MeubleState extends State<Meuble> {
  final CategoriesScroller categoriesScroller = CategoriesScroller();
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;
  List<TripleString> testList = [];
  List<Widget> itemsData = [];

  void getDataFire() {
    List<Widget> listItems = [];
    FirebaseFirestore.instance
        .collection('meubles')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        setState(() {
          TripleString t = new TripleString(
              doc["titre"], doc["description"], doc["adresse"]);
          listItems.add(Container(
              height: 150,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withAlpha(100), blurRadius: 10.0),
                  ]),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          doc["titre"],
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          doc["description"],
                          style:
                              const TextStyle(fontSize: 17, color: Colors.grey),
                        ),
                        Text(
                          doc["adresse"],
                          style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            icon: Icon(Icons.info, color: Colors.black),
                            iconSize: 20,
                            onPressed: () {
                              Navigator.push(context, new MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return new Annonce(t, 2);
                              }));
                            }),
                      ],
                    ),
                    Image.asset(
                      "assets/images/cross.png",
                      height: double.infinity,
                      width: 80,
                    )
                  ],
                ),
              )));
          itemsData = listItems;
        });
      });
    });
  }

  /*void getPostsData() {
    List<dynamic> responseList = MEUBLE_DATA;
    List<Widget> listItems = [];
    testList.forEach((post) {
      print("0");
      print(post.x);
      print(post.y);
      print(post.z);
    })
  }*/
  /*listItems.add(Container(
          height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post.x,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      post.y,
                      style: const TextStyle(fontSize: 17, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      post.z,
                      style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        icon: Icon(Icons.info, color: Colors.black),
                        onPressed: () {
                          Navigator.push(context, new MaterialPageRoute(
                              builder: (BuildContext context) {
                            return new Annonce(post.x, 2);
                          }));
                        }),
                  ],
                ),
                Image.asset(
                  "assets/images/armoir.png",
                  height: double.infinity,
                  width: 80,
                )
              ],
            ),
          )));
    });
    setState(() {
      itemsData = listItems;
    });
  }*/

  @override
  void initState() {
    super.initState();
    getDataFire();
    //getPostsData();
    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Meubles'),
        actions: [
          Icon(Icons.settings),
          Padding(
            padding: EdgeInsets.only(right: 10),
          ),
        ],
      ),
      body: new Container(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.builder(
                    controller: controller,
                    itemCount: itemsData.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      double scale = 1.0;
                      if (topContainer > 0.5) {
                        scale = index + 0.5 - topContainer;
                        if (scale < 0) {
                          scale = 0;
                        } else if (scale > 1) {
                          scale = 1;
                        }
                      }
                      return Opacity(
                        opacity: scale,
                        child: Transform(
                          transform: Matrix4.identity()..scale(scale, scale),
                          alignment: Alignment.bottomCenter,
                          child: Align(
                              heightFactor: 0.7,
                              alignment: Alignment.topCenter,
                              child: itemsData[index]),
                        ),
                      );
                    })),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (BuildContext context) {
              return new Ajout(2);
            }));
          },
          child: new Icon(Icons.add)),
    );
  }
}
