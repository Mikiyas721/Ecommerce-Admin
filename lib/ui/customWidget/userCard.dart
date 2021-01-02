import '../../data/model/user.dart';
import '../../ui/customWidget/labeledText.dart';
import '../../utils/configs.dart';
import 'package:flutter/material.dart';

import 'myImageView.dart';

class UserCard extends StatelessWidget {
  final User user;

  UserCard({@required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Padding(
        padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return MyImageView(imageName: user.imageName);
                    }));
                  },
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        '${Configs.apiBasePath}/containers/product/download/${user.imageName}'),
                  ),
                ),
                Text(
                  user.getUserName(),
                  style: TextStyle(fontSize: 24),
                )
              ],
            ),
            Divider(),
            LabeledText(label: 'Phone Number', value: user.phoneNumber),
            LabeledText(label: 'E-mail', value: user.email),
            LabeledText(label: 'Password', value: user.password),
          ],
        ),
      ),
    );
  }
}
