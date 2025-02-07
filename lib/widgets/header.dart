import 'package:flutter/material.dart';
import 'package:resellah_landing_new/utils/constrants/colors.dart';
import 'package:resellah_landing_new/utils/constrants/sizes.dart';
import 'package:resellah_landing_new/utils/constrants/images_string.dart';
import 'package:resellah_landing_new/widgets/animated_background.dart';

class Header extends StatelessWidget {
  const Header({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.darkContainerColor.withOpacity(0.97),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Animated Background - now contained within header bounds
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: AnimatedBackground(),
          ),
          
          // Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Sell. Buy. Reuse. Own the future.',
                        style: TextStyle(
                          color: AppColors.whiteTextColor,
                          fontSize: 48,
                          fontFamily: 'Agbalumo',
                        ),
                      ),
                      const SizedBox(height: 20),

                      SizedBox(
                        width: 400,
                        child: TextField(
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
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.orangeContainerColor,
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(Sizes.buttonRadius),
                          ),
                        ),
                        child: const Text(
                          'Sign up for Beta test',
                          style: TextStyle(
                            color: AppColors.whiteTextColor,
                            fontSize: 18,
                            fontFamily: 'RobotoBold',
                          ),
                        ),

                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    AppImages.landingImage,
                    height: 400,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

