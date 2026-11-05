import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/common/app_text_style.dart';
import 'package:newsapp/common/themes/app_colors.dart';
import 'package:newsapp/common/widgets/custom_drop_down_menue_diget.dart';
import 'package:newsapp/news/view_model/provider/main_screen_provider.dart.dart';
import 'package:provider/provider.dart';
import 'package:newsapp/common/themes/theme_provider.dart';
import 'package:newsapp/common/localization/language_provider.dart';
import 'package:newsapp/l10n/app_localizations.dart';

class DrawerWidgets extends StatelessWidget {
  const DrawerWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      width: 270.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 186.h,
            alignment: Alignment(0, 0),
            color: AppColors.pramiryWhite,
            child: Text(
              l10n.appName,
              style: AppTextStyle.styles14w700black.copyWith(fontSize: 24.sp),
            ),
          ),
          ListTile(
            title: Text(
              l10n.goToHome,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            leading: Icon(
              Icons.home_outlined,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onTap: () {
              Provider.of<MainScreenProvider>(
                context,
                listen: false,
              ).changeCategory(null);
              Navigator.of(context).pop();
            },
          ),

          Divider(
            endIndent: 16.w,
            indent: 16.w,
            color: Theme.of(context).brightness == Brightness.light
                ? AppColors.praimyBlack
                : AppColors.pramiryWhite,
          ),
          ListTile(
            title: Text(
              l10n.appTheme,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            leading: Icon(
              Icons.brush_outlined,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          CustomDropDownMenueDiget(
            foregroundColor: isDark
                ? AppColors.pramiryWhite
                : AppColors.praimyBlack,
            bgColor: isDark ? AppColors.praimyBlack : AppColors.pramiryWhite,
            items: [
              DropdownMenuEntry(value: ThemeMode.dark, label: l10n.darkTheme),
              DropdownMenuEntry(value: ThemeMode.light, label: l10n.lightTheme),
            ],
            onSelected: (value) {
              if (value is ThemeMode) {
                context.read<ThemeProvider>().changeTheme(value);
              }
            },
          ),
          Divider(
            endIndent: 16.w,
            indent: 16.w,
            color: Theme.of(context).brightness == Brightness.light
                ? AppColors.praimyBlack
                : AppColors.pramiryWhite,
          ),
          ListTile(
            title: Text(
              l10n.language,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            leading: Icon(
              Icons.language_outlined,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          CustomDropDownMenueDiget(
            foregroundColor: isDark
                ? AppColors.pramiryWhite
                : AppColors.praimyBlack,
            bgColor: isDark ? AppColors.praimyBlack : AppColors.pramiryWhite,
            items: [
              DropdownMenuEntry(value: "ar", label: l10n.arabic),
              DropdownMenuEntry(value: "en", label: l10n.english),
            ],
            onSelected: (value) {
              if (value == "ar" || value == "en") {
                context.read<LanguageProvider>().changeLanguage(Locale(value));
              }
            },
          ),

          Divider(
            endIndent: 16.w,
            indent: 16.w,
            color: Theme.of(context).brightness == Brightness.light
                ? AppColors.praimyBlack
                : AppColors.pramiryWhite,
          ),
        ],
      ),
    );
  }
}
