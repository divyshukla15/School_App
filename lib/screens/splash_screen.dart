import 'package:flutter/material.dart';
import 'package:school_app/route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //@override
  // ignore: empty_constructor_bodies
  ///Future.de
 // Navigator.of(context).pushReplacementNamed('login'),
  @override
  
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3),(){
  Navigator.of(context).pushReplacementNamed(MyRoute.loginScreen);});
    return  Center(
      child: Scaffold(
        backgroundColor: Colors.amberAccent,
       body: Center(
         child: Column(
           children: [
             Padding(
               padding: EdgeInsets.all(8.0),
               child: Image.asset("assets/boy.png", fit: BoxFit.cover)
             ),
             Text("School ", style: TextStyle(fontSize: 50), ),
             Text("App ", style: TextStyle(fontSize: 50), ),
           ],
         ),
       )
      ),
    );
  }
}