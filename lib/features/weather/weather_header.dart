import 'package:flutter/material.dart';

class WeatherHeader extends StatelessWidget {
  const WeatherHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      color: const Color(0xfff2f8f9),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 120,
            child: Image.asset('assets/cloudy.png'),
          ),
          Container(
            child: const Column(
              children: [
                Text(
                  '36°',
                  style: TextStyle(fontSize: 40),
                ),
                Text('Partly Cloudy')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
