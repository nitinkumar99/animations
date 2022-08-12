import 'package:animation_project/screens/animation_list_screen.dart';
import 'package:flutter/material.dart';

class AnimationScreenFour extends StatefulWidget {
  const AnimationScreenFour({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AnimationScreenFourState();
  }
}

class AnimationScreenFourState extends State<AnimationScreenFour>
    with SingleTickerProviderStateMixin {
  // Simple variables for storing container values
  var color = Colors.blue;
  var height = 100.0;
  var width = 100.0;

  late Animation rotationAnimation;
  late AnimationController controller;

  @override
  initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    rotationAnimation = Tween(begin: 0.0, end: 3.14).animate(controller);
    if (mounted) {
      controller.forward();
    }
  }

  @override
  dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation four'),
        centerTitle: true,
      ),
      key: const Key('screen_four'),
      body: getAnimationContainer(),
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
                          builder: (context) => const AnimationListScreen()));
                },
                child: const Text('Next')),
          ),
        ],
      ),
    );
  }

  Widget getAnimationContainer() {
    return Center(
        child: AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.rotate(
            angle: rotationAnimation.value,
            child: Image.asset('assests/images/perspective_matte.png', height: 100, width: 200,),);
      },
    ));
  }
}
