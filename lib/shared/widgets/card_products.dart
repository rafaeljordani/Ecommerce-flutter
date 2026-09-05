import 'package:ecommerce/features/home/models/product_model.dart';
import 'package:ecommerce/shared/app_text_style.dart';
import 'package:ecommerce/shared/modals.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CardProducts extends StatelessWidget {
  const CardProducts({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    Modals modals = Modals();
    return GestureDetector(
      onTap: () {
        modals.AppBottomSheet(context, product);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Skeleton.replace(
                height: 148,
                width: 148,
                child: Image.network(product.imageUrl.toString()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(product.brand, style: AppTextStyle.texSpanGrey),
            ),
            Text(product.name, style: AppTextStyle.subTitle),
            Text(
              '\$${product.price.toString()}',
              style: AppTextStyle.textPrice,
            ),
          ],
        ),
      ),
    );
  }
}
