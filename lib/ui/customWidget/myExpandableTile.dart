import '../../data/bloc/bloc.dart';
import '../../data/bloc/blocProvider/provider.dart';
import '../../ui/customWidget/myImageView.dart';
import '../../ui/customWidget/labeledText.dart';
import '../../utils/configs.dart';
import '../../data/model/product.dart';
import '../../utils/enums/productCategory.dart';
import '../../utils/enums/condition.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyExpandableTile extends StatelessWidget {
  final Product product;

  MyExpandableTile({@required this.product});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<Bloc>(context);
    return ExpansionTile(
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      leading: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return MyImageView(
              imageName: product.imageName,
              type: 'product',
            );
          }));
        },
        child: CircleAvatar(
          backgroundImage: NetworkImage(
              '${Configs.apiBasePath}/containers/product/download/${product.imageName}'),
        ),
      ),
      title: Text(product.name),
      subtitle: Text(
        DateFormat('dd/MM/yyyy').format(product.postedTime),
        style: TextStyle(fontStyle: FontStyle.italic),
      ),
      children: [
        LabeledText(label: 'Phone number', value: product.phoneNumber),
        LabeledText(label: 'Price', value: product.price.toString()),
        LabeledText(label: 'Quantity', value: product.quantity.toString()),
        LabeledText(label: 'Category', value: product.category.getString()),
        LabeledText(label: 'Condition', value: product.condition.getString()),
        LabeledText(label: 'Swappable', value: product.getSwappableString()),
        LabeledText(label: 'Description', value: product.getSwappableString()),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RaisedButton(
              onPressed: () {
                bloc.approveProduct(product.myId);
              },
              child: Text('Approve', style: TextStyle(color: Colors.white)),
              color: Colors.green.shade400,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            RaisedButton(
              onPressed: () {
                bloc.declineProduct(product.myId);
              },
              child: Text('Decline', style: TextStyle(color: Colors.white)),
              color: Colors.red.shade400,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          ],
        )
      ],
    );
  }
}
