import '../../utils/configs.dart';
import 'package:flutter/material.dart';

class MyImageView extends StatelessWidget {
  final String imageName;
  final String type;

  MyImageView({@required this.imageName, @required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.network(
            '${Configs.apiBasePath}/containers/$type/download/$imageName'),
      ),
    );
  }
}
