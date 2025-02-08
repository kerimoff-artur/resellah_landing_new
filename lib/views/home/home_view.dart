import 'package:flutter/material.dart';
import 'package:resellah_landing_new/utils/constrants/colors.dart';
import 'package:resellah_landing_new/widgets/header.dart';
import 'package:resellah_landing_new/widgets/navigation/nav_bar.dart';
import 'package:resellah_landing_new/widgets/navigation/mobile_drawer.dart';
import 'package:resellah_landing_new/utils/responsive/responsive.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteContainerColor,
      endDrawer: Responsive.isMobile(context) ? const MobileDrawer() : null,
      body: SizedBox.expand(
        child: Stack(
          children: <Widget>[
            const NavBar(),
            Positioned(
              top: 100, // Height of NavBar
              left: 0,
              right: 0,
              bottom: 0,
              child: const Header(),
            ),
          ],
        ),
      ),
    );
  }
}


