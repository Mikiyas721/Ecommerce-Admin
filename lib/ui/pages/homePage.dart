import '../../data/model/product.dart';
import '../../ui/pages/usersPage.dart';
import '../../data/bloc/bloc.dart';
import '../../data/bloc/blocProvider/provider.dart';
import '../../ui/customWidget/myExpandableTile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>_HomePageState();

}
class _HomePageState extends State<HomePage> {
  ScrollController controller = ScrollController();
  @override
  void initState() {
    controller.addListener(() {

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          blocFactory: () => Bloc(),
          builder: (BuildContext context, Bloc bloc) {
            bloc.loadPendingProducts();
            return NestedScrollView(
              controller: controller,
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      pinned: true,
                      title: innerBoxIsScrolled?Text('Pending Products'):null,
                      expandedHeight: MediaQuery.of(context).size.height * 0.35,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                      backgroundColor: Color(0xffa6a6a6),
                      flexibleSpace: FlexibleSpaceBar(
                        background: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30)),
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
        backgroundColor: Color(0xffa6a6a6),
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
