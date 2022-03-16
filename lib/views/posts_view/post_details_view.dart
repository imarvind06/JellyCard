import 'package:flutter/material.dart';
import 'package:jellycard/models/post_model/post_model.dart';

class PostDetailsView extends StatefulWidget {
  PostModel pm;
  PostDetailsView(this.pm);

  @override
  _PostDetailsViewState createState() => _PostDetailsViewState(pm);
}

class _PostDetailsViewState extends State<PostDetailsView> {
  PostModel pm;
  _PostDetailsViewState(this.pm);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Id :" + pm.id.toString(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text("UserId :" + pm.userId.toString(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text("Title :" + pm.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text(
                "Body :" + pm.body,
                style: TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
