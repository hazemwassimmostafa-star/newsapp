import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/common/extension/context_extension.dart';

class CustomErrorwidget extends StatelessWidget {
  const CustomErrorwidget({
    super.key,
    required this.errorMEssage,
    required this.onRefresh,
  });
  final String errorMEssage ;
  final void Function() onRefresh;
  @override
  Widget build(BuildContext context) {
    return Column( spacing: 10.h,
      children: [
        Text(errorMEssage, style: context.textTheme.bodyMedium),
        FilledButton.icon(
          onPressed: onRefresh,
          label: Text("refresh"),
          icon: Icon(Icons.refresh),
        ),
      ],
    );
  }
}
