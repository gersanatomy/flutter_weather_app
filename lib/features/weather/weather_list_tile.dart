import 'package:flutter/material.dart';

class WeatherListTile extends StatelessWidget {
  const WeatherListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xff7b98b7),
              Color(0xff7f94b7),
              Color(0xff9599be),
            ],
          ),
          borderRadius: BorderRadius.circular(50)),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Monday, Aug 24'),
            Container(
              height: 40,
              child: Image.asset('assets/cloudy.png'),
            ),
            Text('36°'),
            Text('24°'),
          ],
        ),
      ),
    );
  }
}
