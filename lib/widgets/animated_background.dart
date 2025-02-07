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
  final double navBarHeight = 100.0; // Exact NavBar height

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 40),
      vsync: this,
    )..repeat();

    _animation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -1),
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

  Widget _buildPatternContainer(double height) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.textLogoLight),
          repeat: ImageRepeat.repeat,
          scale: 6.0,
          opacity: 0.3,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final headerHeight = screenHeight - navBarHeight;
    
    return SizedBox(
      height: headerHeight,
      child: ClipRect(
        child: Stack(
          children: [
            // First sliding pattern
            SlideTransition(
              position: _animation,
              child: _buildPatternContainer(headerHeight),
            ),
            // Second sliding pattern that follows
            SlideTransition(
              position: _animation,
              child: Transform.translate(
                offset: Offset(0, headerHeight),
                child: _buildPatternContainer(headerHeight),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 