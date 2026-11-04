import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/common/app_text_style.dart';
import 'package:newsapp/common/extension/widget_extension.dart';
import 'package:newsapp/common/themes/app_colors.dart';
import 'package:newsapp/common/enums/category_enum.dart';
import 'package:newsapp/l10n/app_localizations.dart';
import 'package:newsapp/news/view/screen/main_screen.dart';
import 'package:newsapp/news/view_model/provider/main_screen_provider.dart.dart';
import 'package:provider/provider.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({
    super.key,
    required this.categoryEnum,
    required this.isEven,
    this.onSelected,
  });

  final CategoryEnum categoryEnum;
  final bool isEven;
  final ValueChanged<dynamic>? onSelected;

  String _categoryName(AppLocalizations l10n) {
    switch (categoryEnum) {
      case CategoryEnum.general:
        return l10n.general;
      case CategoryEnum.business:
        return l10n.business;
      case CategoryEnum.sports:
        return l10n.sports;
      case CategoryEnum.tecnology:
        return l10n.technology;
      case CategoryEnum.health:
        return l10n.health;
      case CategoryEnum.science:
        return l10n.science;
      case CategoryEnum.entertainment:
        return l10n.entertainment;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Card background
    final cardColor = isDark ? AppColors.pramiryWhite : AppColors.praimyBlack;

    // Category title
    final titleColor = isDark ? AppColors.praimyBlack : AppColors.pramiryWhite;

    // Arrow circle background
    final arrowBackgroundColor = isDark
        ? AppColors.praimyBlack
        : AppColors.pramiryWhite;

    // Arrow icon color
    final arrowColor = isDark ? AppColors.pramiryWhite : AppColors.praimyBlack;

    // View All text color
    final buttonTextColor = isDark
        ? AppColors.pramiryWhite
        : AppColors.praimyBlack;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      width: 1.sw,
      height: 200.h,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(24.r),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // Category image changes automatically with theme
          Positioned.fill(
            child: Image.asset(
              categoryEnum.getThemeImage(isDark),
              fit: BoxFit.fill,
            ),
          ),

          // Category content
          Align(
            alignment: isEven ? Alignment.centerRight : Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _categoryName(l10n),
                  style: AppTextStyle.styles22w400black.copyWith(
                    fontSize: 30.sp,
                    color: titleColor,
                  ),
                ),

                InkWell(
                  onTap: () => Provider.of<MainScreenProvider>(
                    context,
                    listen: false,
                  ).changeCategory(categoryEnum),
                  child: Container(
                    width: 178.w,
                    height: 55.h,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(84.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (!isEven)
                          CircleAvatar(
                            backgroundColor: arrowBackgroundColor,
                            radius: 27.r,
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: arrowColor,
                            ),
                          ),

                        Text(
                          l10n.viewAll,
                          style: AppTextStyle.styles20w700white.copyWith(
                            fontSize: 24.sp,
                            color: buttonTextColor,
                          ),
                        ).symtricpadding(vertical: 9.h, hrozintal: 12),

                        if (isEven)
                          CircleAvatar(
                            backgroundColor: arrowBackgroundColor,
                            radius: 27.r,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: arrowColor,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
