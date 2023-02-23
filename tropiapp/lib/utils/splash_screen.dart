import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          color: Colors.orange,
          child: Center(
            child: SvgPicture.asset('assets/icons/logo3.svg'),
          ),
        ),
      ),
    );
  }
}
