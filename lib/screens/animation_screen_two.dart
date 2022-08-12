import 'package:animation_project/screens/animation_screen_three.dart';
import 'package:flutter/material.dart';

class AnimationScreenTwo extends StatefulWidget {
  const AnimationScreenTwo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AnimationScreenTwoState();
  }
}

class AnimationScreenTwoState extends State<AnimationScreenTwo>
    with SingleTickerProviderStateMixin {

  // Simple variables for storing container values
  var color = Colors.blue;
  var height = 100.0;
  var width = 100.0;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation two'),
        centerTitle: true,
      ),
      key: const Key('first_screen'),
      body: getAnimationContainer(),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: TextButton(
                onPressed: () {
                  color = Colors.green;
                  height = MediaQuery.of(context).size.height;
                  width = MediaQuery.of(context).size.width;
                  setState(() {});
                },
                child: const Text('Animate')),
          ),
          Expanded(
            child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AnimationScreenThree()));
                },
                child: const Text('Next')),
          ),
        ],
      ),
    );
  }

  Widget getAnimationContainer() {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        color: color,
        height: height,
        width: width,
      ),
    );
  }
}
