import 'package:flutter/material.dart';

class SubHeading extends StatelessWidget {
  const SubHeading({
    required this.subHeading,
    super.key,
  });
  final String subHeading;
  @override
  Widget build(BuildContext context) {
    return Text(
      subHeading,
      style: const TextStyle(
        fontSize: 18,
        fontFamily: 'NanumMyeongjo',
      ),
    );
  }
}

class Heading extends StatelessWidget {
  const Heading({
    required this.title,
    super.key,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 22,
        fontFamily: 'NanumMyeongjo',
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
