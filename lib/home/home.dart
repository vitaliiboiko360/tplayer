import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tplayer/home/home_slider.dart';
import 'package:tplayer/logo/logo_holder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  final String title = 'Text Player';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      // appBar: AppBar(title: Image.asset('img/logo.png'), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            LogoHolder(),
            SizedBox(height: 10),
            HomeSlider(),
            HomeButtons(),
          ],
        ),
      ),
      floatingActionButton: Text('$screenHeight'),
    );
  }
}

class HomeButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [SizedBox(height: 30), OneLineButton()],
    );
  }
}

class OneLineButton extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Container(
      width: 220,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        shape: BoxShape.rectangle,
        gradient: RadialGradient(
          center: Alignment(-0.6, -0.6),
          radius: 2.0,
          colors: <Color>[
            Color(0xFFEEEEEE),
            Color.fromARGB(255, 158, 194, 204),
          ],
          stops: <double>[0.1, 1.0],
        ),
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: EdgeInsetsGeometry.only(left: 20, bottom: 10),
          child: Text('One Line'),
        ),
      ),
    );
  }
}
