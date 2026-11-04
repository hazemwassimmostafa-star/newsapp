import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/news/model/data_models/article_response_model/article.dart';
import 'package:newsapp/screens/article_full_screen_view.dart';

class ArticleBottomSheet extends StatelessWidget {
  const ArticleBottomSheet({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final imageUrl = article.urlToImage;
    final description = article.description?.trim();

    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 20.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 42.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: colors.onSurface.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              if (imageUrl != null && imageUrl.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    height: 200.h,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) =>
                        SizedBox(height: 100.h, child: const Icon(Icons.broken_image_outlined)),
                  ),
                ),
              SizedBox(height: 16.h),
              Text(
                article.title ?? '',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (description != null && description.isNotEmpty) ...[
                SizedBox(height: 12.h),
                Text(description, style: theme.textTheme.bodyMedium),
              ],
              SizedBox(height: 20.h),
              SizedBox(
                height: 48.h,
                child: FilledButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) =>
                            ArticleFullScreenView(article: article),
                      ),
                    );
                  },
                  child: const Text('View Full Article'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
