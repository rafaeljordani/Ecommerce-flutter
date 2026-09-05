import 'package:ecommerce/features/home/models/product_model.dart';
import 'package:ecommerce/shared/modal_product_card.dart';
import 'package:flutter/material.dart';

class Modals {
  Future<dynamic> AppBottomSheet(BuildContext context, Product product) {
    return showModalBottomSheet(
      isScrollControlled: true,

      // barrierColor:,
      enableDrag: true,
      showDragHandle: true,
      context: context,
      builder: (context) {
        return ModalProductCard(product: product);
      },
    );
  }
}
