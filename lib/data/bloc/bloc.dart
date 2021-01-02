import '../../data/model/product.dart';
import '../../utils/http.dart';
import '../../utils/disposable.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Disposable with Http {
  final _pendingProducts = GetIt.instance.get<BehaviorSubject>();

  Stream<List> get pendingProductsStream =>
      _pendingProducts.map((value) => value);
  Future<void> loadPendingProducts()async{
    _pendingProducts.add((await getPendingProducts()).data.map((map)=>Product.fromJson(map)).toList());
  }
  void onDecline(String myId)async{
    await declineProduct(myId);
    await loadPendingProducts();
  }
  void onApprove(String myId)async{
    await approveProduct(myId);
    await loadPendingProducts();
  }

  @override
  dispose() {
    _pendingProducts.close();
  }
}
