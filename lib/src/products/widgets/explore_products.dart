import 'package:fashion_app/common/services/storage.dart';
import 'package:fashion_app/common/widgets/login_bottom_sheet.dart';
import 'package:fashion_app/common/widgets/shimmers/list_shimmer.dart';
import 'package:fashion_app/const/resource.dart';
import 'package:fashion_app/src/home/controllers/home_tab_notifier.dart';
import 'package:fashion_app/src/products/hooks/fetch_products.dart';
import 'package:fashion_app/src/products/widgets/staggered_tile_widget.dart';
import 'package:fashion_app/src/wishlist/controllers/wishlist_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class ExploreProducts extends HookWidget {
  const ExploreProducts({super.key});

  @override
  Widget build(BuildContext context) {
    String? accessToken = Storage().getString('accessToken');
    final results = fetchProducts(context.watch<HomeTabNotifier>().queryType);
    final products = results.products;
    final isLoading = results.isLoading;

    if (isLoading) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: const ListShimmer(),
      );
    }

    return products.isEmpty
        ? Padding(
            padding: EdgeInsets.all(25.w),
            child: Image.asset(
              R.ASSETS_IMAGES_EMPTY_PNG,
              height: ScreenUtil().screenHeight * .3,
            ),
          )
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.h),
            child: StaggeredGrid.count(
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              crossAxisCount: 4,
              children: List.generate(products.length, (i) {
                final double mainAxisCellCount = (i % 2 == 0 ? 2.17 : 2.4);
                final product = products[i];
                return StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: mainAxisCellCount,
                    child: Padding(
                      padding: EdgeInsets.all((i % 2 == 0 ? 2.17 : 2.4)),
                      child: StaggeredTileWidget(
                        onTap: () {
                          if (accessToken == null) {
                            loginBottomSheet(context);
                          } else {
                            context
                                .read<WishlistNotifier>()
                                .addRemoveWishlist(product.id, () {});
                          }
                        },
                        product: product,
                        i: i,
                      ),
                    ));
              }),
            ),
          );
  }
}
