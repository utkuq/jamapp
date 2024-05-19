import 'package:flutter/material.dart';
import 'package:jamapp/screens/home_screen.dart';
import 'package:jamapp/screens/profile_screen.dart';
import 'package:jamapp/screens/search_screen.dart';

class TabViewScreen extends StatefulWidget {
  TabViewScreen();
  @override
  MenuScreenState createState() => MenuScreenState();
}

class MenuScreenState extends State<TabViewScreen> {
  MenuScreenState();
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: null,
      body: DefaultTabController(
        length: 3,
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
            ),
            const Scaffold(
              bottomNavigationBar: Padding(
                padding: EdgeInsets.only(bottom: 0),
                child: TabBar(
                  tabs: <Widget>[
                    Tab(
                      icon: Icon(Icons.home),
                    ),
                    Tab(
                      icon: Icon(Icons.search),
                    ),
                    Tab(
                      icon: Icon(Icons.account_circle),
                    ),
                  ],
                  labelColor: Color(0xff8c52ff),
                  indicator: UnderlineTabIndicator(
                    borderSide:
                        BorderSide(color: Color(0xff8c52ff), width: 4.0),
                    insets: EdgeInsets.only(bottom: 44),
                  ),
                  unselectedLabelColor: Colors.grey,
                ),
              ),
              body: TabBarView(
                children: <Widget>[
                  HomeScreen(),
                  SearchScreen(),
                  ProfileScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
