import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

void register() {
  GetIt.instance
      .registerLazySingleton(() => BehaviorSubject(), instanceName: 'Products');
  GetIt.instance
      .registerLazySingleton(() => BehaviorSubject(), instanceName: 'Users');
}
