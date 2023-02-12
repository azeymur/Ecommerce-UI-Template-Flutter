import 'package:ecommerce_template/app_theme.dart';
import 'package:ecommerce_template/localization/locals.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final secondaryTitleLarge = Theme.of(context)
        .textTheme
        .titleLarge
        ?.copyWith(color: AppTheme.secondaryTextColor(context));

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 16.0),
          Text(Locals.of(context).loading, style: secondaryTitleLarge),
        ],
      ),
    );
  }
}
