import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tasty_dinery/common/widgets/appbar/appbar.dart';

class FullScreenQRCode extends StatelessWidget {
  const FullScreenQRCode({super.key, required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CcAppBar(
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // sizedbox
            const SizedBox(height: 100),

            Container(
              padding: const EdgeInsets.only(bottom: 5),
              color: Colors.transparent,
              height: 500,
              child: QrImageView(
                data: data,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
