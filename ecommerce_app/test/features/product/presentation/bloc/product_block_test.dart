import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/util/input_converter.dart';
import 'package:ecommerce_app/features/product/domain/entities/product.dart';
import 'package:ecommerce_app/features/product/domain/usecases/add_a_product.dart';
import 'package:ecommerce_app/features/product/domain/usecases/delete_a_product.dart';
import 'package:ecommerce_app/features/product/domain/usecases/update_a_product.dart';
import 'package:ecommerce_app/features/product/domain/usecases/view_all_products.dart';
import 'package:ecommerce_app/features/product/domain/usecases/view_specific_product.dart';
import 'package:ecommerce_app/features/product/presentation/bloc/product_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAddProduct extends Mock implements AddProduct {}

class MockViewAllProducts extends Mock implements ViewAllProducts {}

class MockViewSpecificProduct extends Mock implements ViewSpecificProduct {}

class MockUpdateProduct extends Mock implements UpdateProduct {}

class MockDeleteProduct extends Mock implements DeleteProduct {}

class MockInputConverter extends Mock implements InputConverter {}

void main() {
  late ProductBloc productBloc;
  late MockAddProduct mockAddProduct;
  late MockViewAllProducts mockViewAllProducts;
  late MockViewSpecificProduct mockViewSpecificProduct;
  late MockUpdateProduct mockUpdateProduct;
  late MockDeleteProduct mockDeleteProduct;
  late MockInputConverter mockInputConverter;

  setUp(() {
    mockAddProduct = MockAddProduct();
    mockViewAllProducts = MockViewAllProducts();
    mockViewSpecificProduct = MockViewSpecificProduct();
    mockUpdateProduct = MockUpdateProduct();
    mockDeleteProduct = MockDeleteProduct();
    mockInputConverter = MockInputConverter();

    productBloc = ProductBloc(
      addProductUseCase: mockAddProduct,
      getAllProductsUseCase: mockViewAllProducts,
      getSpecificProductUseCase: mockViewSpecificProduct,
      updateProductUseCase: mockUpdateProduct,
      deleteProductUseCase: mockDeleteProduct,
      inputConverter: mockInputConverter,
    );
  });

  final product = Product(
    id: '02',
    name: 'name',
    description: 'description',
    price: 120,
    url: 'url',
  );

  test('initial state should be ProductInitialState', () {
    expect(productBloc.state, equals(ProductInitialState()));
  });

  blocTest<ProductBloc, ProductState>(
    'should emit [SpecificProductLoadingState, LoadedSpecificProductState] when adding a product is successful',
    build: () {
      when(mockAddProduct.execute(product: product))
          .thenAnswer((_) async => Right(product));
      return productBloc;
    },
    act: (bloc) => bloc.add(AddProductEvent(product: product)),
    expect: () => [
      SpecificProductLoadingState(),
      LoadedSpecificProductState(product),
    ],
    verify: (_) {
      verify(mockAddProduct.execute(product: product));
    },
  );

  blocTest<ProductBloc, ProductState>(
    'should emit [AllProductsLoadingState, LoadedAllProductsState] when loading all products is successful',
    build: () {
      when(mockViewAllProducts.execute())
          .thenAnswer((_) async => Right([product]));
      return productBloc;
    },
    act: (bloc) => bloc.add(const LoadAllProductsEvent()),
    expect: () => [
      AllProductsLoadingState(),
      LoadedAllProductsState([product]),
    ],
    verify: (_) {
      verify(mockViewAllProducts.execute());
    },
  );

  blocTest<ProductBloc, ProductState>(
    'should emit [SpecificProductLoadingState, LoadedSpecificProductState] when getting a specific product is successful',
    build: () {
      when(mockViewSpecificProduct.execute(id: '02'))
          .thenAnswer((_) async => Right(product));
      return productBloc;
    },
    act: (bloc) => bloc.add(const GetSpecificProductEvent(id: '02')),
    expect: () => [
      SpecificProductLoadingState(),
      LoadedSpecificProductState(product),
    ],
    verify: (_) {
      verify(mockViewSpecificProduct.execute(id: '02'));
    },
  );

  blocTest<ProductBloc, ProductState>(
    'should emit [SpecificProductLoadingState, SucessState, LoadedSpecificProductState] when updating a product is successful',
    build: () {
      when(mockUpdateProduct.execute(product: product))
          .thenAnswer((_) async => Right(product));
      return productBloc;
    },
    act: (bloc) => bloc.add(UpdateProductEvent(product: product)),
    expect: () => [
      SpecificProductLoadingState(),
      const SucessState('Successfully Updated product.'),
      LoadedSpecificProductState(product),
    ],
    verify: (_) {
      verify(mockUpdateProduct.execute(product: product));
    },
  );

  blocTest<ProductBloc, ProductState>(
    'should emit [SpecificProductLoadingState, SucessState] when deleting a product is successful',
    build: () {
      when(mockDeleteProduct.execute(id: '02'))
          .thenAnswer((_) async => const Right(unit));
      return productBloc;
    },
    act: (bloc) => bloc.add(const DeleteProductEvent(id: '02')),
    expect: () => [
      SpecificProductLoadingState(),
      const SucessState('Successfully deleted product.'),
    ],
    verify: (_) {
      verify(mockDeleteProduct.execute(id: '02'));
    },
  );
}
