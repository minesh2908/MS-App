import 'package:flutter/material.dart';

class SkillContainerNew extends StatelessWidget {
  const SkillContainerNew({required this.title, super.key});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5, bottom: 5),
      child: Chip(
        side: const BorderSide(width: 2),
        label: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}

class DetailPoint extends StatelessWidget {
  const DetailPoint({
    required this.pointDescription,
    required this.pointNumber,
    super.key,
  });

  final String pointNumber;
  final String pointDescription;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              pointNumber,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'NanumMyeongjo',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            flex: 18,
            child: Text(
              pointDescription,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'NanumMyeongjo',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
