import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.offNamed(
                '/home',
              );
            },
            icon: Icon(
              CupertinoIcons.back,
              color: Colors.white,
            )),
        backgroundColor: Colors.deepOrangeAccent,
        title: Text("Favorites",
            style: GoogleFonts.dmSans(
              textStyle: TextStyle(color: Colors.white),
            )),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Container(
          //   height: 300,
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage(
          //           " https://i.pinimg.com/originals/7b/08/64/7b0864456aab583193c7776d80a4c493.gif"),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          SizedBox(
            height: 30,
          ),
          Text(
            "No Favorite Added Yet...",
            style: GoogleFonts.dmSans(
                textStyle: TextStyle(fontSize: 30, color: Colors.deepOrange)),
          ),
        ],
      )),
    );
  }
}
