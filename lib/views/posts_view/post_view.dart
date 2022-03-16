import 'package:flutter/material.dart';
import 'package:jellycard/view_models/post_view_model/post_view_model.dart';
import 'package:jellycard/views/posts_view/post_details_view.dart';
import 'package:provider/provider.dart';

class PostView extends StatefulWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<PostViewModel>().getData(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PostViewModel>(
      builder: (context, notifier, child) {
        return (notifier.isLoading)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : showPosts(notifier);
      },
    );
  }

  Widget showPosts(PostViewModel notifier) {
    return ListView.builder(
      itemCount: notifier.allPost.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PostDetailsView(notifier.allPost[index]),
            ));
          },
          child: Card(
            child: Flexible(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Title :" + notifier.allPost[index].title,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text(
                      "Body :" + notifier.allPost[index].body,
                      style:
                          TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
