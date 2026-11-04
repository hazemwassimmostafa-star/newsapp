import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/common/extension/context_extension.dart';
import 'package:newsapp/common/themes/app_colors.dart';
import 'package:newsapp/news/model/data_models/article_response_model/article.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:newsapp/screens/widgets/article_bottom_sheet.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      borderRadius: BorderRadius.circular(16.r),
      onTap: () => showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        showDragHandle: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        builder: (context) => ArticleBottomSheet(article: article),
      ),
      child: Container(
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        border: Border.all(
          color: isDark ? AppColors.pramiryWhite : AppColors.praimyBlack,
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.h,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: CachedNetworkImage(
              imageUrl: article.urlToImage ?? '',
              width: 1.sw,
              height: 220.h,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) =>
                  Icon(Icons.broken_image_outlined),
              progressIndicatorBuilder: (context, child, loadingProgress) =>
                  CircularProgressIndicator(
                    color: isDark
                        ? AppColors.pramiryWhite
                        : AppColors.praimyBlack,
                  ),
            ),
          ),
          Text(
            article.title ?? "",
            style: context.textTheme.labelMedium!.copyWith(
              fontSize: 18.sp,
              color: isDark ? AppColors.pramiryWhite : AppColors.praimyBlack,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (article.author != null)
                SizedBox(
                  width: .5.sw,
                  child: Text(
                    'by:${article.author}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: AppColors.greyColor,
                    ),
                  ),
                ),
              SizedBox(width: 8.w),
              if (article.publishedAt != null)
                Text(
                  timeago.format(article.publishedAtDate),
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                  ),
                ),
            ],
          ),
        ],
      ),
      ),
    );
  }
}
