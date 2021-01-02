import 'package:flutter/material.dart';

class LabeledText extends StatelessWidget {
  final String label;
  final String value;

  LabeledText({@required this.label, @required this.value});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: '$label : ',
          style: TextStyle(
            color: Colors.black45,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          )),
      TextSpan(text: value)
    ]));
  }
}
