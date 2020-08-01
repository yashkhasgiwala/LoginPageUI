import 'package:flutter/material.dart';

import 'constant.dart';

class Button extends StatelessWidget {
  Color c;
  String s;
  Button(this.s, this.c);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: c, borderRadius: BorderRadius.all(Radius.circular(28))),
      width: 130,
      height: 50,
      child: Center(
        child: Text(
          s,
          style: kWelBack,
        ),
      ),
    );
  }
}
