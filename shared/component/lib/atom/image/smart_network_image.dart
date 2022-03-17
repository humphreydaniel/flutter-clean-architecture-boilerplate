import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

class SmartNetworkImage extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final BoxFit fit;
  final BorderRadius radius;

  SmartNetworkImage(
    this.url, {
    this.width,
    this.height,
    this.fit,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    if (radius != null) {
      return ClipRRect(
        borderRadius: radius ?? BorderRadius.circular(0),
        child: FadeInImage.assetNetwork(
          placeholder: AssetsPath.placeholder,
          width: width,
          height: height,
          fit: fit,
          image: url ?? 'https://i.ibb.co/Ptcb9vd/img-placeholder.png',
        ),
      );
    }
    return FadeInImage.assetNetwork(
      placeholder: AssetsPath.placeholder,
      width: width,
      height: height,
      fit: fit,
      image: url ?? 'https://i.ibb.co/Ptcb9vd/img-placeholder.png',
    );
  }
}
