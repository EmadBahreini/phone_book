import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key, this.title, this.description}) : super(key: key);

  final String? title;
  final String? description;

  @override
  Widget build(BuildContext context) => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title ?? '---',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      );

  // @override
  // Widget build(BuildContext context) => CinPage(
  //       title: title ?? LocaleKeys.errPage_title.tr(),
  //       childrenPadding: const EdgeInsets.symmetric(horizontal: 12),
  //       children: [
  //         Padding(
  //           padding: const EdgeInsets.symmetric(vertical: 80),
  //           child: Column(
  //             children: [
  //               SvgPicture.asset(
  //                 Svgs.logo,
  //                 width: 70,
  //                 color: context.colors.textDisabled,
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.only(top: 12),
  //                 child: Text(
  //                   description ?? LocaleKeys.errPage_description.tr(),
  //                   style: context.theme.textTheme.titleSmall!.copyWith(color: context.colors.textCaption),
  //                   textAlign: TextAlign.center,
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.only(top: 15),
  //                 child: CinButton(
  //                   onPressed: () async {
  //                     context.pop();
  //                   },
  //                   width: 100,
  //                   type: ButtonType.secondary,
  //                   text: LocaleKeys.errPage_goBack.tr(),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     );
}
