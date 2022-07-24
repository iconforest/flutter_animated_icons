import 'package:flutter/material.dart';
import 'package:flutter_animated_icons/icons8.dart';
import 'package:flutter_animated_icons/lottiefiles.dart';
import 'package:flutter_animated_icons/useanimations.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Icons',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Animated Icons'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController _settingController;
  late AnimationController _favoriteController;
  late AnimationController _menuController;
  late AnimationController _bellController;
  late AnimationController _bookController;

  @override
  void initState() {
    super.initState();

    _settingController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _favoriteController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _menuController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _bellController = AnimationController(vsync: this, duration: const Duration(seconds: 1))..repeat();
    _bookController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    _settingController.dispose();
    _favoriteController.dispose();
    _menuController.dispose();
    _bellController.dispose();
    _bookController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /// Tap with animation example
            IconButton(
              splashRadius: 50,
              iconSize: 100,
              onPressed: () {
                _settingController.reset();
                _settingController.forward();
              },
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Lottie.asset(Icons8.adjust, controller: _settingController),
              ),
            ),

            /// Toggle example
            IconButton(
              splashRadius: 50,
              iconSize: 100,
              onPressed: () {
                if (_favoriteController.status == AnimationStatus.dismissed) {
                  _favoriteController.reset();
                  _favoriteController.animateTo(0.6);
                } else {
                  _favoriteController.reverse();
                }
              },
              icon: Lottie.asset(Icons8.heart_color, controller: _favoriteController),
            ),

            /// Hover example
            MouseRegion(
              onEnter: (event) {
                _bookController.repeat();
              },
              onExit: (event) {
                _bookController.stop();
              },
              child: IconButton(
                splashRadius: 50,
                iconSize: 100,
                onPressed: () {
                  if (_bookController.status == AnimationStatus.dismissed) {
                    _bookController.reset();
                    _bookController.animateTo(1);
                  } else {
                    _bookController.reverse();
                  }
                },
                icon: Lottie.asset(Icons8.book, controller: _bookController, height: 60, fit: BoxFit.fitHeight),
              ),
            ),

            /// repeat example
            IconButton(
              splashRadius: 50,
              iconSize: 100,
              onPressed: () {
                print(_bellController.status);
                if (_bellController.isAnimating) {
                  // _bellController.stop();
                  _bellController.reset();
                } else {
                  _bellController.repeat();
                }
              },
              icon: Lottie.asset(LottieFiles.$63128_bell_icon, controller: _bellController, height: 60, fit: BoxFit.cover),
            ),

            /// animation edited color example
            // To change color, goto https://lottiefiles.com/editor
            // original color
            IconButton(
              splashRadius: 50,
              iconSize: 100,
              onPressed: () {
                if (_menuController.status == AnimationStatus.dismissed) {
                  _menuController.reset();
                  _menuController.animateTo(0.6);
                } else {
                  _menuController.reverse();
                }
              },
              icon: Lottie.asset(Useanimations.menuV3, controller: _menuController, height: 60, fit: BoxFit.fitHeight),
            ),
            // changed color
            IconButton(
              splashRadius: 50,
              iconSize: 100,
              onPressed: () {
                if (_menuController.status == AnimationStatus.dismissed) {
                  _menuController.reset();
                  _menuController.animateTo(0.6);
                } else {
                  _menuController.reverse();
                }
              },
              icon: Lottie.asset(Useanimations.menuV3Blue, controller: _menuController, height: 60, fit: BoxFit.fitHeight),
            ),
          ],
        ),
      ),
    );
  }
}
