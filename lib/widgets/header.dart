import 'package:flutter/material.dart';
import 'package:resellah_landing_new/utils/constrants/colors.dart';
import 'package:resellah_landing_new/utils/constrants/sizes.dart';
import 'package:resellah_landing_new/utils/constrants/images_string.dart';
import 'package:resellah_landing_new/widgets/animated_background.dart';
import 'package:resellah_landing_new/utils/responsive/responsive.dart';
import 'package:http/http.dart' as http;
import 'package:resellah_landing_new/utils/config/app_config.dart';
import 'package:resellah_landing_new/services/analytics_service.dart';

class Header extends StatefulWidget {
  const Header({required Key key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;
  final String _sheetUrl = AppConfig.googleSheetUrl;
  
  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  Future<void> _submitEmail() async {
    final email = _emailController.text.trim();
    
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your email'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (!_isValidEmail(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid email'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    
    setState(() => _isLoading = true);
    
    try {
      final response = await http.post(
        Uri.parse(_sheetUrl),
        body: {
          'email': email,
        },
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to submit');
      }
      
      await AnalyticsService.logEmailSubmission();
      _emailController.clear();
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Thank you for signing up!'),
            backgroundColor: AppColors.orangeContainerColor,
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to submit email. Please try again.'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Responsive.height(context) - 100,
      width: double.infinity,
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: AppColors.darkContainerColor.withOpacity(0.97),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Stack(
        children: [
          const Positioned.fill(child: AnimatedBackground()),
          
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.isMobile(context) ? 20 : 50
            ),
            child: Responsive.isMobile(context) 
                ? _buildMobileLayout(context)
                : _buildDesktopLayout(context),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: _buildContent(context),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/placeholder.png',
              image: AppImages.landingImage,
              height: Responsive.height(context) * (Responsive.isTablet(context) ? 0.5 : 0.6),
              fit: BoxFit.contain,
              imageErrorBuilder: (context, error, stackTrace) {
                print('Error loading image: $error');
                return const Center(
                  child: Icon(Icons.error_outline, color: Colors.red, size: 40),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildContent(context),
        const SizedBox(height: 40),
        FadeInImage.assetNetwork(
          placeholder: 'assets/images/placeholder.png',
          image: AppImages.landingImage,
          height: Responsive.height(context) * 0.3,
          fit: BoxFit.contain,
          imageErrorBuilder: (context, error, stackTrace) {
            print('Error loading image: $error');
            return const Center(
              child: Icon(Icons.error_outline, color: Colors.red, size: 40),
            );
          },
        ),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sell. Buy. Reuse. Own the future.',
          style: TextStyle(
            color: AppColors.whiteTextColor,
            fontSize: Responsive.isMobile(context) ? 32 : 48,
            fontFamily: 'Agbalumo',
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: Responsive.isMobile(context) ? double.infinity : 400,
          child: TextField(
            controller: _emailController,
            decoration: InputDecoration(
              hintText: 'Enter your email',
              hintStyle: const TextStyle(color: Colors.grey),
              filled: true,
              fillColor: AppColors.whiteContainerColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Sizes.buttonRadius),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _isLoading ? null : _submitEmail,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.orangeContainerColor,
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.isMobile(context) ? 20 : 40,
              vertical: Responsive.isMobile(context) ? 15 : 20,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Sizes.buttonRadius),
            ),
          ),
          child: _isLoading 
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Text(
                'Sign up for Beta test',
                style: TextStyle(
                  color: AppColors.whiteTextColor,
                  fontSize: Responsive.isMobile(context) ? 16 : 18,
                  fontFamily: 'RobotoBold',
                ),
              ),
        ),
      ],
    );
  }
}

