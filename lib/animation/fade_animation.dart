import 'package:flutter/material.dart';

class FadeInUpAnimation extends StatefulWidget {
  final Widget child;
  final double delay;

  const FadeInUpAnimation({
    required this.child,
    this.delay = 0.0,
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FadeInUpAnimationState createState() => _FadeInUpAnimationState();
}

class _FadeInUpAnimationState extends State<FadeInUpAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Delay the animation based on the provided delay parameter
    Future.delayed(Duration(seconds: widget.delay.toInt()), () {
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, 50 * (1 - _animation.value)),
          child: Opacity(
            opacity: _animation.value,
            child: widget.child,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
