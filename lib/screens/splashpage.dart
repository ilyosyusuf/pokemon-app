import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lesson28/core/components/mytext.dart';
import 'package:lesson28/core/constants/colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), (){
      Navigator.pushNamed(context, '/home',);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          children: [
            Spacer(),
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/images/image6.png'),
            ),
            Spacer(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/images/image5.png', fit: BoxFit.cover,),
            ),
          ],
        ),
        decoration: BoxDecoration(
          gradient: GradientColor.gradientColor,
        )
      ),
    );
  }
}