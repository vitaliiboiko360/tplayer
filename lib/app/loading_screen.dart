import 'package:flutter/material.dart';
import 'package:dotlottie_flutter/dotlottie_flutter.dart';

class LottieLoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DotLottieView(
          sourceType: 'asset',
          source: 'assets/loading_spinner.lottie', // Your custom animation file
          width: 150,
          height: 150,
          // fit: BoxFit.fill,
        ),
      ),
    );
  }
}
