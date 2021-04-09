import 'package:flutter/material.dart';

class VideoDuration extends StatelessWidget {
  const VideoDuration({
    Key? key,
    required this.duration,
  }) : super(key: key);
  final String duration;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      height: 20.0,
      child: Text(this.duration),
      margin: const EdgeInsets.only(bottom: 8.0, right: 3),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
