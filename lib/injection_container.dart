import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:khatoon_container/features/purchase/data/datasources/purchase_local_data_source.dart';
import 'package:khatoon_container/features/purchase/data/datasources/purchase_remote_data_source.dart';

// Features
import 'package:khatoon_container/features/purchase/data/repositories/purchase_repository_impl.dart';
import 'package:khatoon_container/features/purchase/domain/usecases/create_purchase_usecase.dart';
import 'package:khatoon_container/features/purchase/domain/usecases/get_purchase_usecase.dart';
import 'package:khatoon_container/features/purchase/domain/usecases/update_purchase_usecase.dart';
import 'package:khatoon_container/features/purchase/domain/usecases/delete_purchase_usecase.dart';
// ... سایر usecase ها رو هم ایمپورت کن

import 'package:khatoon_container/features/purchase/presentation/bloc/purchase_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    sl.lazySingleton<Dio>(
      () => Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
        ),
      ),
    );

    // ====================== Data Sources ======================
    sl.lazySingleton<PurchaseRemoteDataSource>(
      () => PurchaseRemoteDataSource(dioClient:  sl<Dio>()),
    );

    sl.lazySingleton<PurchaseLocalDataSource>(
      () => PurchaseLocalDataSource(sharedPreferences: sl<SharedPreferences>()),
    );

    // ====================== Repository ======================
    sl.lazySingleton<PurchaseRepository>(
      () => PurchaseRepository(remoteDataSource: sl(), localDataSource: sl()),
    );

    // ====================== Use Cases ======================
    // خریدها
    sl.lazySingleton(() => GetAllPurchasesUseCase(sl()));
    sl.lazySingleton(() => GetPurchase(sl()));
    sl.lazySingleton(() => CreatePurchaseUseCase(sl()));
    sl.lazySingleton(() => UpdatePurchaseUseCase(sl()));
    sl.lazySingleton(() => DeletePurchaseUseCase(sl()));

    // پرداخت‌ها
    sl.lazySingleton(() => GetPaymentsUseCase(sl()));
    sl.lazySingleton(() => AddPaymentUseCase(sl()));
    sl.lazySingleton(() => DeletePaymentUseCase(sl()));

    // تحویل‌ها
    sl.lazySingleton(() => GetDeliveriesUseCase(sl()));
    sl.lazySingleton(() => AddDeliveryUseCase(sl()));
    sl.lazySingleton(() => DeleteDeliveryUseCase(sl()));

    // آیتم‌های خرید
    sl.lazySingleton(() => GetPurchaseItemsUseCase(sl()));
    sl.lazySingleton(() => AddPurchaseItemUseCase(sl()));
    sl.lazySingleton(() => DeletePurchaseItemUseCase(sl()));

    // ====================== Bloc ======================
    sl.factory<PurchaseBloc>(
      () => PurchaseBloc(
        getPurchasesUseCase: sl(),
        getPurchaseById: sl(),
        createPurchaseUseCase: sl(),
        updatePurchase: sl(),
        deletePurchase: sl(),
        addPayment: sl(),
        addDelivery: sl(),
        // اگر از بقیه usecase ها هم استفاده می‌کنی اضافه کن
      ),
    );
  }
}
