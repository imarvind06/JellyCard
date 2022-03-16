import 'package:flutter/material.dart';
import 'package:jellycard/views/photo_view/photo_view.dart';
import 'package:jellycard/views/posts_view/post_view.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('JellyCard'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.photo), text: "Photos"),
              Tab(icon: Icon(Icons.comment), text: "Posts")
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PhotoView(),
            PostView(),
          ],
        ),
      ),
    );
  }
}
