import 'package:fashion_app/src/products/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/src/products/controllers/colors_sizes_notifier.dart';

class ProductSizesWidget extends StatelessWidget {
  final Products product;

  const ProductSizesWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorSizesNotifier>(
      builder: (context, controller, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(product.imageUrls.length, (i) {
            String size =
                product.imageUrls[i]; // Assuming `imageUrls` holds size data
            return GestureDetector(
              onTap: () {
                controller.setSizes(size);
              },
              child: Container(
                height: 30.h,
                width: 45.h,
                decoration: BoxDecoration(
                  color: controller.sizes == size
                      ? Kolors.kPrimary
                      : Kolors.kGrayLight,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Center(
                  child: Text(
                    size,
                    style: appStyle(20, Kolors.kWhite, FontWeight.bold),
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
