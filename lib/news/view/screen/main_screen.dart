import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/common/extension/context_extension.dart';
import 'package:newsapp/common/enums/category_enum.dart';
import 'package:newsapp/news/view_model/provider/main_screen_provider.dart.dart';
import 'package:newsapp/news/view/sub_views/home_view.dart';
import 'package:newsapp/news/view/sub_views/news_detalis_view.dart';
import 'package:newsapp/screens/widgets/category_card_widget.dart';
import 'package:newsapp/screens/widgets/drawer_widgets.dart';
import 'package:newsapp/l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:newsapp/news/view/sub_views/search_view.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return ChangeNotifierProvider(
      create: (BuildContext context) => MainScreenProvider(),
      child: Consumer<MainScreenProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            drawer: DrawerWidgets(),
            appBar: AppBar(
              title: Text(l10n.home),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  tooltip: l10n.search,
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => const SearchView(),
                    ),
                  ),
                ),
              ],
            ),
            body: provider.categoryEnum == null
                ? HomeView()
                : NewsDetalisView(),
          );
        },
      ),
    );
  }
}
