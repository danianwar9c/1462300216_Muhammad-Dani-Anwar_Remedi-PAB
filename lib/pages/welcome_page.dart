import 'package:flutter/material.dart';

import 'home_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const Text(
              'Welcome to SpaceNews Core Application',

              textAlign: TextAlign.center,

              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

            Image.network(
              'https://images.unsplash.com/photo-1495020689067-958852a7765e',

              height: 250,
            ),

            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,

                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },

              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
