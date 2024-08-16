import 'package:ecommerce_app/core/platform/network_info.dart';
import 'package:ecommerce_app/features/product/data/datasources/product_local_data_source.dart';
import 'package:ecommerce_app/features/product/data/datasources/product_remote_data_source.dart';
import 'package:ecommerce_app/features/product/domain/repositories/product_repository.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks(
  [
    ProductRepository,
    NetworkInfo,
    LocalDataSource,
    RemoteDataSource,
  ],
  // customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}