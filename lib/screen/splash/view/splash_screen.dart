import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/provider/home_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, "home");
      },
    );
    context.read<HomeProvider>().getJson();
    context.read<HomeProvider>().getJson2();
    // context.read<HomeProvider>().randomVerse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text("Splash Screen"),
          ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Center(
            child: Image.asset("assets/images/image.png"),
          ),
           Spacer(),
           Expanded(child: Container(height: 280,width: 225,child: Image.asset("assets/images/BhagvadGeeta.png",fit: BoxFit.fill,))),
        ],
      )
      //     Center(
      // child: Image.asset("assets/images/image.png"),
      // ),
      // bottomSheet: Image.asset("assets/images/BhagvadGeeta.png"
      // )
      ,
    );
  }
}
