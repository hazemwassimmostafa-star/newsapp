import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/news/model/data_models/article_response_model/article.dart';
import 'package:timeago/timeago.dart' as timeago;

class ArticleFullScreenView extends StatelessWidget {
  const ArticleFullScreenView({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final imageUrl = article.urlToImage;
    final description = article.description?.trim();
    final content = article.content?.trim();
    final hasContent = content != null && content.isNotEmpty;

    return Scaffold(
      appBar: AppBar(title: const Text('Article')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article.title ?? '',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12.h),
              if (article.author?.isNotEmpty == true)
                Text('By ${article.author}', style: theme.textTheme.bodySmall),
              if (article.publishedAt != null)
                Text(
                  timeago.format(article.publishedAtDate),
                  style: theme.textTheme.bodySmall,
                ),
              SizedBox(height: 16.h),
              if (imageUrl != null && imageUrl.isNotEmpty) ...[
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.broken_image_outlined),
                  ),
                ),
                SizedBox(height: 20.h),
              ],
              if (description != null && description.isNotEmpty) ...[
                Text(description, style: theme.textTheme.bodyLarge),
                SizedBox(height: 16.h),
              ],
              if (hasContent)
                Text(content, style: theme.textTheme.bodyMedium)
              else
                Text(
                  'No additional article content is available from the news API.',
                  style: theme.textTheme.bodyMedium,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
