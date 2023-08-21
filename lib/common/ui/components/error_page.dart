import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phone_book/common/style/appTheme/app_theme_helper.dart';
import 'package:phone_book/common/style/colorPalette/color_palette_helper.dart';
import 'package:phone_book/common/ui/components/button_component.dart';
import 'package:phone_book/common/ui/components/page_component.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key, this.title, this.description}) : super(key: key);

  final String? title;
  final String? description;

  @override
  Widget build(BuildContext context) => PageComponent(
        title: title ?? '',
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 80),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      description ?? 'Error',
                      style: context.theme.textTheme.titleSmall!.copyWith(color: context.colors.textCaption),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: ButtonComponent(
                      onPressed: () async {
                        context.pop();
                      },
                      width: 100,
                      type: ButtonType.secondary,
                      text: 'back_to_home'.tr(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
