import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 4));
    _fadeAnimation = CurvedAnimation(parent: _animationController, curve: Curves.easeOut);

    _animationController.forward();

    _videoPlayerController =
        VideoPlayerController.asset(Uri.encodeFull('lib/features/landing/assets/videos/smoke.mp4'))
          ..setLooping(true)
          ..setVolume(0.0)
          ..initialize().then((_) {
            setState(() {});
            _videoPlayerController.play();
          });

    Future.delayed(const Duration(seconds: 3), () {
      //ignore: use_build_context_synchronously
      context.go('/home', extra: 'landing');
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Center(
          child: Stack(
            children: [
              if (_videoPlayerController.value.isInitialized)
                SizedBox.expand(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: _videoPlayerController.value.size.width,
                      height: _videoPlayerController.value.size.height,
                      child: VideoPlayer(_videoPlayerController),
                    ),
                  ),
                ),
              Center(
                child: Text(
                  'DevCon',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
