import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
// ignore_for_file: prefer_const_constructors
class Mytheme
{
  static ThemeData lightTheme(BuildContext context) => ThemeData(
       primarySwatch: Colors.deepPurple,
       cardColor: Colors.white,
       canvasColor: creamColor,
       buttonColor: lightBluishColor,
       appBarTheme: AppBarTheme(
         color: Colors.white,
         elevation: 0.0,
         iconTheme: IconThemeData(color: Colors.black),

       ),
       fontFamily: GoogleFonts.lato().fontFamily
   ) ;
  static ThemeData DarkTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      buttonColor: lightBluishColor,
      cardColor: Colors.black,
      canvasColor: darkcreamColor,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
   )) ;
   static Color creamColor = Color(0xfff5f5f5);
   static Color darkBluishColor = Color(0xff403b58);
   static Color darkcreamColor = Vx.gray900;
   static Color lightBluishColor=Vx.purple400;

}