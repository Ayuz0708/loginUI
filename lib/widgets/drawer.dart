import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors
class Mydrawer extends StatelessWidget {
  const Mydrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageurl="https://cdnb.artstation.com/p/assets/images/images/019/044/313/20190628153829/smaller_square/ben-martin-benmartin-week07-male.jpg?1561754309";
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          children: [
            DrawerHeader(
               padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  accountName: Text("Ben Martin"),
                  accountEmail:Text("ben07mrt@gmail.com") ,
                  currentAccountPicture: CircleAvatar(
                    backgroundImage:NetworkImage(imageurl) ,
                  )
                )
            ),
            ListTile(
              leading: Icon(CupertinoIcons.home,color: Colors.white,),
              title: Text('Home',textScaleFactor:1.2,style: TextStyle(color: Colors.white),),

            ),
            ListTile(
              leading: Icon(CupertinoIcons.profile_circled,color: Colors.white,),
              title: Text('Profile',textScaleFactor:1.2,style: TextStyle(color: Colors.white),),

            ),
            ListTile(
              leading: Icon(CupertinoIcons.mail_solid,color: Colors.white,),
              title: Text('Email',textScaleFactor:1.2,style: TextStyle(color: Colors.white),),

            )
          ],
        ),
      ),
    );
  }
}
