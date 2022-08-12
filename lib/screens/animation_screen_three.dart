import 'package:animation_project/screens/animation_screen_four.dart';
import 'package:flutter/material.dart';

class AnimationScreenThree extends StatefulWidget {
  const AnimationScreenThree({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AnimationScreenThreeState();
  }
}

class AnimationScreenThreeState extends State<AnimationScreenThree>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation sizeAnimation;

  //late Animation colorAnimation;

  @override
  initState() {
    super.initState();
    // In initState()
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

/*    sizeAnimation = Tween(begin: 100.0, end: 300.0).animate(
        CurvedAnimation(parent: controller, curve: const Interval(0.0, 0.5)));
    colorAnimation = ColorTween(begin: Colors.red, end: Colors.blue).animate(
        CurvedAnimation(parent: controller, curve: const Interval(0.5, 1.0)));*/

    sizeAnimation = TweenSequence(
      [
        TweenSequenceItem(tween: Tween(begin: 0.0, end: 100.0), weight: 1),
        TweenSequenceItem(tween: Tween(begin: 100.0, end: 50.0), weight: 1),
        TweenSequenceItem(tween: Tween(begin: 50.0, end: 75.0), weight: 1),
        TweenSequenceItem(tween: Tween(begin: 75.0, end: 25.0), weight: 1),
      ],
    ).animate(controller);

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation three'),
        centerTitle: true,
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Container(
              height: sizeAnimation.value,
              width: sizeAnimation.value,
              color: Colors.blue,
              // color: colorAnimation.value,
            );
          },
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: TextButton(
                onPressed: () {
                  controller.reset();
                  controller.forward();
                },
                child: const Text('Repeat')),
          ),
          Expanded(
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AnimationScreenFour()));
                },
                child: const Text('Next')),
          ),
        ],
      ),
    );
  }
}
