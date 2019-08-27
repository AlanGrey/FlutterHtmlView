import 'package:flutter/material.dart';

/// Created  on 2019/8/27.
/// @author grey
/// Function :

class ImageNetworkView extends StatefulWidget {
  ImageNetworkView({this.url, width, height})
      : this.width = width ?? 0,
        this.height = height ?? 0;

  final String url;
  final double width;
  final double height;

  @override
  State<StatefulWidget> createState() {
    return _ImageNetworkState();
  }
}

class _ImageNetworkState extends State<ImageNetworkView> {
  double w;
  double h;

  @override
  void didChangeDependencies() {
    if (widget.width != 0 && widget.height != 0) {
      double screenWidth = MediaQuery.of(context)?.size?.width;
      if (screenWidth != null && widget.width > screenWidth) {
        double scale = widget.width / screenWidth;
        w = screenWidth;
        h = widget.height / scale;
      } else {
        w = widget.width;
        h = widget.height;
      }
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return new Image.network(
      widget.url,
      width: w,
      height: h,
      fit: BoxFit.cover,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) {
          return child;
        }
        return AnimatedOpacity(
          child: child,
          opacity: frame == null ? 0 : 1,
          duration: const Duration(seconds: 1),
          curve: Curves.easeOut,
        );
      },
    );
  }
}
