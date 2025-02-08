import 'package:flutter/material.dart';
import 'package:resellah_landing_new/utils/constrants/images_string.dart';
import 'package:resellah_landing_new/utils/constrants/colors.dart';
import 'package:resellah_landing_new/utils/responsive/responsive.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:resellah_landing_new/services/analytics_service.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.greenContainerColor,
      height: 100,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.isMobile(context) ? 20 : 50
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            width: Responsive.isMobile(context) ? 100 : 150,
            height: 100,
            child: Image.asset(AppImages.orangeLogo)
          ),

          if (!Responsive.isMobile(context))
            Row(
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                _NavBarItem(
                  'Partnership',
                  url: 'https://forms.gle/NVFUgN4DjdZBu2sq6',
                ),
                SizedBox(width: 20),
                _NavBarItem(
                  'For Investors',
                  url: 'https://docs.google.com/presentation/d/1Vpke9ZnXSX7i8zVEEhRFsn2oRASrViqPiECjiamdeSk/edit?usp=sharing',
                ),
                SizedBox(width: 20),
                _NavBarItem(
                  'Contacts',
                  url: 'https://www.linkedin.com/in/kerimov-artur/',
                ),
              ],
            )
          else
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.white, size: 30),
              onPressed: () {
                Scaffold.of(context).openEndDrawer(); // Open drawer from right side
              },
            ),
        ],
      ),
    );
  }
}

class _NavBarItem extends StatefulWidget {
  final String title;
  final String url;
  
  const _NavBarItem(this.title, {required this.url});

  @override
  State<_NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<_NavBarItem> {
  bool _isHovered = false;

  Future<void> _launchUrl() async {
    await AnalyticsService.logNavClick(widget.title);
    if (!await launchUrl(Uri.parse(widget.url))) {
      throw Exception('Could not launch ${widget.url}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: _launchUrl,
        child: Text(
          widget.title,
          style: TextStyle(
            color: _isHovered ? AppColors.orangeContainerColor : AppColors.whiteTextColor,
            fontSize: Responsive.isTablet(context) ? 18 : 24,
            fontFamily: 'RobotoBold',
          ),
        ),
      ),
    );
  }
}