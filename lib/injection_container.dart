import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:isar/isar.dart';
import 'package:khatoon_container/core/storage/local_storage/isar/data/repositories/isar_provider.dart';
import 'package:khatoon_container/features/purchase/domain/usecases/delivery_usecase.dart';
import 'package:khatoon_container/features/purchase/domain/usecases/payment_usecase.dart';
import 'package:khatoon_container/features/purchase/domain/usecases/purchase_item_usecase.dart';
import 'package:khatoon_container/features/purchase/presentation/bloc/purchase_event.dart';
import 'package:khatoon_container/features/user/data/data_sources/user_local_data_source.dart';
import 'package:khatoon_container/features/user/data/models/user_model/user_model.dart';
import 'package:khatoon_container/features/user/data/repositories/user_repository.dart';
import 'package:khatoon_container/features/user/domain/usecases/user_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Features - Purchase
import 'package:khatoon_container/features/purchase/data/datasources/purchase_local_data_source.dart';
import 'package:khatoon_container/features/purchase/data/datasources/purchase_remote_data_source.dart';
import 'package:khatoon_container/features/purchase/data/repositories/purchase_repository_impl.dart';
import 'package:khatoon_container/features/purchase/domain/repositories/purchase_repository.dart';
import 'package:khatoon_container/features/purchase/domain/usecases/order_usecase.dart';
import 'package:khatoon_container/features/purchase/domain/usecases/purchase_usecase.dart';

// ... سایر usecase ها
import 'package:khatoon_container/features/purchase/presentation/bloc/purchase_bloc.dart';

final sl = GetIt.instance;

/// توابع کمکی برای ثبت سریع وابستگی‌ها
extension GetItX on GetIt {
  void lazySingleton<T extends Object>(T Function() factoryFunc) =>
      registerLazySingleton<T>(factoryFunc);

  void factory<T extends Object>(T Function() factoryFunc) =>
      registerFactory<T>(factoryFunc);
}

class InjectionContainer {
  static Future<void> init() async {
    // ====================== External ======================
    // SharedPreferences
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.lazySingleton<SharedPreferences>(() => sharedPreferences);

    // Dio
    sl.lazySingleton<Dio>(
      () =>
          Dio(
              BaseOptions(
                baseUrl: 'https://your-api-base-url.com',
                // آدرس پایه API خود را قرار دهید
                connectTimeout: const Duration(seconds: 15),
                receiveTimeout: const Duration(seconds: 15),
                headers: {
                  'Content-Type': 'application/json',
                  'Accept': 'application/json',
                },
              ),
            )
            ..interceptors.add(
              LogInterceptor(requestBody: true, responseBody: true),
            ),
    );

    // ====================== Data Sources ======================
    sl.lazySingleton<PurchaseRemoteDataSource>(
      () => PurchaseRemoteDataSource(dioClient: sl<Dio>()),
    );

    sl.lazySingleton<PurchaseLocalDataSource>(
      () => PurchaseLocalDataSource(sharedPreferences: sl<SharedPreferences>()),
    );

    // ====================== Repository ======================
    sl.lazySingleton<IPurchaseRepository>(
      () => PurchaseRepository(
        remoteDataSource: sl<PurchaseRemoteDataSource>(),
        localDataSource: sl<PurchaseLocalDataSource>(),
      ),
    );

    // ======================Purchase Use Cases ======================
    //====== Get

    sl.lazySingleton<GetPurchasesUseCase>(
      () => GetPurchasesUseCase(repository: sl<PurchaseRemoteDataSource>()),
    );

    sl.lazySingleton<GetPurchasesByIdUseCase>(
      () => GetPurchasesByIdUseCase(repository: sl<PurchaseRemoteDataSource>()),
    );

    sl.lazySingleton<GetDeliveryByPurchaseIdUseCase>(
      () => GetDeliveryByPurchaseIdUseCase(
        repository: sl<PurchaseRemoteDataSource>(),
      ),
    );

    sl.lazySingleton<GetOrdersByPurchaseIdUseCase>(
      () => GetOrdersByPurchaseIdUseCase(
        repository: sl<PurchaseRemoteDataSource>(),
      ),
    );

    sl.lazySingleton<GetPaymentsByInvoiceIdUseCase>(
      () => GetPaymentsByInvoiceIdUseCase(
        repository: sl<PurchaseRemoteDataSource>(),
      ),
    );

    sl.lazySingleton<GetPurchasesItemsByPurchaseIdUseCase>(
      () => GetPurchasesItemsByPurchaseIdUseCase(
        repository: sl<PurchaseRemoteDataSource>(),
      ),
    );

    //====== Update

    sl.lazySingleton<UpdatePurchaseUseCase>(
      () => UpdatePurchaseUseCase(repository: sl<PurchaseRemoteDataSource>()),
    );

    sl.lazySingleton<UpdatePurchaseItemUseCase>(
      () =>
          UpdatePurchaseItemUseCase(repository: sl<PurchaseRemoteDataSource>()),
    );

    sl.lazySingleton<UpdatePaymentUseCase>(
      () => UpdatePaymentUseCase(repository: sl<PurchaseRemoteDataSource>()),
    );

    sl.lazySingleton<UpdateOrderUseCase>(
      () => UpdateOrderUseCase(repository: sl<PurchaseRemoteDataSource>()),
    );

    sl.lazySingleton<UpdateDeliveryUseCase>(
      () => UpdateDeliveryUseCase(repository: sl<PurchaseRemoteDataSource>()),
    );

    //====== Delete

    sl.lazySingleton<DeletePurchaseUseCase>(
      () => DeletePurchaseUseCase(repository: sl<PurchaseRemoteDataSource>()),
    );

    sl.lazySingleton<DeletePurchaseItemByIdUseCase>(
      () => DeletePurchaseItemByIdUseCase(
        repository: sl<PurchaseRemoteDataSource>(),
      ),
    );

    sl.lazySingleton<DeletePurchaseItemUseCase>(
      () => DeletePurchaseItemUseCase(
        repository: sl<PurchaseRemoteDataSource>(),
      ),
    );

    sl.lazySingleton<DeletePaymentUseCase>(
      () => DeletePaymentUseCase(repository: sl<PurchaseRemoteDataSource>()),
    );

    sl.lazySingleton<DeletePaymentsByIdUseCase>(
      () =>
          DeletePaymentsByIdUseCase(repository: sl<PurchaseRemoteDataSource>()),
    );

    sl.lazySingleton<DeleteOrderUseCase>(
      () => DeleteOrderUseCase(repository: sl<PurchaseRemoteDataSource>()),
    );

    sl.lazySingleton<DeleteOrdersByIdUseCase>(
      () => DeleteOrdersByIdUseCase(repository: sl<PurchaseRemoteDataSource>()),
    );

    sl.lazySingleton<DeleteDeliveryUseCase>(
      () => DeleteDeliveryUseCase(repository: sl<PurchaseRemoteDataSource>()),
    );

    sl.lazySingleton<DeleteDeliveriesByIdUseCase>(
      () => DeleteDeliveriesByIdUseCase(
        repository: sl<PurchaseRemoteDataSource>(),
      ),
    );

    //====== Create
    sl.lazySingleton<CreatePurchaseUseCase>(
      () => CreatePurchaseUseCase(repository: sl<PurchaseRemoteDataSource>()),
    );

    sl.lazySingleton<CreatePurchaseItemUseCase>(
      () =>
          CreatePurchaseItemUseCase(repository: sl<PurchaseRemoteDataSource>()),
    );

    sl.lazySingleton<CreatePaymentUseCase>(
      () => CreatePaymentUseCase(repository: sl<PurchaseRemoteDataSource>()),
    );

    sl.lazySingleton<CreatePaymentsUseCase>(
      () => CreatePaymentsUseCase(repository: sl<PurchaseRemoteDataSource>()),
    );

    sl.lazySingleton<CreateOrderUseCase>(
      () => CreateOrderUseCase(repository: sl<PurchaseRemoteDataSource>()),
    );

    sl.lazySingleton<CreateDeliveryUseCase>(
      () => CreateDeliveryUseCase(repository: sl<PurchaseRemoteDataSource>()),
    );

    // ====================== Bloc ======================
    sl.lazySingleton<PurchaseBloc>(
      () => PurchaseBloc(
        // Purchase Invoice
        getPurchasesUseCase: sl<GetPurchasesUseCase>(),
        getPurchasesByIdUseCase: sl<GetPurchasesByIdUseCase>(),
        createPurchaseUseCase: sl<CreatePurchaseUseCase>(),
        updatePurchaseUseCase: sl<UpdatePurchaseUseCase>(),
        deletePurchaseUseCase: sl<DeletePurchaseUseCase>(),

        // Purchase Item
        getPurchasesItemsUseCase: sl<GetPurchasesItemsByPurchaseIdUseCase>(),
        createPurchaseItemUseCase: sl<CreatePurchaseItemUseCase>(),
        updatePurchaseItemUseCase: sl<UpdatePurchaseItemUseCase>(),
        deletePurchaseItemUseCase: sl<DeletePurchaseItemByIdUseCase>(),

        // Payment
        getPaymentsUseCase: sl<GetPaymentsByInvoiceIdUseCase>(),
        createPaymentUseCase: sl<CreatePaymentUseCase>(),
        createPaymentsUseCase: sl<CreatePaymentsUseCase>(),
        updatePaymentUseCase: sl<UpdatePaymentUseCase>(),
        deletePaymentUseCase: sl<DeletePaymentUseCase>(),
        deletePaymentByIdUseCase: sl<DeletePaymentsByIdUseCase>(),

        // Order
        getOrdersUseCase: sl<GetOrdersByPurchaseIdUseCase>(),
        createOrderUseCase: sl<CreateOrderUseCase>(),
        updateOrderUseCase: sl<UpdateOrderUseCase>(),
        deleteOrderUseCase: sl<DeleteOrderUseCase>(),
        deleteOrderByIdUseCase: sl<DeleteOrdersByIdUseCase>(),

        // Delivery
        getDeliveriesUseCase: sl<GetDeliveryByPurchaseIdUseCase>(),
        createDeliveryUseCase: sl<CreateDeliveryUseCase>(),
        updateDeliveryUseCase: sl<UpdateDeliveryUseCase>(),
        deleteDeliveryUseCase: sl<DeleteDeliveryUseCase>(),
        deleteDeliveryByIdUseCase: sl<DeleteDeliveriesByIdUseCase>(),
      ),
    );

    // Register dependencies
    IsarProvider().setupDependencies();

    GetIt.instance.registerLazySingleton<UserLocalDataSource>(
      () => UserLocalDataSource(GetIt.instance<Isar>()),
    );

    GetIt.instance.registerLazySingleton<UserRepository>(
      () => UserRepository(GetIt.instance<UserLocalDataSource>()),
    );

    GetIt.instance.registerLazySingleton<GetUsersUseCase>(
      () => GetUsersUseCase(GetIt.instance<UserRepository>()),
    );

    GetIt.instance.registerLazySingleton<SaveUserUseCase>(
      () => SaveUserUseCase(GetIt.instance<UserRepository>()),
    );
  }
}
