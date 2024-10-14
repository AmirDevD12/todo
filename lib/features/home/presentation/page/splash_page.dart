
import 'package:flutter/material.dart';
import 'package:todo/core/utils/my_app_localization.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        alignment: Alignment.center,
        child: Text(context.translate.start),
      ),
    );
  }
}
