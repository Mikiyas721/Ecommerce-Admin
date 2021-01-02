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
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(20))),
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 5,top: 5),
      child: Container(
        padding:EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            gradient:
                LinearGradient(colors: [Color(0xffa6a6a6), Color(0xff2f2f2f)])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return MyImageView(
                        imageName: user.imageName,
                        type: 'user',
                      );
                    }));
                  },
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                        '${Configs.apiBasePath}/containers/user/download/${user.imageName}'),
                  ),
                ),
                SizedBox(width: 20,),
                Text(
                  user.getUserName(),
                  style: TextStyle(fontSize: 24, color: Colors.white),
                )
              ],
            ),
            Divider(
              thickness: 1.2,
              color: Color(0xffffffcc),
            ),
            LabeledText(
              label: 'Phone Number',
              value: user.phoneNumber,
              labelColor: Colors.white,
            ),
            LabeledText(
              label: 'E-mail',
              value: user.email,
              labelColor: Colors.white,
            ),
            LabeledText(
              label: 'Password',
              value: user.password,
              labelColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
