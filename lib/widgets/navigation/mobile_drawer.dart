import 'package:flutter/material.dart';
import 'package:resellah_landing_new/utils/constrants/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:resellah_landing_new/services/analytics_service.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _handleNavClick(BuildContext context, String title, String url) async {
    Navigator.pop(context);
    await AnalyticsService.logNavClick(title);
    await _launchUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.darkContainerColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const SizedBox(height: 50),
          ListTile(
            title: const Text(
              'Partnership',
              style: TextStyle(
                color: AppColors.whiteTextColor,
                fontSize: 20,
                fontFamily: 'RobotoBold',
              ),
            ),
            onTap: () => _handleNavClick(context, 'Partnership', 'https://forms.gle/NVFUgN4DjdZBu2sq6'),
          ),
          ListTile(
            title: const Text(
              'For Investors',
              style: TextStyle(
                color: AppColors.whiteTextColor,
                fontSize: 20,
                fontFamily: 'RobotoBold',
              ),
            ),
            onTap: () => _handleNavClick(context, 'For Investors', 'https://docs.google.com/presentation/d/1Vpke9ZnXSX7i8zVEEhRFsn2oRASrViqPiECjiamdeSk/edit?usp=sharing'),
          ),
          ListTile(
            title: const Text(
              'Contacts',
              style: TextStyle(
                color: AppColors.whiteTextColor,
                fontSize: 20,
                fontFamily: 'RobotoBold',
              ),
            ),
            onTap: () => _handleNavClick(context, 'Contacts', 'https://www.linkedin.com/in/kerimov-artur/'),
          ),
        ],
      ),
    );
  }
} 