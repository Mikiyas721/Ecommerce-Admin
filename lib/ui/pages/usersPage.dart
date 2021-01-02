import '../../data/bloc/bloc.dart';
import '../../data/bloc/blocProvider/provider.dart';
import '../../data/model/user.dart';
import '../../ui/customWidget/userCard.dart';
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
              backgroundColor: Color(0xffa6a6a6),
              title: Text(
                'Users',
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 20, top: 20),
                  child: StreamBuilder(
                      stream: bloc.usersStream,
                      builder:
                          (BuildContext context, AsyncSnapshot<List> snapshot) {
                        return snapshot.data == null
                            ? Text('')
                            : Text('${snapshot.data.length} Users');
                      }),
                )
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
                            return UserCard(user: snapshot.data[index]);
                          });
                }),
          );
        });
  }
}
