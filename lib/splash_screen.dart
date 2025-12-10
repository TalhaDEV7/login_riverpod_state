import 'package:flutter/material.dart';
import 'package:login_post_api/login_view.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    // Navigate after 3 seconds
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,

      body: Stack(
        children: [

          /// 🔹 Waves animation
          WaveWidget(
            config: CustomConfig(
              gradients: [
                [Colors.blue.shade800, Colors.blue.shade600],
                [Colors.blue.shade700, Colors.blue.shade300],
                [Colors.blue.shade600, Colors.blue.shade200],
              ],
              durations: [35000, 19440, 10800],
              heightPercentages: [0.20, 0.23, 0.26],
              gradientBegin: Alignment.bottomLeft,
              gradientEnd: Alignment.topRight,
            ),
            size: const Size(double.infinity, double.infinity),
            waveAmplitude: 10,
          ),

          /// 🔹 App logo & text
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [

                Icon(
                  Icons.water_drop,
                  size: 110,
                  color: Colors.white,
                ),

                SizedBox(height: 18),

                Text(
                  "Wave App",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),

                SizedBox(height: 6),

                Text(
                  "Loading...",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}
