import 'package:flutter/material.dart';
import 'package:resellah_landing_new/utils/constrants/colors.dart';
import 'package:resellah_landing_new/common/widgets/custom_shapes/circular_container.dart';
import 'package:resellah_landing_new/common/widgets/custom_shapes/curvededge_widget.dart';
import 'package:resellah_landing_new/utils/helpers/helper_function.dart';

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CurvedWidget(
      child: Container(
        color: AppColors.greenContainerColor,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          width: HelperFunction.screenWidth(),
          height: HelperFunction.screenHeight() * 0.4,
          child: Stack(
            children: [
              Positioned(
                top: -100,
                left: 0,
                right: -150,
                bottom: 0,
                // ignore: deprecated_member_use
                child: CircularContainer(backgroundColor: AppColors.whiteContainerColor.withOpacity(0.1)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}