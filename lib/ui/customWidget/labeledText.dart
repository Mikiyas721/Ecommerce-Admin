import 'package:flutter/material.dart';

class LabeledText extends StatelessWidget {
  final String label;
  final String value;
  final Color labelColor;

  LabeledText(
      {@required this.label,
      @required this.value,
      this.labelColor = Colors.black45});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: '$label : ',
          style: TextStyle(
            color: labelColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          )),
      TextSpan(
          text: value,
          style: TextStyle(
            fontSize: 16,
          ))
    ]));
  }
}
