import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phone_book/common/style/colorPalette/color_palette_helper.dart';

import '../../../../common/router/app_router.dart';

class AddContactWidget extends StatelessWidget {
  const AddContactWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => FloatingActionButton(
        onPressed: () => context.go(R.createContact),
        backgroundColor: context.colors.primary,
        splashColor: Colors.redAccent.withOpacity(0.2),
        child: const Icon(Icons.add),
      );
}
