import 'package:admin/utils/configs.dart';
import 'package:flutter/material.dart';

class MyImageView extends StatelessWidget {
  final String imageName;
  MyImageView({@required this.imageName});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Image.network('${Configs.apiBasePath}/containers/product/download/$imageName'),
    );
  }
}
