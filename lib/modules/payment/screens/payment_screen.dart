import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  final List<ProductDetails> _products = [];
  final List<PurchaseDetails> _purchases = [];
  bool _isAvailable = false;

  @override
  void initState() {
    super.initState();
    _initializeInAppPurchases();
  }

  Future<void> _initializeInAppPurchases() async {
    _isAvailable = await _inAppPurchase.isAvailable();

    if (!_isAvailable) {
      setState(() {});
      return;
    }

    const Set<String> productIds = {'product_id_1', 'product_id_2'};
    final ProductDetailsResponse response =
        await _inAppPurchase.queryProductDetails(productIds);

    if (response.error != null) {
      // Handle error
      return;
    }

    if (response.productDetails.isNotEmpty) {
      setState(() {
        _products.addAll(response.productDetails);
      });
    }

    _inAppPurchase.purchaseStream.listen((purchases) {
      _handlePurchaseUpdates(purchases);
    });
  }

  void _handlePurchaseUpdates(List<PurchaseDetails> purchases) {
    for (final purchase in purchases) {
      if (purchase.status == PurchaseStatus.purchased) {
        // Deliver product or update UI
      } else if (purchase.status == PurchaseStatus.error) {
        // Handle error
      }

      if (purchase.pendingCompletePurchase) {
        _inAppPurchase.completePurchase(purchase);
      }
    }

    setState(() {
      _purchases.addAll(purchases);
    });
  }

  void _buyProduct(ProductDetails product) {
    final PurchaseParam purchaseParam = PurchaseParam(productDetails: product);
    _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('In-App Purchases')),
      body: _isAvailable
          ? ListView.builder(
              itemCount: _products.length,
              itemBuilder: (context, index) {
                final product = _products[index];
                return ListTile(
                  title: Text(product.title),
                  subtitle: Text(product.description),
                  trailing: Text(product.price),
                  onTap: () => _buyProduct(product),
                );
              },
            )
          : const Center(
              child: Text('In-App Purchases not available'),
            ),
    );
  }
}
