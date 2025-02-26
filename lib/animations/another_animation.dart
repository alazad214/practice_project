import 'package:flutter/material.dart';

class AnotherAnimation extends StatefulWidget {
  const AnotherAnimation({super.key});

  @override
  AnotherAnimationState createState() => AnotherAnimationState();
}

class AnotherAnimationState extends State<AnotherAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _sizeAnimation = Tween<double>(begin: 170, end: 200.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hero Animation")),
      body: Center(
        child: Hero(
          tag: 'hero-tag',
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  'https://media.istockphoto.com/id/1147544807/vector/thumbnail-image-vector-graphic.jpg?s=612x612&w=0&k=20&c=rnCKVbdxqkjlcs3xH87-9gocETqpspHFXu5dIGB4wuM=',
                  width: _sizeAnimation.value,
                  height: _sizeAnimation.value,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
