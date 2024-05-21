import 'package:flutter/material.dart';
import 'package:tasty_dinery/common/widgets/custom_shapes/curved_edges/curved_edges.dart';

class CcCurvedEdgeWidget extends StatelessWidget {
  const CcCurvedEdgeWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CcCustomCurvedEdges(),
      child: child,
    );
  }
}
