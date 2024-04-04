import 'package:flutter/material.dart';

class SkillContainerNew extends StatelessWidget {
  const SkillContainerNew({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: EdgeInsets.only(right: 5, bottom: 5),
      child: Chip(
        side: BorderSide(width: 2),
        label: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}

class DetailPoint extends StatelessWidget {
  const DetailPoint(
      {super.key, required this.pointDescription, required this.pointNumber});

  final String pointNumber;
  final String pointDescription;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: Text(
                pointNumber,
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'NanumMyeongjo',
                    fontWeight: FontWeight.w600),
              )),
          Expanded(
            flex: 18,
            child: Text(
              pointDescription,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'NanumMyeongjo',
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
