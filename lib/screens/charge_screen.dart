import 'package:flutter/material.dart';

class ChargeScreen extends StatelessWidget {
  const ChargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: const Color.fromRGBO(193, 233, 125, 1),
        ),
        const Center(
          child: Image(
            image: AssetImage('assets/img/elipg.png'),
          ),
        ),
        const Center(
          child: Image(
            fit: BoxFit.cover,
            image: AssetImage('assets/img/elip.png'),
          ),
        ),
        const Center(
          child: Image(
            image: AssetImage('assets/img/log.png'),
          ),
        ),
      ],
    ));
  }
}
