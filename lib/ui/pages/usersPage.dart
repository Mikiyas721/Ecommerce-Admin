import 'package:admin/data/bloc/bloc.dart';
import 'package:admin/data/bloc/blocProvider/provider.dart';
import 'package:admin/data/model/user.dart';
import 'package:admin/ui/customWidget/userCard.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        blocFactory: () => Bloc(),
        builder: (BuildContext context, Bloc bloc) {
          bloc.loadUser();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xff1a1a1a),
              title: Text(
                'Users',
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                StreamBuilder(
                    stream: bloc.usersStream,
                    builder:
                        (BuildContext context, AsyncSnapshot<List> snapshot) {
                      return snapshot.data == null
                          ? CircularProgressIndicator()
                          : Text('${snapshot.data.length} Users');
                    })
              ],
            ),
            body: StreamBuilder(
                stream: bloc.usersStream,
                builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                  return snapshot.data == null
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return UserCard(
                                user: User.fromJson(snapshot.data[index]));
                          });
                }),
          );
        });
  }
}
