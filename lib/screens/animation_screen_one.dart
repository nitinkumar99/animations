import 'package:animation_project/screens/animation_screen_two.dart';
import 'package:flutter/material.dart';

class AnimationScreenOne extends StatefulWidget {
  const AnimationScreenOne({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AnimationScreenOneState();
  }
}

class AnimationScreenOneState extends State<AnimationScreenOne>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation colorAnimation;
  late Animation sizeAnimation;

  bool isForward = true;

  @override
  initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    colorAnimation = ColorTween(begin: Colors.blue, end: Colors.yellow)
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));
    sizeAnimation = Tween<double>(begin: 100.0, end: 200.0).animate(controller);

    controller.addListener(() {
      setState(() {});
    });

    // Repeat the animation after finish
    controller.forward();

    //For single time
    //controller.forward()

    //Reverses the animation instead of starting it again and repeats
    //controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation one'),
        centerTitle: true,
      ),
      key: const Key('first_screen'),
      body: getAnimationContainer(),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: TextButton(
                onPressed: () {
                  if(isForward){
                    isForward = false;
                    controller.reverse();
                  }else{
                    isForward = true;
                    controller.forward();
                  }
                },
                child: const Text('Repeat')),
          ),
          Expanded(
            child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AnimationScreenTwo()));
                },
                child: const Text('Next')),
          ),
        ],
      ),
    );
  }

  Widget getAnimationContainer() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assests/images/perspective_matte.png', height: sizeAnimation.value, width: sizeAnimation.value,),
         /* Container(
            height: sizeAnimation.value,
            width: sizeAnimation.value,
            color: colorAnimation.value,
          ),*/
          const SizedBox(
            height: 100.0,
          ),

        ],
      ),
    );
  }
}
