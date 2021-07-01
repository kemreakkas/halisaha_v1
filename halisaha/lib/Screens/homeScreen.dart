import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halisaha/login/googlesign.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:halisaha/login/login.dart';
import 'package:halisaha/Screens/profile.dart';
import 'package:halisaha/rt_database/rtdatabase.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePageWidget extends StatefulWidget {
  //HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final pageViewController1 = PageController();
  final pageViewController2 = PageController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final databaseReference = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF97A0DF),
        automaticallyImplyLeading: true,
        title: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {},
              child: Text('TextButton'),
            )),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Divider(),
            Expanded(
              child: Container(
                width: double.infinity,
                height: 500,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
                      child: PageView(
                        controller: pageViewController1,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Stack(
                            children: [
                              Align(
                                alignment: Alignment(0.01, 0),
                                child: GridView(
                                  padding: EdgeInsets.zero,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 1,
                                  ),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        child: TextButton(
                                          style: ButtonStyle(
                                            foregroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.blue),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProfileWidget()),
                                            );
                                          },
                                          child: Text('Profil'),
                                        )),
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        child: TextButton(
                                          style: ButtonStyle(
                                            foregroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.blue),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LOGIN()),
                                            );
                                          },
                                          child: Text('Login email'),
                                        )),
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        child: TextButton(
                                          style: ButtonStyle(
                                            foregroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.blue),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      FirebaseRealtimeScreen()),
                                            );
                                          },
                                          child: Text('realtime'),
                                        )),
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        child: TextButton(
                                          style: ButtonStyle(
                                            foregroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.blue),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      GooglesignPage()),
                                            );
                                          },
                                          child: Text('googlesign'),
                                        )),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Image.network(
                            'https://picsum.photos/seed/227/600',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          Image.network(
                            'https://picsum.photos/seed/155/600',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 1),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: SmoothPageIndicator(
                          controller: pageViewController1,
                          count: 3,
                          axisDirection: Axis.horizontal,
                          onDotClicked: (i) {
                            pageViewController1.animateToPage(
                              i,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          effect: ExpandingDotsEffect(
                            expansionFactor: 2,
                            spacing: 8,
                            radius: 16,
                            dotWidth: 16,
                            dotHeight: 16,
                            dotColor: Color(0xFF9E9E9E),
                            activeDotColor: Color(0xFF3F51B5),
                            paintStyle: PaintingStyle.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
            Expanded(
              child: Container(
                width: double.infinity,
                height: 500,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
                      child: PageView(
                        controller: pageViewController2,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Stack(
                            children: [
                              Align(
                                alignment: Alignment(0.01, 0),
                                child: GridView(
                                  padding: EdgeInsets.zero,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 1,
                                  ),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        child: TextButton(
                                          style: ButtonStyle(
                                            foregroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.blue),
                                          ),
                                          onPressed: () {},
                                          child: Text('TextButton'),
                                        )),
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        child: TextButton(
                                          style: ButtonStyle(
                                            foregroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.blue),
                                          ),
                                          onPressed: () {
                                            updateData();
                                          },
                                          child: Text('updateData'),
                                        )),
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        child: TextButton(
                                          style: ButtonStyle(
                                            foregroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.blue),
                                          ),
                                          onPressed: () {},
                                          child: Text('buttonboş'),
                                        )),
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        child: TextButton(
                                          style: ButtonStyle(
                                            foregroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.blue),
                                          ),
                                          onPressed: () {
                                            createData();
                                          },
                                          child: Text('createdata'),
                                        )),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Image.network(
                            'https://picsum.photos/seed/729/600',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          Image.network(
                            'https://picsum.photos/seed/985/600',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 1),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: SmoothPageIndicator(
                          controller: pageViewController2,
                          count: 3,
                          axisDirection: Axis.horizontal,
                          onDotClicked: (i) {
                            pageViewController2.animateToPage(
                              i,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          effect: ExpandingDotsEffect(
                            expansionFactor: 2,
                            spacing: 8,
                            radius: 16,
                            dotWidth: 16,
                            dotHeight: 16,
                            dotColor: Color(0xFF9E9E9E),
                            activeDotColor: Color(0xFF3F51B5),
                            paintStyle: PaintingStyle.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void createData() {
    databaseReference
        .child("kullanici111")
        .set({'name': 'Deepak Nishad', 'email': 'dene@q.com', 'sifre': 'qwe'});
  }

  void updateData() {
    databaseReference.child('kullanici111').update({'description': 'CEO'});
    databaseReference.child('kullanici111').update({'email': "gemail"});
    databaseReference
        .child('kullanici111')
        .update({'sifre': 'şifre değiştirilmiş'});
  }
}
