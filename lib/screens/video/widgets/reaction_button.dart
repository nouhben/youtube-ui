import 'package:flutter/material.dart';

class ReactionButton extends StatelessWidget {
  const ReactionButton({
    Key? key,
    required this.icon,
    required this.onPress,
    required this.label,
  }) : super(key: key);

  final IconData icon;
  final GestureTapCallback onPress;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: this.onPress,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        textStyle: MaterialStateProperty.all(
          TextStyle(color: Colors.white),
        ),
        overlayColor: MaterialStateProperty.all(
          Colors.deepPurpleAccent.withOpacity(0.11),
        ),
        foregroundColor: MaterialStateProperty.all(Colors.white),
      ),
      child: Column(
        children: [
          Icon(this.icon),
          const SizedBox(height: 5.0),
          Text(this.label),
        ],
      ),
    );
  }
}
