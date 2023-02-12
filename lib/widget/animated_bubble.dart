import 'package:flutter/material.dart';

class AnimatedBubble extends StatefulWidget {
  final int quantity;
  final bool animate;

  const AnimatedBubble(
      {required this.quantity, required this.animate, Key? key})
      : super(key: key);

  @override
  State<AnimatedBubble> createState() => _AnimatedBubbleState();
}

class _AnimatedBubbleState extends State<AnimatedBubble>
    with TickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
    lowerBound: 1.0,
    upperBound: 1.2,
    duration: const Duration(milliseconds: 200),
    vsync: this,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    if (widget.animate) {
      _controller.forward().then((value) => _controller.reverse());
    }

    return AnimatedBuilder(
      animation: _controller,
      child: Container(
        width: 34.0,
        height: 34.0,
        decoration: BoxDecoration(
            border:
                Border.all(color: themeData.colorScheme.onPrimary, width: 2.0),
            shape: BoxShape.circle,
            color: themeData.colorScheme.primary),
        child: Center(
          child: Text(
            widget.quantity.toString(),
            style: themeData.textTheme.bodyMedium
                ?.copyWith(color: themeData.colorScheme.onPrimary),
            maxLines: 1,
          ),
        ),
      ),
      builder: (context, child) {
        return Transform.scale(
          scale: _controller.value,
          child: child,
        );
      },
    );
  }
}
