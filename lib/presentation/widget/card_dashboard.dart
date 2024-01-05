import 'package:flutter/material.dart';

class CardDashboard extends StatelessWidget {
  final String title;
  final String bgImage;
  final VoidCallback ontap;
  final Color textColor;
  const CardDashboard(
      {super.key,
      required this.title,
      required this.bgImage,
      required this.ontap,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: Column(
          children: [
            Image.asset(bgImage, width: 90, height: 90),
            const SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: TextStyle(color: textColor),
            )
          ],
        ),
      ),
    );
  }
}
