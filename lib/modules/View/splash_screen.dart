import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Get.offNamed('/home');
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                alignment: Alignment.center,
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("lib/assets/images/notebook.gif"),
                        fit: BoxFit.cover)),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Text("Notes App",
                style: GoogleFonts.dmSans(
                  textStyle: TextStyle(
                    fontSize: 35,
                    color: Colors.deepOrangeAccent,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
