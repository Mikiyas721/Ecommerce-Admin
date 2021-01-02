import 'package:admin/data/model/product.dart';
import 'package:admin/utils/configs.dart';
import 'package:dio/dio.dart';

class Http {
  Dio _dio = Dio(BaseOptions(
      receiveTimeout: 60000,
      connectTimeout: 60000,
      baseUrl: Configs.apiBasePath));

  Future<Response> getPendingProducts() async {
    Response response =
        await _dio.get('/products?filter[where][approved]=false');
    return response;
  }

  Future<Response> approveProduct(String myId) async {
    Product product = Product.fromJson(
        (await _dio.get('/products?filter[where][myId]=$myId')).data[0]);
    await _dio.delete('/products?filter[where][myId]=$myId');
    ///put not updating, used delete and add new instead
    return await _dio.put('/products',
        data: Product(
                id: product.id,
                myId: product.myId,
                name: product.name,
                imageName: product.imageName,
                description: product.description,
                price: product.price,
                quantity: product.quantity,
                postedTime: product.postedTime,
                swapOptions: product.swapOptions,
                phoneNumber: product.phoneNumber,
                swappable: product.swappable,
                condition: product.condition,
                category: product.category,
                approved: true)
            .toJSON());
  }
  Future<Response> declineProduct(String myId)async{
    return await _dio.delete('/products?filter[where][myId]=$myId');
  }
}
