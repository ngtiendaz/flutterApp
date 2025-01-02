import 'package:fashion_app/common/services/storage.dart';
import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/utils/kstrings.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/back_button.dart';
import 'package:fashion_app/common/widgets/email_textfield.dart';
import 'package:fashion_app/common/widgets/empty_screen_widget.dart';
import 'package:fashion_app/common/widgets/login_bottom_sheet.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:fashion_app/src/products/widgets/staggered_tile_widget.dart';
import 'package:fashion_app/src/search/controllers/search_notifier.dart';
import 'package:fashion_app/src/wishlist/controllers/wishlist_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String? accessToken = Storage().getString('accessToken');
    return Scaffold(
      appBar: AppBar(
        leading: AppBackButton(
          onTap: () {
            context.read<SearchNotifier>().clearResults();
            context.pop();
          },
        ),
        title: ReusableText(
            text: AppText.kSearch,
            style: appStyle(15, Kolors.kPrimary, FontWeight.bold)),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.h),
          child: Padding(
            padding: EdgeInsets.all(14.w),
            child: EmailTextField(
              controller: _searchController,
              radius: 30,
              hintText: AppText.kSearchHint,
              prefixIcon: GestureDetector(
                  onTap: () {
                    if (_searchController.text.isNotEmpty) {
                      context
                          .read<SearchNotifier>()
                          .searchFunction(_searchController.text);
                    } else {
                      // print("SEARCH KEY IS EMPTY");
                    }
                  },
                  child: const Icon(
                    AntDesign.search1,
                    color: Kolors.kPrimary,
                  )),
            ),
          ),
        ),
      ),
      body: Consumer<SearchNotifier>(
        builder: (context, searchNotifier, child) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: ListView(
              children: [
                searchNotifier.results.isNotEmpty
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ReusableText(
                              text: AppText.kSearchResults,
                              style: appStyle(
                                  13, Kolors.kPrimary, FontWeight.w600)),
                          ReusableText(
                              text: searchNotifier.searchKey,
                              style: appStyle(
                                  13, Kolors.kPrimary, FontWeight.w600))
                        ],
                      )
                    : const SizedBox.shrink(),
                SizedBox(height: 10.h),
                searchNotifier.results.isNotEmpty
                    ? StaggeredGrid.count(
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                        crossAxisCount: 4,
                        children:
                            List.generate(searchNotifier.results.length, (i) {
                          final double mainAxisCellCount =
                              (i % 2 == 0 ? 2.17 : 2.4);
                          final product = searchNotifier.results[i];
                          return StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: mainAxisCellCount,
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
                              ));
                        }),
                      )
                    : const EmptyScreenWidget()
              ],
            ),
          );
        },
      ),
    );
  }
}
