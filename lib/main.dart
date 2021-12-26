import 'package:flutter/material.dart';
import 'package:loginpage/pages/cartpage.dart';
import 'package:loginpage/pages/homepage.dart';
import 'package:loginpage/pages/login.dart';
import 'package:flutter/services.dart';
import 'package:loginpage/utils/routes.dart';
import 'package:loginpage/widgets/themes.dart';

// ignore_for_file: prefer_const_constructors

void main()
{
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return  MaterialApp(
      themeMode: ThemeMode.system,
      theme: Mytheme.lightTheme(context),
      darkTheme:Mytheme.DarkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: Myroutes.homeRoute,
      routes:{

        "/":(context) => Loginpage(),
        Myroutes.homeRoute:(context)=> Homepage(),
        Myroutes.loginRoute:(context)=> Loginpage(),
        Myroutes.cartRoute:(context)=> CartPage()
      },
    );
  }
}

