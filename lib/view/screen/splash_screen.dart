import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:newsapp/view/screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen(),));
     });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      body: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset(
            "assets/splash_pic.jpg",
            fit: BoxFit.cover,
            height: height * .5,
            width: width * .9,
          ),
          SizedBox(
            height: height * 0.04,
          ),
          Text("Top news",style:GoogleFonts.anton(letterSpacing: .6,color: Colors.grey.shade700,fontSize: 30),),
          SpinKitChasingDots(color: Colors.black,size: 40,) 
        ]),
      ),
    );
  }
}
