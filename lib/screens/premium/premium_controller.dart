import 'dart:async';

import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:vibration_strong/core/base/base_controller.dart';
import 'package:vibration_strong/core/model/package_model.dart';
import 'package:vibration_strong/routes/app_pages.dart';

import '../../core/model/purchasable_product.dart';
import '../in_app_manage.dart';

class PremiumController extends BaseController {
  late StreamSubscription<List<PurchaseDetails>> _subscription;
  final iapConnection = IAPConnection.instance;
  List<PurchasableProduct> products = [];
  RxList<PackageModel> packages = <PackageModel>[
    PackageModel(title: 'Popular', unit: 'Weekly', price: '69.000 đ'),
    PackageModel(
        title: '3 Day\nFree Trial',
        unit: 'Monthly',
        price: '289.000 đ',
        isSelected: true),
    PackageModel(title: 'Best Price', unit: 'Lifetime', price: '579.000 đ'),
  ].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    final purchaseUpdated = iapConnection.purchaseStream;
    _subscription = purchaseUpdated.listen(
      _onPurchaseUpdate,
      onDone: _updateStreamOnDone,
      onError: _updateStreamOnError,
    );
    loadPurchases();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    _subscription.cancel();
    super.onClose();
  }

  void onChangeSelected(int index) {
    for (int i = 0; i < packages.length; i++) {
      packages[i].isSelected = false;
    }
    packages[index].isSelected = true;
    packages.refresh();
  }

  Future<void> loadPurchases() async {
    final available = await iapConnection.isAvailable();
    if (!available) {
      print("Not avaiable");
      // storeState = StoreState.notAvailable;
      // notifyListeners();
      return;
    }
    const ids = <String>{
      "premium_weekly",
      "premium_monthly",
      "premium_lifetime",
    };
    final response = await iapConnection.queryProductDetails(ids);
    for (var element in response.notFoundIDs) {
      print('Purchase $element not found');
    }
    products =
        response.productDetails.map((e) => PurchasableProduct(e)).toList().reversed.toList();
    for (int i = 0; i < products.length; i++) {
      print(
          'price = ${products[i].price}\ntitle = ${products[i].title}\ndescription = ${products[i].description}');
    }
  }

  Future<void> buy(int index) async {
    final purchaseParam = PurchaseParam(productDetails: products[index].productDetails);
    print("product = ${products[index].id}");
    switch (products[index].id) {
      case 'premium_weekly':
      case 'premium_monthly':
      case 'premium_lifetime':
        await iapConnection.buyNonConsumable(purchaseParam: purchaseParam);
        break;
      default:
        throw ArgumentError.value(
            products[index].productDetails, '${products[index].id} is not a known product');
    }
  }

  void openPrivacy(){
    Get.toNamed(Routes.PRIVACY);
  }

  void openTerm(){
    Get.toNamed(Routes.TERM);
  }

  void restore(){
    iapConnection.restorePurchases();
  }

  void _onPurchaseUpdate(List<PurchaseDetails> purchaseDetailsList) {
    // Handle purchases here
  }

  void _updateStreamOnDone() {
    _subscription.cancel();
  }

  void _updateStreamOnError(dynamic error) {
    //Handle error here
  }
}
