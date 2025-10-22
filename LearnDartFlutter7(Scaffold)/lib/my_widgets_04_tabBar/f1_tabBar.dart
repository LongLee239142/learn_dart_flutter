import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../my_widgets_03_listview/f1_listView.dart';
import '../my_widgets_03_listview/f2_gridView.dart';

class TabBarDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 10, // số tab
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          title: const Text('TabBar Demo'),
          bottom: TabBar(
            isScrollable: true,
            // Cho phép cuộn ngang
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.star), text: 'Favorites'),
              Tab(icon: Icon(Icons.person), text: 'Profile'),
              Tab(icon: Icon(Icons.settings), text: 'Settings'),
              Tab(icon: Icon(Icons.notifications), text: 'Notifications'),
              Tab(icon: Icon(Icons.message), text: 'Messages'),
              Tab(icon: Icon(Icons.shopping_cart), text: 'Cart'),
              Tab(icon: Icon(Icons.favorite), text: 'Likes'),
              Tab(icon: Icon(Icons.history), text: 'History'),
              Tab(icon: Icon(Icons.help), text: 'Help'),
            ],
            indicatorWeight: 3,
            indicatorColor: Colors.lightBlueAccent,
            labelColor: Colors.blueAccent,
            unselectedLabelColor: Colors.black26,
            tabAlignment: TabAlignment.start, // Căn trái các tab
          ),
        ),
        body: TabBarView(
          children: [
            GridViewDemo(),
            ListViewDemo(),
            Center(child: Text('Trang Profile')),
            Center(child: Text('Trang Settings')),
            Center(child: Text('Trang Notifications')),
            Center(child: Text('Trang Messages')),
            Center(child: Text('Trang Cart')),
            Center(child: Text('Trang Likes')),
            Center(child: Text('Trang History')),
            Center(child: Text('Trang Help')),
          ],
        ),
      ),
    );
  }
}
