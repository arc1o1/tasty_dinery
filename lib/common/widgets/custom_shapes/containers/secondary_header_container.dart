import 'package:flutter/material.dart';
import 'package:tasty_dinery/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:tasty_dinery/common/widgets/custom_shapes/curved_edges/curved_edge_widget.dart';
import 'package:tasty_dinery/utils/constants/colors.dart';
import 'package:tasty_dinery/utils/helpers/helper_functions.dart';

class CcSecondaryHeaderContainer extends StatelessWidget {
  const CcSecondaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;
  // final double height;

  @override
  Widget build(BuildContext context) {
    final dark = CcHelperFunctions.isDarkMode(context);

    return CcCurvedEdgeWidget(
      child: Container(
        color: Colors.blue.shade700,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: CcCircularContainer(
                  backgroundColor: dark
                      ? CcColors.textWhite.withOpacity(0.2)
                      : CcColors.textWhite.withOpacity(0.1)),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: CcCircularContainer(
                  backgroundColor: dark
                      ? CcColors.textWhite.withOpacity(0.2)
                      : CcColors.textWhite.withOpacity(0.1)),
            ),
            child
          ],
        ),
      ),
    );
  }
}
