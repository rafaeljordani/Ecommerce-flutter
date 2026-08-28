import 'package:ecommerce/features/home/models/category_model.dart';
import 'package:ecommerce/shared/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CardCategory extends StatelessWidget {
  const CardCategory({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5, top: 10),
      height: 76,
      width: 104,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              child: Skeleton.replace(
                height: 80,
                width: 80,
                replacement: Bone.circle(size: 80),
                child: Image.network(category.imageUrl.toString()),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(category.name, style: AppTextStyle.subTitle),
          ),
        ],
      ),
    );
  }
}
