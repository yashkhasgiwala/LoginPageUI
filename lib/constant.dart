import 'package:flutter/material.dart';

const kWelBack = TextStyle(
  fontSize: 21,
  color: Colors.white,
  fontWeight: FontWeight.w500,
);

const klogin = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w600,
  fontSize: 55,
);

const ktextfield = InputDecoration(
  hintText: 'Email',
  hintStyle: TextStyle(
    color: Colors.grey,
    fontSize: 15,
  ),
  suffixIcon: Icon(
    Icons.email,
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 2),
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 2.5),
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
);

const ksmalltext = TextStyle(color: Colors.grey, fontSize: 16);
