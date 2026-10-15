import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/common/app_text_style.dart';
import 'package:newsapp/common/themes/app_colors.dart';

class CustomDropDownMenueDiget extends StatelessWidget {
  const CustomDropDownMenueDiget({
    super.key,
    required this.foregroundColor,
    this.bgColor,
    required this.items,
    this.onSelected,
  });

  final Color foregroundColor;
  final bgColor;
  final List<DropdownMenuEntry> items;
  final ValueChanged<dynamic>? onSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 20.h),
      child: DropdownMenu(
        onSelected: onSelected,
        width: 237.w,
        trailingIcon: Icon(
          Icons.arrow_drop_down_rounded,
          color: AppColors.pramiryWhite,
        ),
        textStyle: AppTextStyle.styles20w700white.copyWith(
          color: foregroundColor,
        ),
        dropdownMenuEntries: items
            .map(
              (e) => DropdownMenuEntry(
                value: e.value,
                label: e.label,
                style: ButtonStyle(
                  foregroundColor: WidgetStateProperty.all(foregroundColor),
                ),
              ),
            )
            .toList(),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: foregroundColor, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: foregroundColor, width: 2.0),
          ),
        ),
        menuStyle: MenuStyle(
          backgroundColor: WidgetStateProperty.all(bgColor),
          elevation: WidgetStateProperty.all(8),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
