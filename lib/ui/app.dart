import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_flutter/pages/TrendingListPage.dart';

class MyGithubClient extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MyGithubClientState();
}

class MyGithubClientState extends State<MyGithubClient> {

  int _tabIndex = 0;
  var _body;
  var appBarTitles = ['排行榜', '登录'];

  Image getTabImage(path) {
    return new Image.asset(path, width: 20.0, height: 20.0);
  }

  Text getTabTitle(currentIndex) {
    return new Text(appBarTitles[currentIndex], style: new TextStyle(color: Colors.white));
  }

  void initData() {
    _body = new IndexedStack(
      children: <Widget>[
        new GithubTrending(),
        new GithubTrending(),
      ],
      index: _tabIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.blue
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(appBarTitles[_tabIndex], style: new TextStyle(color: Colors.white)),
          iconTheme: new IconThemeData(color: Colors.white)
        ),
        body: _body,
        bottomNavigationBar: new CupertinoTabBar(
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
              icon: getTabImage("images/github_image_normal.png"),
              title: getTabTitle(0)
            ),
            new BottomNavigationBarItem(
              icon: getTabImage("images/ic_nav_my_normal.png"),
              title: getTabTitle(1)
            ),
          ],
          currentIndex: _tabIndex,
          onTap: (index) {
            setState((){
              _tabIndex = index;
            });
          },
        ),
      ),
    );
  }
}