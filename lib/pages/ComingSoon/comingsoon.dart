import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Container(
                      height: 100,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'MS APP',
                              style: TextStyle(
                                  fontSize: 32,
                                  fontFamily: 'Goldman',
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.onSecondary),
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.home,
                                  color: Theme.of(context).colorScheme.onSecondary,
                                  size: 28,
                                ))
                          ],
                        ),
                      ),
                    ),
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  width: 300,
                  child: LottieBuilder.asset('assets/waving.json'),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.maxFinite,
                  height: 100,
                  child: AnimatedTextKit(
                    isRepeatingAnimation: true,
                    repeatForever: true,
                    animatedTexts: [
                    RotateAnimatedText('Currently I am not available',
                        textStyle: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontSize: 18,
                            fontFamily: 'Goldman',
                            fontWeight: FontWeight.bold)),
                    RotateAnimatedText('But, I will be coming soon',
                        textStyle: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontSize: 18,
                            fontFamily: 'Goldman',
                            fontWeight: FontWeight.bold)),
                    RotateAnimatedText('Stay tunned for updates',
                        textStyle: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontSize: 18,
                            fontFamily: 'Goldman',
                            fontWeight: FontWeight.bold))
                  ]),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
