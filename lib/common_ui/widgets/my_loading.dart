import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo/common_ui/resource/image_path.dart';

class MyLoading extends StatelessWidget {
  final LoadingType type;

  const MyLoading({Key? key, this.type = LoadingType.primary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
          LoadingType.primary == type ? Assets.loadingBlueJson : Assets.loadingWitheJson),
    );
  }
}

enum LoadingType { primary, secondary }
