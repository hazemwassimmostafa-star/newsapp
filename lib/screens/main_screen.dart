import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/common/extension/context_extension.dart';
import 'package:newsapp/enums/category_enum.dart';
import 'package:newsapp/screens/widgets/category_card_widget.dart';
import 'package:newsapp/screens/widgets/drawer_widgets.dart';
import 'package:newsapp/l10n/app_localizations.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      drawer: DrawerWidgets(),
      appBar: AppBar(title: Text(l10n.home), actions: [Icon(Icons.search)]),
      body: ListView(
        padding: EdgeInsets.all(16.r),
        children: [
          Text(
            l10n.welcomeNews,
            style: context.textTheme.titleLarge!.copyWith(fontSize: 24.sp),
          ),
          //...CategoryEnum.values.map((e)=>CategoryCardWidget(categoryEnum: e,),)
          ...List.generate(
            CategoryEnum.values.length,
            (index) => CategoryCardWidget(
              categoryEnum: CategoryEnum.values[index],
              isEven: index % 2 == 0,
            ),
          ),
        ],
      ),
    );
  }
}
