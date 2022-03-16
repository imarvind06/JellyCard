import 'package:flutter/material.dart';
import 'package:jellycard/services/photo_service/photo_service.dart';
import 'package:jellycard/services/posts_service/post_service.dart';
import 'package:jellycard/view_models/photo_view_model/photo_view_model.dart';
import 'package:jellycard/view_models/post_view_model/post_view_model.dart';
import 'package:jellycard/views/home_page_view.dart';
import 'package:provider/provider.dart';

void main() {
  //Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JelllyCard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => PhotoViewModel(PhotoService())),
          ListenableProvider(create: (context) => PostViewModel(PostService())),
          // Provider(create: (context) => PhotoViewModel(PhotoService())),
          // Provider(create: (context) => ),
        ],
        child: const HomePageView(),
      ),
    );
  }
}
