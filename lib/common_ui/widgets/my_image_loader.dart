import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:todo/common_ui/resource/my_colors.dart';

class MyImageLoader extends StatelessWidget {
  final String? imageUrl;
  final ImageTypeLoader typeLoader;
  final bool isProvider;
  final BoxFit? fit;

  const MyImageLoader(
      {Key? key, required this.imageUrl, required this.typeLoader, this.isProvider = false, this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
      return typeLoader == ImageTypeLoader.network
          ? CachedNetworkImage(
              imageUrl: imageUrl ?? "",
              fit: fit,
              progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                child: CircularProgressIndicator(
                  value: downloadProgress.progress,
                  color: MyColors.primary,
                ),
              ),
              errorWidget: (context, url, error) => const Center(
                child: Icon(
                  Hicons.warning_light_outline,
                  color: MyColors.primary,
                ),
              ),
            )
          : Image.asset(imageUrl ?? "", fit: fit,);
  }
}

enum ImageTypeLoader { network, asset }
