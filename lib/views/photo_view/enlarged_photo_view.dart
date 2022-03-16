import 'package:flutter/material.dart';

class EnlargedPhotoView extends StatefulWidget {
  final String url;
  EnlargedPhotoView(this.url);

  @override
  _EnlargedPhotoViewState createState() => _EnlargedPhotoViewState(url);
}

class _EnlargedPhotoViewState extends State<EnlargedPhotoView> {
  final String url;
  _EnlargedPhotoViewState(this.url);
  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      child: Image.network(
        url,
        fit: BoxFit.fill,
      ),
    );
  }
}
