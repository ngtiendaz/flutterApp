import 'package:fashion_app/src/products/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:fashion_app/src/products/controllers/colors_sizes_notifier.dart';

class ColorSelectionWidget extends StatelessWidget {
  final Products product;

  const ColorSelectionWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorSizesNotifier>(
      builder: (context, controller, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(product.imageUrls.length, (i) {
            String color =
                product.imageUrls[i]; // Assuming `imageUrls` holds color data
            return GestureDetector(
              onTap: () {
                controller.setColor(color);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                margin: EdgeInsets.only(right: 20.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: color == controller.color
                      ? Kolors.kPrimary
                      : Kolors.kGrayLight,
                ),
                child: ReusableText(
                  text: color,
                  style: appStyle(12, Kolors.kWhite, FontWeight.normal),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
