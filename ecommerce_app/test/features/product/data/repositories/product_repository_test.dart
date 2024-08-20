import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/exceptions.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/product/data/models/product_model.dart';
import 'package:ecommerce_app/features/product/data/repositories/product_repository.dart';
import 'package:ecommerce_app/features/product/domain/entities/product.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import './helper/test_helper.mocks.dart';

void main() {
  late ProductRepositoryImpl productRepositoryImpl;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;
  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    productRepositoryImpl = ProductRepositoryImpl(
      localDataSource: mockLocalDataSource,
      remoteDataSource: mockRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  const testId = '01';

  final testProductModel = ProductModel(
      id: '11',
      name: 'name',
      description: 'description',
      price: 100,
      url: 'url');

  final Product testProductEntity = testProductModel;


  void runTestsOnline(Function body) {
    group('\ndevice is online\n', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer(
          (_) async => true,
        );
      });
      body();
    });
  }

  void runTestsOffline(Function body) {
    group('\ndevice is offline\n', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer(
          (_) async => false,
        );
      });
      body();
    });
  }

  runTestsOnline(() {
    group('\ncalls to the viewAllProducts functions\n', () {
      test(
        '\nshould cache the data locally when the call to remote data soucre is successfull\n',
        () async {
          //arrange
          when(mockRemoteDataSource.viewAllProducts()).thenAnswer((_) async {
            return [testProductModel];
          });
          //act
          await productRepositoryImpl.viewAllProducts();
          //assert
          verify(mockRemoteDataSource.viewAllProducts());
          verify(mockLocalDataSource.cacheProducts([testProductModel]));
        },
      );
      test(
          '\nshould return server Failure when the call to remote data source is unsuccessful\n',
          () async {
        //arrange
        when(mockRemoteDataSource.viewAllProducts())
            .thenThrow(ServerException());
        final result = await productRepositoryImpl.viewAllProducts();
        //assert
        verify(mockRemoteDataSource.viewAllProducts());
        verifyZeroInteractions(mockLocalDataSource);
        expect(result, equals(const Left(ServerFailure(''))));
      });
    });

    group('\nGet specific products\n', () {
      test(
        '\nshould return remote repository when the device is online\n',
        () async {
          //arrange
          when(mockRemoteDataSource.viewSpecificProduct('11'))
              .thenAnswer((_) async {
            return testProductModel;
          });
          //act
          final result =
              await productRepositoryImpl.viewSpecificProduct(testId);
          //assert
          verify(mockRemoteDataSource.viewSpecificProduct(testId));
          expect(result, Right(testProductEntity));
        },
      );

      test(
        '\nshould throw a server Failure it is offline',
        () async {
          //arrange
          when(mockRemoteDataSource.viewSpecificProduct('11'))
              .thenThrow(ServerException());
          //act
          final result =
              await productRepositoryImpl.viewSpecificProduct(testId);
          //assert
          verify(mockRemoteDataSource.viewSpecificProduct(testId));
          expect(result, const Left(ServerFailure('')));
        },
      );
    });

    group('\n Update Product\n', () {
      test(
        '\nshould return remote repository when the device is online\n',
        () async {
          //arrange
          when(mockRemoteDataSource.updateProduct(testProductModel))
              .thenAnswer((_) async {
            return testProductModel;
          });
          //act
          final result =
              await productRepositoryImpl.updateProduct(testProductEntity);
          //assert
          verify(mockRemoteDataSource.updateProduct(testProductModel));
          expect(result, Right(testProductEntity));
        },
      );

      test(
        '\nshould throw a server Failure it is offline',
        () async {
          //arrange
          when(mockRemoteDataSource.updateProduct(testProductModel))
              .thenThrow(ServerException());
          //act
          final result =
              await productRepositoryImpl.updateProduct(testProductEntity);
          //assert
          verify(mockRemoteDataSource.updateProduct(testProductModel));
          expect(result, const Left(ServerFailure('')));
        },
      );
    });

    //act

    group(
      '\n Delete Product\n',
      () {
        test(
          '/n should return unit upon successful deletion',
          () async {
            //arrange
            when(mockRemoteDataSource.deleteProduct(testId))
                .thenAnswer((_) async {
              return unit;
            });

            //act
            final result = await productRepositoryImpl.deleteProduct(testId);

            verify(mockRemoteDataSource.deleteProduct(testId));
            expect(result, const Right(unit));
            //assert
          },
        );

        test(
          '/n should return Server failure upon ServerError',
          () async {
            //arrange
            when(mockRemoteDataSource.deleteProduct(testId))
                .thenThrow(ServerException());

            //act
            final result = await productRepositoryImpl.deleteProduct(testId);

            verify(mockRemoteDataSource.deleteProduct(testId));
            expect(result, const Left(ServerFailure('')));
            //assert
          },
        );
      },
    );

    group(
      '\n Add Product\n',
      () {
        test(
          '\n should return a product entitty upon creating a new model',
          () async {
            //arrange
            when(mockRemoteDataSource.addProduct(testProductModel))
                .thenAnswer((_) async {
              return testProductModel;
            });

            //act
            final result =
                await productRepositoryImpl.addProduct(testProductEntity);

            //assert
            verify(mockRemoteDataSource.addProduct(testProductModel));
            expect(result, Right(testProductEntity));
          },
        );

        test(
          '\n should return a server Error when server throws an exception',
          () async {
            //arrange
            when(mockRemoteDataSource.addProduct(testProductModel))
                .thenThrow(ServerException());

            //act
            final result =
                await productRepositoryImpl.addProduct(testProductEntity);

            //assert
            verify(mockRemoteDataSource.addProduct(testProductModel));
            expect(result, const Left(ServerFailure('')));
          },
        );
      },
    );
  });

  runTestsOffline(() {
    group(
      'Get All products\n',
      () {
        test(
          'should return last locally cached data when the chached data is present\n',
          () async {
            //arrange
            when(mockLocalDataSource.getLastProduct()).thenAnswer(
              (_) async => testProductModel,
            );
            //act
            final result = await productRepositoryImpl.viewAllProducts();
            final resultUnfold = result.fold((l) {
              return null;
            }, (p) {
              return p;
            });

            //assert
            verifyZeroInteractions(mockRemoteDataSource);
            verify(mockLocalDataSource.getLastProduct());
            expect(resultUnfold, containsAll([testProductEntity]));
          },
        );

    
        test(
          'should return a CacheFailure when there is no cached data present\n',
          () async {
            //arrange
            when(mockLocalDataSource.getLastProduct())
                .thenThrow(CacheException());
            //act
            final result = await productRepositoryImpl.viewAllProducts();

            verifyZeroInteractions(mockRemoteDataSource);
            verify(mockLocalDataSource.getLastProduct());
            //assert
          },
        );
      },
    );

    group(
      '\n Get Specific Product offline\n',
      () {
        test(
          '\n should return a specifc product from the chache',
          () async {
            //arrange
            when(mockLocalDataSource.getLastProduct())
                .thenAnswer((_) async {
              return testProductModel;
            });

            final result =
                await productRepositoryImpl.viewSpecificProduct(testId);

            verifyZeroInteractions(mockRemoteDataSource);
            verify(mockLocalDataSource.getLastProduct());
            expect(result, Right(testProductEntity));
            //act
            //assert
          },
        );
        test(
          '\n should return cache failure if no product has been cached',
          () async {
            //arrange
            when(mockLocalDataSource.getLastProduct())
                .thenThrow(CacheException());

            final result =
                await productRepositoryImpl.viewSpecificProduct(testId);

            verifyZeroInteractions(mockRemoteDataSource);
            verify(mockLocalDataSource.getLastProduct());
            expect(result, const Left(CacheFailure('')));
            //act
            //assert
          },
        );
      },
    );

    group(
      '\n Add Product offline\n ',
      () {
        test(
          '\n should return a network failure',
          () async {
            final result =
                await productRepositoryImpl.addProduct(testProductEntity);
            verifyZeroInteractions(mockLocalDataSource);
            verifyZeroInteractions(mockRemoteDataSource);
            expect(result, const Left(NetworkFailure('')));
          },
        );
      },
    );

    group(
      '\n Delete Product offline\n ',
      () {
        test(
          '\n should return a network failure',
          () async {
            final result = await productRepositoryImpl.deleteProduct(testId);
            verifyZeroInteractions(mockLocalDataSource);
            verifyZeroInteractions(mockRemoteDataSource);
            expect(result, const Left(NetworkFailure('')));
          },
        );
      },
    );

    group(
      '\n Update Product offline\n ',
      () {
        test(
          '\n should return a network failure',
          () async {
            final result =
                await productRepositoryImpl.updateProduct(testProductEntity);
            verifyZeroInteractions(mockLocalDataSource);
            verifyZeroInteractions(mockRemoteDataSource);
            expect(result, const Left(NetworkFailure('')));
          },
        );
      },
    );
  });
}

// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';

// import 'package:ecommerce_app/features/product/data/models/product_model.dart';
// import 'package:ecommerce_app/features/product/data/repositories/product_repository.dart';
// import 'package:ecommerce_app/features/product/domain/entities/product.dart';

// import 'helper/test_helper.mocks.dart';

// void main() {
//   late ProductRepositoryImpl productRepositoryImpl;
//   late MockRemoteDataSource mockRemoteDataSource;
//   late MockLocalDataSource mockLocalDataSource;
//   late MockNetworkInfo mockNetworkInfo;
//   setUp(() {
//     mockRemoteDataSource = MockRemoteDataSource();
//     mockLocalDataSource = MockLocalDataSource();
//     mockNetworkInfo = MockNetworkInfo();
//     productRepositoryImpl = ProductRepositoryImpl(
//       remoteDataSource: mockRemoteDataSource,
//       localDataSource: mockLocalDataSource,
//       networkInfo: mockNetworkInfo,
//     );
//   });

//   group(
//     'viewProduct',
//     () {
//       const tid = '11';
//       final tProductModel = ProductModel(
//           id: tid,
//           name: 'name',
//           description: 'description',
//           price: 100,
//           url: 'url');
//       final Product tProduct = tProductModel;

//       test(
//         'should check the device is online',
//         () async {
//           // arrange
//           when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
//           //act
//           productRepositoryImpl.viewSpecificProduct('11');
//           //assert
//           verify(mockNetworkInfo.isConnected);
//         },
//       );


//       group(
//         'device is online',
//         () {
//           setUp(
//             () {
//               when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
//             },
//           );

//           test(
//             'should return remote data when the call to remote data source id successful',
//             () async {
//               when(productRepositoryImpl.viewSpecificProduct(tid)).thenAnswer(
//                 (_) async {
//                   return Right(tProduct);
//                 },
//               );

//               final result =
//                   await productRepositoryImpl.viewSpecificProduct(tid);

//               verify(productRepositoryImpl..viewSpecificProduct(tid));
//               expect(result, equals(Right(tProduct)));
//             },
//           );
//         },
//       );
//       group(
//         'device is offline',
//         () {
//           setUp(
//             () {
//               when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
//             },
//           );
//         },
//       );
//     }, 
//   ); // group
// } //main
