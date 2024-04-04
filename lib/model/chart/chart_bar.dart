// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class chartBar extends StatelessWidget {
  const chartBar({super.key, required this.fill});

  final double fill;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Expanded(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: FractionallySizedBox(
            heightFactor: fill,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(7)),
                color: isDarkMode
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.primary.withOpacity(0.6),
              ),
            ),
          )),

      /// this will allow you to make height depends on the percentage
    );
  }
}
