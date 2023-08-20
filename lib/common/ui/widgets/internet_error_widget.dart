import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class InternetError extends StatelessWidget {
  const InternetError({
    this.color,
    this.backgroundColor,
  });

  final Color? color;

  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          color: backgroundColor ?? Theme.of(context).colorScheme.background,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.signal_wifi_off_rounded, size: 18, color: color ?? Colors.red),
              const SizedBox(width: 15),
              Text(
                'internet_error'.tr(),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(color: color),
              ),
            ],
          ),
        ),
      );
}
