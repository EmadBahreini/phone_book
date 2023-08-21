import 'package:flutter/material.dart';

class AddContactWidget extends StatelessWidget {
  const AddContactWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: () {},
        style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            backgroundColor: MaterialStateProperty.resolveWith((states) => Theme.of(context).primaryColor),
            overlayColor: MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.disabled)
                ? Theme.of(context).disabledColor
                : Theme.of(context).primaryColor.withOpacity(0.1)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            elevation: MaterialStateProperty.all(8),
            minimumSize: MaterialStateProperty.all(const Size(60, 60))),
        child: const Icon(Icons.add),
      );
}
