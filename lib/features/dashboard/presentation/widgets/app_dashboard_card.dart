import 'package:ecommerce_flutter_web/common/widgets/rounded_container.dart';
import 'package:ecommerce_flutter_web/constants/app_colors.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class AppDashboardCard extends StatelessWidget {
  const AppDashboardCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppRoundedContainer(
      padding: const EdgeInsets.all(AppSizes.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ' Sales total',
            style: Theme.of(context).textTheme.headlineSmall?.apply(
                  color: AppColors.textSecondary,
                ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: AppSizes.spaceBtwSections),
          Row(
            children: [
              Text(
                '\$ 256.0',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.arrow_drop_up,
                          color: AppColors.success,
                        ),
                        Text(
                          '25%',
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.apply(color: AppColors.success),
                        ),
                      ],
                    ),
                    Text(
                      "Compared to Dec 2025",
                      style: Theme.of(context).textTheme.labelMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
