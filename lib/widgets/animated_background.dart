import 'package:flutter/material.dart';
import 'package:resellah_landing_new/utils/constrants/images_string.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  final double navBarHeight = 100.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 30),
      vsync: this,
    )..repeat();

    _animation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -0.5),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final headerHeight = screenHeight - navBarHeight;
    
    return SizedBox(
      height: headerHeight,
      child: ClipRect(
        child: Stack(
          fit: StackFit.expand,
          children: [
            SlideTransition(
              position: _animation,
              child: Container(
                width: double.infinity,
                height: headerHeight * 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.textLogoLight),
                    repeat: ImageRepeat.repeat,
                    scale: 6.0,
                    opacity: 0.3,
                    alignment: Alignment.topCenter,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 