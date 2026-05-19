import 'package:flutter/material.dart';
import 'package:dotlottie_flutter/dotlottie_flutter.dart';

class SlideAnime extends StatefulWidget {
  const SlideAnime({super.key});

  @override
  State<SlideAnime> createState() => _SlideAnimeState();
}

class _SlideAnimeState extends State<SlideAnime> {
  DotLottieViewController? _controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // DotLottie animation view
        SizedBox(
          width: 350,
          height: 200,
          child: DotLottieView(
            sourceType: 'asset',
            source: 'ani/world.lottie',
            autoplay: true,
            loop: true,
            onViewCreated: (controller) {
              _controller = controller;
            },
            onLoad: () {
              // Do something
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _controller?.play(),
              child: const Text('Play'),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () => _controller?.pause(),
              child: const Text('Pause'),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () => _controller?.stop(),
              child: const Text('Stop'),
            ),
          ],
        ),
      ],
    );
  }
}
