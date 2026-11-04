import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/common/extension/context_extension.dart';
import 'package:newsapp/common/enums/category_enum.dart';
import 'package:newsapp/screens/widgets/category_card_widget.dart';
import 'package:newsapp/l10n/app_localizations.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return ListView(
      padding: EdgeInsets.all(16.r),
      children: [
        Text(
          l10n.welcomeNews,
          style: context.textTheme.titleLarge!.copyWith(fontSize: 24.sp),
        ),

        ...List.generate(
          CategoryEnum.values.length,
          (index) => CategoryCardWidget(
            categoryEnum: CategoryEnum.values[index],
            isEven: index % 2 == 0,
          ),
        ),
      ],
    );
  }
}
