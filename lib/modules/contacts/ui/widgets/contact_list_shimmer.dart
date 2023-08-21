import 'package:flutter/material.dart';

import '../../../../common/ui/components/shimmer_container.dart';

class ContactListShimmer extends StatelessWidget {
  const ContactListShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: List.generate(
            6,
            (index) => const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Row(
                children: [
                  ShimmerContainer(
                    height: 60,
                    width: 60,
                    radius: 100,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      children: [
                        ShimmerContainer(
                          height: 10,
                        ),
                        SizedBox(height: 16),
                        ShimmerContainer(
                          height: 10,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
