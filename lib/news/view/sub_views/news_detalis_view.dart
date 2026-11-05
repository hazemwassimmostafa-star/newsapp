
import 'package:flutter/material.dart';
import 'package:newsapp/common/extension/context_extension.dart';
import 'package:newsapp/news/view_model/provider/main_screen_provider.dart.dart';
import 'package:newsapp/screens/widgets/articles_body.dart';
import 'package:newsapp/screens/widgets/error_widget.dart';
import 'package:provider/provider.dart';

class NewsDetalisView extends StatefulWidget {
  const NewsDetalisView({super.key});

  @override
  State<NewsDetalisView> createState() => _NewsDetalisViewState();
}

class _NewsDetalisViewState extends State<NewsDetalisView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      Provider.of<MainScreenProvider>(context, listen: false).getSources();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenProvider>(
      builder:
          (BuildContext context, MainScreenProvider provider, Widget? child) {
            if (provider.isSourcesLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: context.theme.colorScheme.secondary,
                ),
              );
            }

            if (provider.sourcesErrorMessage != null) {
              return Center(
                child: CustomErrorwidget(
                  errorMEssage: provider.sourcesErrorMessage!,
                  onRefresh: () {
                    Provider.of<MainScreenProvider>(
                      context,
                      listen: false,
                    ).getSources();
                  },
                ),
              );
            }

            if ((provider.sources ?? []).isNotEmpty) {
              return DefaultTabController(
                length: provider.sources!.length,
                child: Column(
                  children: [
                    TabBar(
                      unselectedLabelStyle: context.textTheme.labelSmall,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelStyle: context.textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      dividerHeight: 0,
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      tabs: provider.sources!
                          .map((e) => Tab(text: e.name ?? ""))
                          .toList(),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: List.generate(
                          provider.sources!.length,
                          (index) => ArticlesBody(
                            sourceId: provider.sources![index].id ?? "",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }

            return Center(child: Text(" no data found"));
          },
    );
  }
}
