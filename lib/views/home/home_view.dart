import 'package:flutter/material.dart';
import 'package:resellah_landing_new/utils/constrants/colors.dart';
import 'package:resellah_landing_new/widgets/header.dart';
import 'package:resellah_landing_new/widgets/navigation/nav_bar.dart';



class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteContainerColor,
      body: SizedBox.expand(
        child: Stack(
          children: <Widget>[
            NavBar(key: UniqueKey()),
            Positioned(
              top: 100, // Height of NavBar
              left: 0,
              right: 0,
              bottom: 0,


              child: Header(key: UniqueKey()),
            ),
          ],
        ),
      ),
    );
  }
}


