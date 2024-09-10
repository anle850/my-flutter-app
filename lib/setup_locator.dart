import 'package:example_flutter_app/services/my_service.dart';
import 'package:example_flutter_app/services/my_service2.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerFactory<MyService>(() => MyService());
  getIt.registerFactory<MyService2>(() => MyService2());
}
