import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class AboutSlide extends FlutterDeckSlideWidget {
  const AboutSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            title: 'About',
            route: '/about',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.custom(
      builder: (context) => Padding(
        padding: const EdgeInsets.all(128),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('About me', style: Theme.of(context).textTheme.displayLarge),
            const SizedBox(height: 32),
            Row(
              children: [
                const CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('assets/profile.jpeg'),
                ),
                const SizedBox(width: 32),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Dario Digregorio',
                        style: Theme.of(context).textTheme.displayMedium),
                    const SizedBox(height: 8),
                    Text(
                        'Senior Software Engineer Flutter & Web @NTT Data Germany',
                        style: Theme.of(context).textTheme.headlineLarge),
                    Text('Indie Developer and Freelancer',
                        style: Theme.of(context).textTheme.headlineLarge),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 64),
            Text('• From Germany with italian roots',
                style: Theme.of(context).textTheme.headlineMedium),
            Text('• Love creating intuitiv, adaptable and responsive apps',
                style: Theme.of(context).textTheme.headlineMedium),
            Text('• Released my first indie app "Yawa" in 2023 🎉',
                style: Theme.of(context).textTheme.headlineMedium)
          ],
        ),
      ),
    );
  }
}
