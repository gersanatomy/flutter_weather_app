import 'package:flutter/material.dart';
import 'package:flutter_weather_app/components/image_asset.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 300,
          child: Column(
            children: [
              const ImageAsset(
                key: Key('splash'),
                url: 'assets/weather.png',
              ),
              const Text(
                'Weather',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
              ),
              const Text(
                'Forecast',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: const CircularProgressIndicator(
                  color: Color(0xff7f94b7),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
