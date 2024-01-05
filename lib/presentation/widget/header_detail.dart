import 'package:flutter/material.dart';

class HeaderDashboard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String img;
  const HeaderDashboard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.img});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: const EdgeInsets.only(top: 90),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: title.contains('Shalat')
                  ? const Color(0xff3CA1A2)
                  : const Color(0xffB1D9DA),
            ),
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Container(
              margin: const EdgeInsets.only(top: 120, left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 300,
            height: 200,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                image:
                    DecorationImage(image: AssetImage(img), fit: BoxFit.fill)),
          ),
        )
      ],
    );
  }
}
