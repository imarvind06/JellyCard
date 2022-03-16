import 'package:flutter/material.dart';
import 'package:jellycard/view_models/photo_view_model/photo_view_model.dart';
import 'package:jellycard/views/photo_view/enlarged_photo_view.dart';
import 'package:provider/provider.dart';

class PhotoView extends StatefulWidget {
  const PhotoView({Key? key}) : super(key: key);

  @override
  _PhotoViewState createState() => _PhotoViewState();
}

class _PhotoViewState extends State<PhotoView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<PhotoViewModel>().getData(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PhotoViewModel>(
      builder: (context, notifier, child) {
        return (notifier.isLoading)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : showPhotos(notifier);
      },
    );
  }

  Widget showPhotos(PhotoViewModel notifier) {
    return ListView.builder(
      itemCount: notifier.allPhoto.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  EnlargedPhotoView(notifier.allPhoto[index].url),
            ));
          },
          child: Card(
            child: Row(
              children: [
                Image.network(
                  notifier.allPhoto[index].thumbnailUrl,
                  width: 150,
                  loadingBuilder: (context, child, it) {
                    if (it == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    );
                  },
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Id :" + notifier.allPhoto[index].id.toString(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Text(
                          "AlbumId :" +
                              notifier.allPhoto[index].albumId.toString(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Title :" + notifier.allPhoto[index].title,
                          maxLines: 4,
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
