import 'package:khatoon_container/features/purchase/data/models/payment_model.dart';
import 'package:khatoon_container/features/purchase/data/repositories/purchase_repository_impl.dart';

class UpdatePurchaseUseCase {
  final PurchaseRepository repository;

  const UpdatePurchaseUseCase({required this.repository});

  Future<void> execute(PaymentModel payment) {
    return repository.updatePayment(payment);
  }
}
