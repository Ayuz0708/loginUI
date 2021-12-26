import 'package:flutter/material.dart';
import 'package:loginpage/utils/routes.dart';
// ignore_for_file: prefer_const_constructors
class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {

  String name='';
  bool changedbtn=false;
  final _formkey=GlobalKey<FormState>();
  movetoHome(BuildContext context)
  async {
    if(_formkey.currentState!.validate()) {
      setState(() {
        changedbtn = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, Myroutes.homeRoute);
      setState(() {
        changedbtn = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child:SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
              children: [
               Image(image: AssetImage("assets/login.png",),fit: BoxFit.cover,
               ),
                SizedBox(height: 20,),
                Text('Welcome $name',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                ),),
                SizedBox(height: 20,),

                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter username",
                      labelText: "Username"
                    ),
                      validator:(value){
                      if(value!.isEmpty)
                        {
                          return "Username cannot be empty";
                        }
                      return null;
                      },
                    onChanged: (val){
                      name=val;
                      setState(() {

                      });
                    }
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(

                      hintText: "Enter password",
                      labelText: "Password",

                    ),
                    validator:(value){
                      if(value!.isEmpty)
                      {
                        return "Password cannot be empty";
                      }
                      else if(value.length<6)
                        {
                          return "Password should be more than 6 charectars";
                        }
                      return null;
                    },
                  ),
                ),
                SizedBox(height:40),
                Material(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(changedbtn?20:10),
                  child: InkWell(
                    onTap:() => movetoHome(context),
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      alignment: Alignment.center,
                      width: changedbtn?50:150,
                      height:40,
                      child: changedbtn?Icon(Icons.done,color: Colors.white,):Text('Login',style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,

                      ),),
                      decoration: BoxDecoration(

                      ),

                    ),
                  ),
                )
                /*ElevatedButton(
                   style:TextButton.styleFrom(minimumSize: Size(150,40)) ,
                    onPressed: (){
                      Navigator.pushNamed(context, Myroutes.homeRoute);
                    },
                    child: Text('Login')
                )*/
              ],
          ),
        ),
      )
    );
  }
}
