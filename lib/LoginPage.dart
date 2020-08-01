import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'constant.dart';
import 'formcontents.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
//  AnimationController controller;
  AnimationController controller1;
  //  Animation textAnim;
  Animation slideAnim;
  @override
  void initState() {
    super.initState();
//    controller =  AnimationController(
//      vsync: this,
//      duration: Duration(seconds:1),
//    );
    controller1 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

//    textAnim = TextStyleTween(
//        begin: TextStyle(color: Colors.deepOrange, fontSize: 0.0),
//        end: TextStyle(color: Colors.white, fontSize: 64.0)
//    ).animate(controller)..addListener(() {setState(() {});});

    slideAnim = Tween<Offset>(
      begin: Offset(0.5, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: controller1,
      curve: Curves.elasticInOut,
    ));

    Future.delayed(const Duration(seconds: 1), () {
//      controller.forward();
      controller1.forward();
    });
  }

  @override
  void dispose() {
//    controller.dispose();
    controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double x = MediaQuery.of(context).size.width;
    final double y = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: y,
              width: x,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.deepOrange,
                    Colors.orangeAccent,
                  ],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: x / 10, top: y / 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TyperAnimatedTextKit(
                      text: ['Login'],
                      textStyle: klogin,
                      speed: const Duration(milliseconds: 250),
                      isRepeatingAnimation: false,
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      'Welcome Back',
                      style: kWelBack,
                    ),
                  ],
                ),
              ),
            ),
            SlideTransition(
              position: slideAnim,
              child: Padding(
                padding: EdgeInsets.only(top: y / 3.5),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(70),
                    topLeft: Radius.circular(70),
                  ),
                  child: Container(
                    height: double.infinity,
                    color: Colors.white,
                    child: SingleChildScrollView(child: FormContents()),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
