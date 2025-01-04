import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/utils/kstrings.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/back_button.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:fashion_app/common/widgets/shimmers/list_shimmer.dart';
import 'package:fashion_app/src/categories/controllers/category_notifier.dart';
import 'package:fashion_app/src/categories/hook/fetch_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CategoriesPage extends HookWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final results = fetchCategories();
    final categories = results.categories;
    final isLoading = results.isLoading;
    final error = results.error;

    if (isLoading) {
      return const Scaffold(
        body: ListShimmer(),
      );
    }
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: ReusableText(
            text: AppText.kCategories,
            style: appStyle(16, Kolors.kPrimary, FontWeight.bold)),
      ),
      body: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, i) {
            final category = categories[i];
            return ListTile(
              onTap: () {
                // go to category page
                context
                    .read<CategoryNotifier>()
                    .setCategory(category.title, category.id);
                context.push('/category');
              },
              leading: CircleAvatar(
                backgroundColor: Kolors.kSecondaryLight,
                radius: 18,
                child: Padding(
                  padding: EdgeInsets.all(8.h),
                  child: SvgPicture.network(category.imageUrl),
                ),
              ),
              title: ReusableText(
                  text: category.title,
                  style: appStyle(12, const Color.fromARGB(255, 0, 0, 0),
                      FontWeight.normal)),
              trailing: const Icon(
                MaterialCommunityIcons.chevron_double_right,
                size: 18,
              ),
            );
          }),
    );
  }
}
