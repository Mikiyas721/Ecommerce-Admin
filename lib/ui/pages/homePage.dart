import '../../data/model/product.dart';
import '../../ui/pages/usersPage.dart';
import '../../data/bloc/bloc.dart';
import '../../data/bloc/blocProvider/provider.dart';
import '../../ui/customWidget/myExpandableTile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          blocFactory: () => Bloc(),
          builder: (BuildContext context, Bloc bloc) {
            bloc.loadPendingProducts();
            return NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      backgroundColor: Color(0xff1a1a1a),
                      flexibleSpace: FlexibleSpaceBar(
                        background: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/logo.jpg'),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    )
                  ];
                },
                body: StreamBuilder(
                    stream: null,
                    builder: (context, AsyncSnapshot<List> snapshot) {
                      return snapshot.data == null
                          ? Center(child: CircularProgressIndicator())
                          : snapshot.data.isEmpty
                              ? Center(
                                  child: Text('No Pending Products'),
                                )
                              : ListView.builder(itemBuilder:
                                  (BuildContext context, int index) {
                                  return MyExpandableTile(
                                      product: Product.fromJson(
                                          snapshot.data[index]));
                                });
                    }));
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.people, color: Colors.white),
        backgroundColor: Color(0xff11a1a1a),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return UsersPage();
          }));
        },
      ),
    );
  }
}
