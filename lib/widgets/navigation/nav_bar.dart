import 'package:flutter/material.dart';
import 'package:resellah_landing_new/utils/constrants/images_string.dart';
import 'package:resellah_landing_new/utils/constrants/colors.dart';

class NavBar extends StatelessWidget {
  const NavBar({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.greenContainerColor,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            width: 150, 
            height: 100, 
            child: Image.asset(AppImages.orangeLogo)
          ),

          Padding(
            padding: const EdgeInsets.only(right: 50),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _NavBarItem('Partnership'),
                SizedBox(width: 20),
                _NavBarItem('For Investors'),
                SizedBox(width: 20),
                _NavBarItem('Contacts'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NavBarItem extends StatefulWidget {
  final String title;
  const _NavBarItem(this.title);

  @override
  State<_NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<_NavBarItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Text(
        widget.title,
        style: TextStyle(
          color: _isHovered ? AppColors.orangeContainerColor : AppColors.whiteTextColor,
          fontSize: 24,
          fontFamily: 'RobotoBold',
        ),
      ),
    );
  }
}