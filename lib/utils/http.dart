import '../data/model/product.dart';
import '../utils/configs.dart';
import 'package:dio/dio.dart';

class Http {
  Dio _dio = Dio(BaseOptions(
      receiveTimeout: 60000,
      connectTimeout: 60000,
      baseUrl: Configs.apiBasePath));

  Future<Response> getAllUsers()async{
    Response response =
    await _dio.get('/users');
    return response;
  }
  Future<Response> getPendingProducts() async {
    Response response =
        await _dio.get('/products?filter[where][approved]=false');
    return response;
  }

  Future<Response> approveProduct(String myId,String id) async {
    Product product = Product.fromJson(
        (await _dio.get('/products?filter[where][myId]=$myId')).data[0]);
    await declineProduct(id);
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
  Future<Response> declineProduct(String id)async{
    return await _dio.delete('/products/$id');
  }
}
