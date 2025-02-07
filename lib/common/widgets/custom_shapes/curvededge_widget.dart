import 'package:flutter/material.dart';
import 'package:resellah_landing_new/common/widgets/custom_shapes/curved_edges.dart';

class CurvedWidget extends StatelessWidget {
  const CurvedWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurvedEdges(),
      child: child,
    );
  }
}
