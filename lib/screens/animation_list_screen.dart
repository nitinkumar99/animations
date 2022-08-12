import 'package:flutter/material.dart';

class AnimationListScreen extends StatefulWidget {
  const AnimationListScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AnimationListScreenState();
  }
}

class AnimationListScreenState extends State<AnimationListScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation _profilePictureAnimation;
  late Animation _contentAnimation;
  late Animation _listAnimation;
  late Animation _fabAnimation;
  late Animation _backArrowAnimation;

  @override
  initState() {
    super.initState();

    // iconSize goes from 0.0 to 50.0
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));

    _backArrowAnimation = Tween(begin: 0, end: 6.28).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.20, curve: Curves.easeOut)));

    _profilePictureAnimation = Tween(begin: 0.0, end: 30.0).animate(
        CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.0, 0.20, curve: Curves.easeOut)));

// fontSize goes from 0.0 to 34.0
    _contentAnimation = Tween(begin: 0.0, end: 34.0).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.20, 0.40, curve: Curves.easeOut)));

// Opacity goes from 0.0 to 1.0
    _listAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.40, 0.75, curve: Curves.easeOut)));

// Fab Size goes from size * 0.0 to size * 1.0
    _fabAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.75, 1.0, curve: Curves.easeOut)));
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _fabAnimation.value,
            child: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(icon: AnimatedBuilder(
          animation: _controller, builder: (context, child) {
          return Transform.rotate(angle: _backArrowAnimation.value, child: child,);
        }, child: const Icon(Icons.arrow_back_ios, color: Colors.black,),),
          onPressed: () => Navigator.pop(context),),
        actions: <Widget>[
          AnimatedBuilder(animation: _controller, builder: (context, child) {
            return IconButton(
              icon: const Icon(Icons.supervised_user_circle),
              color: Colors.black,
              onPressed: () {},
              iconSize: _profilePictureAnimation.value,
            );
          }),
        ],
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 16.0,
                ),
                AnimatedBuilder(
                    animation: _controller, builder: (context, child) {
                  return Text(
                    "Good Morning",
                    style: TextStyle(fontSize: _contentAnimation.value,
                        fontWeight: FontWeight.w600),
                  );
                }),
                const SizedBox(
                  height: 18.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Here are your plans for today",
                    style: TextStyle(fontSize: 18.0),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: AnimatedBuilder(
                animation: _controller, builder: (context, child) {
                return Opacity(
                  opacity: _listAnimation.value,
                  child: child,
                );
              }, child: ListView.builder(
                itemBuilder: (context, position) {
                  return CheckboxListTile(
                    title: Text("This is item $position"),
                    value: true,
                    onChanged: (val) {},
                  );
                },
                itemCount: 20,
              ),))
        ],
      ),
    );
  }
}
